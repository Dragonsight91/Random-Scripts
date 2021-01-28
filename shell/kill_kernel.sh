#!/bin/bash
# WARNING: DO NOT RUN THIS SCRIPT. THIS WAS CREATED AS JOKE AND SHOULD NEVER BE USED ANYWHERE.
# IF YOU DO RUN THIS SCRIPT, I AM NOT LIABLE FOR ANY DAMAGE IT MAY CAUSE, YOU RUN THIS ON YOUR OWN RISK

# an exercise in things that happen when the linux kernel annoys you.
# welcome to linux, where you can just kill the kernel and not worry 
# about its RAM management
for i in `ps --ppid 2 -p 2 -o uname,pid,ppid,cmd,cls | awk -F" " '{print $2}'`; 
do 
    sudo -KILL $i;
done;