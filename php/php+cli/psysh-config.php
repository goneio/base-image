<?php
$autoloadersThatMayExist = [
    '/app/vendor/autoload.php',
    '/app/bootstrap.php',
];

$defaultIncludes = [];

foreach($autoloadersThatMayExist as $autoloader){
    if(file_exists($autoloader)){
        $defaultIncludes[] = $autoloader;
    }
}

$animals = ['🐟', '🐁', '🐄', '🐆', '🐉', '🐍', '🐌', '🐋', '🐊','🐕','🐔', '🐒','🐢'];

return [
    'commands' => [
        new \Psy\Command\ParseCommand,
    ],
    'defaultIncludes' => $defaultIncludes,
    'startupMessage' => sprintf('You are on <error>%s</error> Uptime: <info>%s</info>', trim(shell_exec('hostname')), trim(shell_exec('uptime -p'))),
    //'prompt' => $animals[array_rand($animals)],
    'updateCheck' => 'never',
    'useBracketedPaste' => true
];