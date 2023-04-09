#! /bin/bash

if [[ "$PWD" =~ secimport ]]
then
    echo "Running pre-commit hooks...";
else
    echo "Please run this script from the secimport root directory.";
    exit 1;
fi

python3 -m ruff --fix .
doctoc
pre-commit
export PYTHONPATH=$(pwd):$PYTHONPATH
cd docker/
./build.sh

# Run unit tests inside container
# cd ..
# export KERNEL_VERSION=`docker run --rm -it alpine uname -r | cut -d'-' -f1`
# docker run --rm --name=secimport --privileged -v "$(pwd)/secimport":"/workspace/secimport/" -v "$(pwd)/tests":"/workspace/tests/" -it secimport:${KERNEL_VERSION} "/workspace/run_tests.sh"
