#!/bin/bash
# this one really just generates a line for fstab
# i got annoyed and made this script

if [[ ! -z $1 ]] && [[ ! -z $2 ]]; then
    drive_data=$(blkid $1 | awk '{for(i=1;i<=NF;i++){ if($i ~ /\<TYPE/ || $i ~ /^UUID=.*/){sub(//,""); printf $i" "} } print ""};')

    if [[ -z $drive_data ]]; then
        echo "cannot generate fstab entry for device"
        exit 0
    fi 
    
    if [[ ! -z $3 ]]; then
        options=$3
    else
        options="defaults"
    fi
    echo $drive_data | awk -F "\"" -v options="$options" -v mountpoint="$2" '{if ($0 ~ /^TYPE/) {printf ""} else {print "UUID="$2, mountpoint, $4, options, "0 2"}}'
else
    echo "genfstab_line by Dragonsight91"
    echo "Usage: genfstab_line <dev> <mountpoint> [<mountoptions>]"
fi