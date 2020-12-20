#!/bin/bash

echo "Start symlink script"

#------------------
# Check 
#------------------
CONFIG=$1

[[ ! -f ${1} ]] && { echo "Please input your config name"; exit 1; }

read -p "Please input your target folder: " TARGET
read -p "Please input your alternative folder: " ALTDIR
read -p "Please input your destination folder: " DIR

[[ ! -d ${TARGET} ]] && { echo "Error: ${TARGET} does not exist"; exit 1; }
[[ ! -d ${ALTDIR} ]] && { echo "Error: ${ALTDIR} does not exist"; exit 1; }
[[ ! -d ${DIR} ]] && { echo "Error: ${DIR} does not exist"; exit 1; }

#------------------
# Symlink files
#------------------
while IFS= read -r FILE; do 
	if [[ -f ${TARGET}/${FILE} ]]; then
        	ln -sv ${TARGET}/${FILE} ${DIR}
	elif [[ -f ${ALTDIR}/${FILE} ]]; then		
		cp -v ${ALTDIR}/${FILE} ${DIR}
	else
		echo "Error: ${FILE} does not exist in ${TARGET} & ${ALTDIR}"
    	fi
done < ${1} 

echo "Symlink script is Done"

