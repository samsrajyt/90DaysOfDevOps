#!/bin/bash


if [ "$EUID" -ne 0 ]; then echo "Run as root"; exit 1; fi

packages_list=("nginx" "curl" "wget")

for i in "${packages_list[@]}";
do


        echo "########################Checking if package "$1" exists......##########################################"

        if  dpkg -s $i &> /dev/null
        then
                echo "Package $i is already installed"

        else
                echo "Installing Package $i"
                apt install $i &> /dev/null
                echo "Package installed"


        fi
done

