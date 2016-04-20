#!/bin/bash
DOCKER_REPO_IMG_TAG='fredericomartini/php:5.6-dev'
#LOG_FILE 
LOG_FILE='/tmp/log-validation-phpcs-phpmd.txt'
IGNORE='vendor/*'
HOME_DIR=$(pwd)
FILES_TO_CHECK=$1
STANDARD_DIR=$2
TMP_DIR='/tmp/.tmp_validating'
################### Conf PHP CodeSniffer ####################
# ignore warnings
PHPCS_IGNORE_WARNINGS=1

# encoding
PHPCS_ENCODING='utf-8'


################### Conf PHP Mess Detector ###################
PHPMD_FORMAT='text'

##############################################################

# parse config
function validate_and_set_conf() {
    if [ ! -e "$STANDARD_DIR" ]; then
        echo 'Error!!'
        echo "Not found rules to validate on: $STANDARD_DIR verify if are running the script on root dir and the rules *.xml are passed"
        exit 0
    fi

    #### set var's #####

    #standard_dir
    PHP_CS_STANDARD_DIR="$STANDARD_DIR/ruleset.xml"
    PHP_MD_STANDARD_DIR="$STANDARD_DIR/ruleset.xml"
    PHPCS_STANDARD="--standard=$PHP_CS_STANDARD_DIR"
    PHPMD_STANDARD="$PHP_MD_STANDARD_DIR"

    # set conf PhpCs
    if [ "$IGNORE" != "" ]; then
        PHPCS_IGNORE="--ignore=$IGNORE"
    else
        PHPCS_IGNORE=""
    fi
    
    if [ "$PHPCS_SNIFFS" != "" ]; then
        PHPCS_SNIFFS="--sniffs=$PHPCS_SNIFFS"
    else
        PHPCS_SNIFFS=""
    fi
    
    if [ "$PHPCS_ENCODING" != "" ]; then
        PHPCS_ENCODING="--encoding=$PHPCS_ENCODING"
    else
        PHPCS_ENCODING=""
    fi
    
    if [ "$PHPCS_IGNORE_WARNINGS" == "1" ]; then
        PHPCS_IGNORE_WARNINGS="-n"
    else
        PHCS_IGNORE_WARNINGS=""
    fi

    #set conf PhpMD
    if [ "$IGNORE" != "" ]; then
        PHPMD_IGNORE="--exclude $IGNORE"
    else
        PHPMD_IGNORE=""
    fi
    
    if [ "$PHPMD_FORMAT" != "" ]; then
        PHPMD_FORMAT="$PHPMD_FORMAT"
    else
        PHPMD_FORMAT="text"
    fi

}

#check files
function files_to_check() {
    if [ ! -n "$FILES_TO_CHECK" ]; then
        echo 'Error, Must be passed file or folder to validate!'
        exit
    fi
}

#codeSniffer
function validate_phpcs() {
    MSG="--------------- Error's found with Php CodeSniffer ---------------\n"
    PHPCS_OUTPUT=$(docker run --rm -v $HOME_DIR/$FILES_TO_CHECK:$HOME_DIR/$FILES_TO_CHECK -v $PHP_CS_STANDARD_DIR:$PHP_CS_STANDARD_DIR $DOCKER_REPO_IMG_TAG phpcs -s --colors $PHPCS_IGNORE_WARNINGS $PHPCS_STANDARD $PHPCS_ENCODING $PHPCS_IGNORE $PHPCS_SNIFFS $HOME_DIR/$FILES_TO_CHECK)

    #record log
    if [ -n "$PHPCS_OUTPUT" ]; then #error
        echo -e $MSG >> $LOG_FILE
        echo -e "$PHPCS_OUTPUT" >> $LOG_FILE
        echo -e "----------------------------------------------------------------\n\n" >> $LOG_FILE
    fi
}

#phpMessDetector
function validate_phpmd() {
    MSG="--------------- Error's found with Php Mess Detector ---------------\n"
    PHPMD_OUTPUT=$(docker run --rm -v $HOME_DIR/$FILES_TO_CHECK:$HOME_DIR/$FILES_TO_CHECK -v $PHP_MD_STANDARD_DIR:$PHP_MD_STANDARD_DIR $DOCKER_REPO_IMG_TAG phpmd $HOME_DIR/$FILES_TO_CHECK $PHPMD_FORMAT $PHPMD_IGNORE $PHPMD_STANDARD)

    #record log
    if [ -n "$PHPMD_OUTPUT" ]; then #error
        echo -e $MSG >> $LOG_FILE
        echo -e "$PHPMD_OUTPUT" >> $LOG_FILE
        echo -e "----------------------------------------------------------------\n" >> $LOG_FILE
    fi
}

function clean_logs() {
    #delete old logs
    rm -rf $LOG_FILE > /dev/null 2>&1
}

function finish() {
    #file /tmp/log-validation.txt exist.. then error
    if [ ! -e "$LOG_FILE" ]; then
        echo "Error not found, congratulations! :)"
    else
        cat "$LOG_FILE" | less
    fi
}

function main() {
    validate_and_set_conf
    files_to_check
    clean_logs
    echo -e 'Validating code with PHP Code Sniffer...\n'
    sleep 1 
    validate_phpcs
    echo -e 'Validating code with PHP Mess Detector...\n'
    sleep 1
    validate_phpmd
    finish
}

main

