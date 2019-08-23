#!/bin/bash

echo -e "\033[96mExtracting results...\033[39m"

python2 examples/extract_results.py $1 $2

if [ $? -ne 0 ]; then
    echo -e "\033[31m\033[1mFATAL ERROR:\033[0m\033[31m Failed to extract results. Aborting...\033[0m"
    exit 1
fi

echo -e "\033[96mChecking results\033[39m"

python2 examples/check_results.py $1 $2

if [ $? -ne 0 ]; then
    echo -e "\033[31m\033[1mFATAL ERROR:\033[0m\033[31m Check results failed. Aborting...\033[0m"
    exit 1
fi

echo -e "Reproduction was \033[92m\033[1mSUCCESSFUL!\033[39m\033[0m"
echo -e "Check \033[95mfigures/\033[39m for generated images, \033[95mresults/\033[39m for generated data"