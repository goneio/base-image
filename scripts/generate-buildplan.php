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
    "phpXX",
    "phpXX-apcu",
    "phpXX-xdebug",
    "phpXX-bcmath",
    "phpXX-bz2",
    "phpXX-cli",
    "phpXX-curl",
    "phpXX-gd",
    "phpXX-imap",
    "phpXX-intl",
    "phpXX-json",
    "phpXX-ldap",
    "phpXX-mbstring",
    "phpXX-mcrypt",
    "php-sodium",
    "phpXX-memcache",
    "phpXX-memcached",
    "phpXX-mongodb",
    "phpXX-mysql",
    "phpXX-opcache",
    "phpXX-pgsql",
    "phpXX-phpdbg",
    "phpXX-pspell",
    "phpXX-redis",
    "phpXX-soap",
    "phpXX-sqlite",
    "phpXX-xml",
    "phpXX-zip",
    "postgresql-client"
];
$phpPackages = [];
$envs = [];
foreach($phpVersions as $phpVersion){
    $version = number_format($phpVersion,1);
    foreach ($phpPackagesAll as $package) {
        $phpPackages[$version][$package] = str_replace("phpXX-", "php{$version}-", $package);
        $phpPackages[$version]["phpXX"] = "php{$version}";
    }

    if($phpVersion > 7.2){
        unset($phpPackages[$version]['phpXX-mcrypt']);
    }else{
        unset($phpPackages[$version]['php-sodium']);
    }

    sort($phpPackages[$version]);

    $installString = implode(" ", $phpPackages[$version]);
    $envs["PHP_" . str_replace(".","",$phpVersion)] = $installString;
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

// Linter
$yaml["jobs"]["LintDockerfile"]["runs-on"] = $runsOn;
$yaml["jobs"]["LintDockerfile"]["name"] = "Lint Dockerfile";
$yaml["jobs"]["LintDockerfile"]["steps"][] = [
    "uses" => "actions/checkout@v1"
];
$yaml["jobs"]["LintDockerfile"]["steps"][] = [
    "name" => "Hadolint",
    "run" => "docker run --rm -i hadolint/hadolint < Dockerfile",
];

// Marshall
$yaml["jobs"]["Marshall"]["runs-on"] = $runsOn;
$yaml["jobs"]["Core"]["needs"] = ["LintDockerfile"];

$yaml["jobs"]["Marshall"]["name"] = "Marshall multi-process running base image";
$yaml["jobs"]["Marshall"]["strategy"]["matrix"]["platform"] = $platforms;
$yaml["jobs"]["Marshall"]["strategy"]["matrix"]["registry"] = array_values($tagPrefixes);
$yaml["jobs"]["Marshall"]["steps"] = $setupSteps;
$yaml["jobs"]["Marshall"]["steps"][] = [
    "name" => "Pull previous build",
    "run" => "docker pull \${{ matrix.registry }}/marshall-\${{ matrix.platform }}:latest",
];
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
$yaml["jobs"]["Core"]["needs"] = ["LintDockerfile", "Marshall"];
$yaml["jobs"]["Core"]["strategy"]["matrix"]["php"] = $phpVersions;
$yaml["jobs"]["Core"]["strategy"]["matrix"]["platform"] = $platforms;
$yaml["jobs"]["Core"]["strategy"]["matrix"]["registry"] = array_values($tagPrefixes);
$yaml["jobs"]["Core"]["steps"] = $setupSteps;
$yaml["jobs"]["Core"]["steps"][] = [
    "run" => "echo \"::set-output name=php_install_list_envvar::$(echo \"PHP_\${{ matrix.php }}\" | sed 's|\.||')\"",
    "id" => "install_envvar",
];
$imageNameCore = "\${{ matrix.registry }}/php-\${{ matrix.platform }}:core-\${{ matrix.php }}";
$yaml["jobs"]["Core"]["steps"][] = [
    "name" => "Build Image $imageNameCore",
    "run"  => "docker build --target php-core --build-arg \"PHP_VERSION=\${{ matrix.php }}\" --build-arg \"PHP_PACKAGES=\$\${{ steps.install_envvar.outputs.php_install_list_envvar }}\" -t $imageNameCore ."
];
$yaml["jobs"]["Core"]["steps"][] = [
    "name" => "Push Image $imageNameCore",
    "run"  => "docker push $imageNameCore"
];
$yaml["jobs"]["Core"]["env"] = $envs;

// End containers
$yaml["jobs"]["PHP"]["runs-on"] = $runsOn;
#$yaml["jobs"]["PHP"]["needs"] = ["Core"];
$yaml["jobs"]["PHP"]["strategy"]["matrix"]["php"] = $phpVersions;
$yaml["jobs"]["PHP"]["strategy"]["matrix"]["release"] = $releases;
$yaml["jobs"]["PHP"]["strategy"]["matrix"]["platform"] = $platforms;
$yaml["jobs"]["PHP"]["strategy"]["matrix"]["registry"] = array_values($tagPrefixes);
$yaml["jobs"]["PHP"]["steps"] = $setupSteps;
$imageNameRelease = "\${{ matrix.registry }}/php-\${{ matrix.platform }}:\${{ matrix.release }}-\${{ matrix.php }}";
$yaml["jobs"]["Marshall"]["steps"][] = [
    "name" => "Pull previous build",
    "run" => "docker pull $imageNameRelease",
];
$yaml["jobs"]["PHP"]["steps"][] = [
    "name" => "Pull base image",
    "run"  => "docker pull $imageNameCore",
];
$yaml["jobs"]["PHP"]["steps"][] = [
    "name" => "Build Image: \${{ matrix.registry }}/php-\${{ matrix.platform }}:\${{ matrix.release }}-\${{ matrix.php }}",
    "run"  => "docker build --target php-\${{ matrix.release }} --build-arg \"CORE_FROM=\" -t \${{ matrix.registry }}/php-\${{ matrix.platform }}:\${{ matrix.release }}-\${{ matrix.php }} ."
];
$yaml["jobs"]["PHP"]["steps"][] = [
    "name" => "Push Image: $imageNameRelease",
    "run"  => "docker push $imageNameRelease",
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
