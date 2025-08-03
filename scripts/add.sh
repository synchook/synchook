#!/bin/sh
SYNCHOOK_ENV_DIR1=~/.synchook
SYNCHOOK_ENV_DIR2=${PWD}/.synchook
ENV_FILE_PATH=${SYNCHOOK_ENV_DIR1}/.env

if [ ! -d $SYNCHOOK_ENV_DIR1 ]; then
    mkdir $SYNCHOOK_ENV_DIR1
    echo "SYNCHOOK_PATH=" > $ENV_FILE_PATH
fi
if [ -d $SYNCHOOK_ENV_DIR2 ]; then
    printf "Using environment directory path ${SYNCHOOK_ENV_DIR2}\n"
    ENV_FILE_PATH=${SYNCHOOK_ENV_DIR2}/.env
fi

SYNCHOOK_PATH=$(cat $ENV_FILE_PATH | grep SYNCHOOK_PATH | grep -v "#" | cut -f2 -d"=")

if [ -z "$SYNCHOOK_PATH" ]; then
    if [ -z "$1" ]; then
        printf "Please enter the absolute path of Synchook: "
        read -r SYNCHOOK_PATH
    else
        SYNCHOOK_PATH=$1
    fi
    perl -pi -e "s@SYNCHOOK_PATH=@SYNCHOOK_PATH=${SYNCHOOK_PATH}@g" $ENV_FILE_PATH
fi

if [ ! $(ls ${SYNCHOOK_PATH}/post-commit-synchook 2> /dev/null) ]; then
    echo "Seems like an invalid path since post-commit-synchook was not found!\n"
    printf "Exiting...\n\n"
else
    printf "\n\t\t\t\tPress ctrl-c key to cancel.\n\n"
    printf "Adding Synchook post-commit hook to the project at $PWD in 5 seconds...\033[0K\r"
    countdown=5
    while [ $countdown -gt 0 ]; do
        sleep 1
        countdown=$(($countdown-1))
        printf "Adding Synchook post-commit hook to the project at $PWD in $countdown seconds...\033[0K\r"
    done
    printf "\n\n"
    cd .git/hooks
    step1=$(ln -s ${SYNCHOOK_PATH}/post-commit post-commit && ls post-commit)
    step2=$(ln -s ${SYNCHOOK_PATH}/post-commit-synchook post-commit-synchook && ls post-commit-synchook)
    if [ -n "$step1" -a -n "$step2" ]; then
        echo "Added synchook."
    fi
    cd ../..
fi
