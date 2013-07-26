#!/bin/bash

if [[ $1 == 'php' ]]; then
    git clone git@github.com:ruian/php-starter $2
    composer selfupdate
    composer install
fi

if [[ $1 == 'silex' ]]; then
    git clone git@github.com:lyrixx/Silex-Kitchen-Edition $2
    composer selfupdate
    composer install
fi

if [[ $1 == 'symfony' ]]; then
    git clone git@github.com:symfony/symfony $2
    composer selfupdate
    composer install
fi

if [[ $1 == 'symfony-standard' ]]; then
    git clone git@github.com:symfony/symfony-standard $2
    composer selfupdate
    composer install
fi
