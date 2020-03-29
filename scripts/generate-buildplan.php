#!/usr/bin/php
<?php
require_once(__DIR__ . "/vendor/autoload.php");
use Symfony\Component\Yaml\Yaml as Yaml;
$yamlInline = 5;
$yamlIndent = 4;
$yamlFlags = 0;
$runsOn = "ubuntu-latest";

$dir = __DIR__;

$platforms = [
    "x86_64" => "ubuntu:bionic",
    "arm64v8" => "arm64v8/ubuntu:18.04",
    //"arm32v6" => "arm32v6/ubuntu:18.04",
];
$releases = [
    "apache",
    "nginx",
    "cli"
];
$phpVersions = [
    "5.6",
    "7.0",
    "7.1",
    "7.2",
    "7.3",
    "7.4",
];
$tagPrefixes = [
    "Docker Hub" => "docker.io/gone",
    "Github Registry" => "docker.pkg.github.com/goneio/base-image"
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

$setupSteps = [
    [
        "uses" => "actions/checkout@v1"
    ],[
        "name" => "Enable multiarch support",
        "run" => "docker run --rm --privileged multiarch/qemu-user-static --reset -p yes"
    ]
];

$loginSteps = [
    [
        "name" => "Login to Registry: Docker Hub",
        "run" => "docker login -u \${{secrets.DOCKER_HUB_USERNAME}} -p \${{secrets.DOCKER_HUB_PASSWORD}}",
    ],[
        "name" => "Login to Registry: GitHub",
        "run" => "docker login docker.pkg.github.com -u \${{secrets.DOCKER_GITHUB_USERNAME}} -p \${{secrets.DOCKER_GITHUB_PASSWORD}}"
    ]
];

$phpPackages = [];
$envs = [];
foreach($phpVersions as $phpVersion){
    $version = number_format($phpVersion,1);
    foreach ($phpPackagesAll as $package) {
        $phpPackages[$version][$package] = str_replace("phpXX-", "php{$version}-", $package);
        $phpPackages[$version]["phpXX"] = "php{$version}";
    }

    // remove APCU from before 7.0
    if($phpVersion < 7.0){
        unset($phpPackages[$version]['phpXX-apcu']);
    }

    // Remove mycrpt above 7.2, swap in libsodium
    if($phpVersion >= 7.2){
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
    "name" => "Gone.io Base Images",
    "on" => [
        "push" => true,
        "schedule" => [[
            "cron" => '0 4 * * TUE',
        ]]
    ],
    "jobs" => [],
];

// Linter
$yaml["jobs"]["LintDockerfile"]["name"] = "Lint Dockerfile";
$yaml["jobs"]["LintDockerfile"]["steps"][] = [
    "uses" => "actions/checkout@v1"
];
foreach(["Core", "Marshall", "PHP"] as $dockerfile) {
    $yaml["jobs"]["LintDockerfile"]["steps"][] = [
        "name" => "Hadolint {$dockerfile}",
        "run" => "docker run --rm -i hadolint/hadolint < Dockerfile.{$dockerfile}",
    ];
}

// Marshall
$yaml["jobs"]["Marshall"]["needs"] = ["LintDockerfile"];
$marshallImageName = "marshall:\${{ matrix.platform }}";
$yaml["jobs"]["Marshall"]["name"] = "Marshall \${{ matrix.platform }} \${{ matrix.registry }}";
$yaml["jobs"]["Marshall"]["strategy"]["matrix"]["platform"] = array_keys($platforms);
foreach($platforms as $platformName => $platformBaseImage) {
    $yaml["jobs"]["Marshall"]["env"]["BASE_IMAGE_" . $platformName] = $platformBaseImage;
}
$yaml["jobs"]["Marshall"]["steps"] = array_merge($setupSteps, $loginSteps);
$yaml["jobs"]["Marshall"]["steps"][] = [
    "name" => "Pull base image",
    "run" => "docker pull {$platformBaseImage} || true",
];
$yaml["jobs"]["Marshall"]["steps"][] = [
    "name" => "Pull previous build of {$marshallImageName}",
    "run" => "docker pull {$marshallImageName} || true",
];
$yaml["jobs"]["Marshall"]["steps"][] = [
    "name" => "Setup Marshall",
    "run" => "git rev-parse --short HEAD > marshall/marshall_version ; date '+%Y-%m-%d' > marshall/marshall_build_date ; hostname > marshall/marshall_build_host"
];
$yaml["jobs"]["Marshall"]["steps"][] = [
    "name" => "Build Image {$marshallImageName}",
    "run" => "docker build -f Dockerfile.Marshall --target marshall -t {$marshallImageName} --build-arg CORE_FROM=\$BASE_IMAGE_\${{ matrix.platform }} . "
];
foreach($tagPrefixes as $registryName => $prefix) {
    $yaml["jobs"]["Marshall"]["steps"][] = [
        "name" => "Tag Image for: {$registryName}",
        "run" => "docker tag {$marshallImageName} {$prefix}/{$marshallImageName}"
    ];
}
foreach($tagPrefixes as $registryName => $prefix) {
    $yaml["jobs"]["Marshall"]["steps"][] = [
        "name" => "Push Image to $registryName",
        "run" => "docker push {$prefix}/{$marshallImageName}"
    ];
}

// Cores
#$yaml["jobs"]["Core"]["name"] = "PHP \${{ matrix.platform }} Core (on x86_64)";
$yaml["jobs"]["Core"]["needs"] = ["Marshall"];
$yaml["jobs"]["Core"]["strategy"]["matrix"]["php"] = $phpVersions;
$yaml["jobs"]["Core"]["strategy"]["matrix"]["platform"] = array_keys($platforms);
$yaml["jobs"]["Core"]["env"] = $envs;
$yaml["jobs"]["Core"]["steps"] = array_merge($setupSteps, $loginSteps);
$yaml["jobs"]["Core"]["steps"][] = [
    "run" => "echo \"::set-output name=php_install_list_envvar::$(echo \"PHP_\${{ matrix.php }}\" | sed 's|\.||')\"",
    "id" => "install_envvar",
];
$imageNameCore = "php:core-\${{ matrix.php }}-\${{ matrix.platform }}";
$yaml["jobs"]["Core"]["steps"][] = [
    "name" => "Pull base image (marshall)",
    "run" => "docker pull gone/{$marshallImageName} || true",
];
$yaml["jobs"]["Core"]["steps"][] = [
    "name" => "Pull Previous Image",
    "run"  => "docker pull gone/$imageNameCore || true",
];
$yaml["jobs"]["Core"]["steps"][] = [
    "name" => "Build Image $imageNameCore",
    "run"  => "docker build -f Dockerfile.Core --target php-core --build-arg \"PHP_VERSION=\${{ matrix.php }}\" --build-arg \"PHP_PACKAGES=\$\${{ steps.install_envvar.outputs.php_install_list_envvar }}\" --build-arg \"CORE_FROM=gone/{$marshallImageName}\" -t $imageNameCore ."
];
foreach($tagPrefixes as $registryName => $prefix) {
    $yaml["jobs"]["Core"]["steps"][] = [
        "name" => "Tag Image for: {$registryName}",
        "run" => "docker tag {$imageNameCore} {$prefix}/{$imageNameCore}"
    ];
}
foreach($tagPrefixes as $registryName => $prefix) {
    $yaml["jobs"]["Core"]["steps"][] = [
        "name" => "Push Image to $registryName",
        "run" => "docker push {$prefix}/{$imageNameCore}"
    ];
}

// End containers
#$yaml["jobs"]["PHP"]["name"] = "PHP \${{ matrix.platform }} \${{ matrix.release }} (on x86_64)";
$yaml["jobs"]["PHP"]["needs"] = ["Core"];
$yaml["jobs"]["PHP"]["strategy"]["matrix"]["php"] = $phpVersions;
$yaml["jobs"]["PHP"]["strategy"]["matrix"]["release"] = $releases;
$yaml["jobs"]["PHP"]["strategy"]["matrix"]["platform"] = array_keys($platforms);
$imageNameRelease = "bi/php:\${{ matrix.release }}-\${{ matrix.php }}-\${{ matrix.platform }}";
$yaml["jobs"]["PHP"]["steps"] = array_merge($setupSteps, $loginSteps);

$yaml["jobs"]["PHP"]["steps"][] = [
    "name" => "Pull previous build",
    "run" => "docker pull gone/$imageNameRelease || true",
];
$yaml["jobs"]["PHP"]["steps"][] = [
    "name" => "Pull base image",
    "run"  => "docker pull gone/$imageNameCore || true",
];
$yaml["jobs"]["PHP"]["steps"][] = [
    "name" => "Build Image: \${{ matrix.registry }}/php-\${{ matrix.platform }}:\${{ matrix.release }}-\${{ matrix.php }}",
    "run"  => "docker build -f Dockerfile.PHP --target php-\${{ matrix.release }} --build-arg \"CORE_FROM=gone/${imageNameCore}\" -t ${imageNameRelease} ."
];

foreach($tagPrefixes as $registryName => $prefix) {
    $yaml["jobs"]["PHP"]["steps"][] = [
        "name" => "Tag Image for: {$registryName}",
        "run" => "docker tag {$imageNameRelease} {$prefix}/{$imageNameRelease}"
    ];
}
foreach($tagPrefixes as $registryName => $prefix) {
    $yaml["jobs"]["PHP"]["steps"][] = [
        "name" => "Push Image to $registryName",
        "run" => "docker push {$prefix}/{$imageNameRelease}"
    ];
}


$aliases = [];
foreach ($tagPrefixes as $registryName => $registryPrefix) {
    foreach (array_merge($releases, ["core"]) as $release) {
        $latestPHP = end($phpVersions);
        $aliases["{$registryPrefix}/php"] = "{$registryPrefix}/php:{$release}-{$latestPHP}-x86_64";
        $aliases["{$registryPrefix}/php:{$release}"] = "{$registryPrefix}/php:{$release}-{$latestPHP}-x86_64";
        foreach ($phpVersions as $phpVersion) {
            $aliases["{$registryPrefix}/php:{$release}-{$phpVersion}"] = "{$registryPrefix}/php:{$release}-{$phpVersion}-x86_64";
        }
    }
}

$yaml["jobs"]["Aliases"]["name"] = "Apply Aliases/Tags for common versions";
$yaml["jobs"]["Aliases"]["needs"] = ["Marshall", "PHP"];
$yaml["jobs"]["Aliases"]["steps"] = $loginSteps;
foreach($aliases as $from => $to) {
    $yaml["jobs"]["Aliases"]["steps"][] = [
        "name" => (string) "Tag alias {$from} to point to {$to}",
        "run" => "docker tag {$from} {$to}"
    ];
    $yaml["jobs"]["Aliases"]["steps"][] = [
        "name" => "Push alias {$from}",
        "run" => "docker push {$from}"
    ];
}

#unset($yaml['jobs']['Marshall']['needs'], $yaml['jobs']['Core']['needs'], $yaml['jobs']['PHP']['needs'], );
#unset($yaml['jobs']['Core']);
#unset($yaml['jobs']['PHP']);

foreach($yaml['jobs'] as &$job){
    $job['runs-on'] = $runsOn;
    $job['strategy']['fail-fast'] = false;
}

$outputFile = __DIR__ . "/../.github/workflows/{$workflowFile}";
file_put_contents($outputFile, Yaml::dump($yaml, $yamlInline, $yamlIndent, $yamlFlags));
$commandToClean = "docker run --rm -it -v {$dir}/../.github/workflows:/workdir mikefarah/yq yq r -P $workflowFile";
echo "Running:\n\t{$commandToClean}\n";
ob_start();
system($commandToClean);
$buff = ob_get_contents();
ob_end_clean();
file_put_contents($outputFile, $buff);

system("sed -i 's|push: true|push\: |g' $outputFile");