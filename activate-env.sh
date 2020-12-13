#! /bin/bash
# Alias function to activate pip environment. # To use, update bashrc with:
# alias ae=`source activate-pip-environment.sh`.

activate () {
  source $1
}

if [ ./ -ef ~ ]; then
  activate "${HOME}/base/bin/activate"
elif [ -z "$1" ]; then
  activate "`pwd`/venv/bin/activate"
else
  activate "`pwd`/$1/bin/activate"
fi

