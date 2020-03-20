#!/usr/bin/php
<?php

use Symfony\Component\Yaml\Yaml as Yaml;
$yamlInline = 5;
$yamlIndent = 4;
$yamlFlags = 0;
$runsOn = "ubuntu-latest";
$setupSteps = [
    [
        "uses" => "actions/checkout@v1"
    ],[
        "name" => "Login to Registry: Docker Hub",
        "run" => "docker login -u \${{secrets.DOCKER_HUB_USERNAME}} -p \${{secrets.DOCKER_HUB_PASSWORD}}",
    ],[
        "name" => "Login to Registry: GitHub",
        "run" => "docker login docker.pkg.github.com -u \${{secrets.DOCKER_GITHUB_USERNAME}} -p \${{secrets.DOCKER_GITHUB_PASSWORD}}"
    ]
];
$dir = __DIR__;

require_once(__DIR__ . "/vendor/autoload.php");
$platforms = [
    "x86_64",
    #"arm64v8",
];
$releases = [
#    "apache",
#    "nginx",
    "cli"
];
$phpVersions = [
    #"5.6",
    #"7.0",
    #"7.1",
    #"7.2",
    #"7.3",
    "7.4",
];
$tagPrefixes = [
    "Docker Hub" => "gone",
#    "Github Registry" => "docker.pkg.github.com/goneio/base-image"
];

$phpPackagesAll = [
    "git",
    "mariadb-client",
    "php-apcu",
    "php-xdebug",
    "php-bcmath",
    "php-bz2",
    "php-cli",
    "php-curl",
    "php-gd",
    "php-imap",
    "php-intl",
    "php-json",
    "php-ldap",
    "php-mbstring",
    "php-mcrypt",
    "php-sodium",
    "php-memcache",
    "php-memcached",
    "php-mongodb",
    "php-mysql",
    "php-opcache",
    "php-pgsql",
    "php-phpdbg",
    "php-pspell",
    "php-redis",
    "php-soap",
    "php-sqlite",
    "php-xml",
    "php-zip",
    "postgresql-client"
];
$phpPackages = [];
$envs = [];
foreach($phpVersions as $phpVersion){
    $version = number_format($phpVersion,1);
    foreach ($phpPackagesAll as $package) {
        $phpPackages[$version][$package] = str_replace("php-", "php{$version}-", $package);
    }

    if($phpVersion > 7.2){
        unset($phpPackages[$version]['php-mcrypt']);
    }else{
        unset($phpPackages[$version]['php-sodium']);
    }

    sort($phpPackages[$version]);

    $installString = implode(" ", $phpPackages[$version]);
    $envs["PHP_" . $phpVersion] = $installString;
}


$workflowFile = "build.yml";
$yaml = [
    "name" => "Gone.io/PHP",
    "on" => [
        "push" => true,
        "schedule" => [
            "cron" => "0 4 * * TUE",
        ]
    ],
    "jobs" => [],
];

// Marshall
$yaml["jobs"]["Marshall"]["runs-on"] = $runsOn;
$yaml["jobs"]["Marshall"]["strategy"]["matrix"]["platform"] = $platforms;
$yaml["jobs"]["Marshall"]["strategy"]["matrix"]["registry"] = array_values($tagPrefixes);
$yaml["jobs"]["Marshall"]["steps"] = $setupSteps;
$yaml["jobs"]["Marshall"]["steps"][] = [
    "name" => "Setup Marshall",
    "run" => "git rev-parse --short HEAD > marshall/marshall_version ; date '+%Y-%m-%d %H:%M:%S' > marshall/marshall_build_date ; hostname > marshall/marshall_build_host"
];
$yaml["jobs"]["Marshall"]["steps"][] = [
    "name" => "Build Image \${{ matrix.registry }}/marshall-\${{ matrix.platform }}:latest",
    "run" => "docker build --target marshall -t \${{ matrix.registry }}/marshall-\${{ matrix.platform }}:latest ."
];
$yaml["jobs"]["Marshall"]["steps"][] = [
    "name" => "Push Image \${{ matrix.registry }}/marshall-\${{ matrix.platform }}:latest",
    "run" => "docker push \${{ matrix.registry }}/marshall-\${{ matrix.platform }}:latest"
];

// Cores
$yaml["jobs"]["Core"]["runs-on"] = $runsOn;
$yaml["jobs"]["Core"]["needs"] = ["Marshall"];
$yaml["jobs"]["Core"]["strategy"]["matrix"]["php"] = $phpVersions;
$yaml["jobs"]["Core"]["strategy"]["matrix"]["platform"] = $platforms;
$yaml["jobs"]["Core"]["strategy"]["matrix"]["registry"] = array_values($tagPrefixes);
$yaml["jobs"]["Core"]["steps"] = $setupSteps;
$yaml["jobs"]["Core"]["steps"][] = [
    "name" => "Build Image \${{ matrix.registry }}/php-\${{ matrix.platform }}:core-\${{ matrix.php }}",
    "run" => "docker build --target php-core --build-arg \"PHP_VERSION=\${{ matrix.php }}\" --build-arg \"PHP_PACKAGES=\$PHP_\${{ matrix.php }}\" -t \${{ matrix.registry }}/php-\${{ matrix.platform }}:core-\${{ matrix.php }} ."
];
$yaml["jobs"]["Core"]["steps"][] = [
    "name" => "Push Image \${{ matrix.registry }}/php-\${{ matrix.platform }}:core-\${{ matrix.php }}",
    "run" => "docker push \${{ matrix.registry }}/php-\${{ matrix.platform }}:core-\${{ matrix.php }}"
];
$yaml["jobs"]["Core"]["env"] = $envs;

// End containers
$yaml["jobs"]["PHP"]["runs-on"] = $runsOn;
$yaml["jobs"]["PHP"]["needs"] = ["Core"];
$yaml["jobs"]["PHP"]["strategy"]["matrix"]["php"] = $phpVersions;
$yaml["jobs"]["PHP"]["strategy"]["matrix"]["release"] = $releases;
$yaml["jobs"]["PHP"]["strategy"]["matrix"]["platform"] = $platforms;
$yaml["jobs"]["PHP"]["strategy"]["matrix"]["registry"] = array_values($tagPrefixes);
$yaml["jobs"]["PHP"]["steps"] = $setupSteps;
$yaml["jobs"]["PHP"]["steps"][] = [
    "name" => "Setup",
    "run" => "git rev-parse --short HEAD > marshall/marshall_version ; date '+%Y-%m-%d %H:%M:%S' > marshall/marshall_build_date ; hostname > marshall/marshall_build_host"
];
$yaml["jobs"]["PHP"]["steps"][] = [
    "name" => "Build Image \${{ matrix.registry }}/php-\${{ matrix.platform }}:\${{ matrix.release }}-\${{ matrix.php }}",
    "run" => "docker build --target php-\${{ matrix.release }} --build-arg \"PHP_VERSION=\${{ matrix.php }}\" --build-arg \"PHP_PACKAGES=\$PHP_\${{ matrix.php }}\" -t \${{ matrix.registry }}/php-\${{ matrix.platform }}:\${{ matrix.release }}-\${{ matrix.php }} ."
];
$yaml["jobs"]["PHP"]["steps"][] = [
    "name" => "Push Image \${{ matrix.registry }}/php-\${{ matrix.platform }}:core-\${{ matrix.php }}",
    "run" => "docker push \${{ matrix.registry }}/php-\${{ matrix.platform }}:core-\${{ matrix.php }}"
];

$outputFile = __DIR__ . "/../.github/workflows/{$workflowFile}";
file_put_contents($outputFile, Yaml::dump($yaml, $yamlInline, $yamlIndent, $yamlFlags));
$commandToClean = "docker run --rm -it -v {$dir}/../.github/workflows:/workdir mikefarah/yq yq r -P $workflowFile";
echo "Running:\n\t{$commandToClean}\n";
ob_start();
system($commandToClean);
$buff = ob_get_contents();
ob_end_clean();
file_put_contents($outputFile, $buff);
