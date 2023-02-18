#!/bin/bash

#Avoid which. Not only is it an external process you're launching for doing very little (meaning builtins like hash, type or command are way cheaper),
#you can also rely on the builtins to actually do what you want, while the effects of external commands can easily vary from system to system.
if ! command -v stow &> /dev/null
then
    echo "❗stow could not be found, installing it now.❗"
    brew install stow
    exit
fi
