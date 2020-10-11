#!/bin/bash

# append-conda-env-var - A script to append environmental vars to conda environmental vars file
TITLE="Append environmental variables to conda environmental vars file."

##### Functions

usage()
{
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
    echo $TITLE
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
    echo "usage: [[[--key key ] [--value value][-i]] | [-h]]"
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
}

##### Main

usage

if [ -z "$CONDA_PREFIX" ]; then
  echo "Error: No active conda environment. Please activate a conda environment first."
  exit 1
fi

interactive=

while [ "$1" != "" ]; do
    case $1 in
        --key )                 shift
                                key="$1"
                                ;;
        --value )               shift
                                value="$1"
                                ;;
        -i | --interactive )    interactive=1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

if [ "$interactive" = "1" ]; then

    response1=
    response2=

    read -p "Enter name of environmental key [$key] > " response1
    if [ -n "$response1" ]; then
        key="$response1"
    fi

    read -p "Enter name of environmental value [$value] > " response2
    if [ -n "$response2" ]; then
        value="$response2"
    fi
fi

echo "export $key=\"$value\"" >> $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
echo "unset $key" >> $CONDA_PREFIX/etc/conda/deactivate.d/env_vars.sh

echo "Added $key: to $CONDA_PREFIX"
