#!/bin/bash

if ! command -v stow &> /dev/null
then
    echo "❗stow could not be found, installing it now.❗"
    brew install stow
    exit
fi
