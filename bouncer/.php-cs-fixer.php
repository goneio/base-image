<?php
$finder = PhpCsFixer\Finder::create();
$finder->in(__DIR__);

return (new PhpCsFixer\Config)
    ->setRiskyAllowed(true)
    ->setHideProgress(false)
    ->setRules([
        '@PSR2' => true,
        'strict_param' => true,
        'array_syntax' => ['syntax' => 'short'],
        '@PhpCsFixer' => true,
        '@PHP73Migration' => true,
        'no_php4_constructor' => true,
        'no_unused_imports' => true,
        'no_useless_else' => true,
        'no_superfluous_phpdoc_tags' => true,
        'void_return' => true,
        'yoda_style' => false,
    ])
    ->setFinder($finder)
    ;
