#!/bin/bash


set -e

mkdir -p /tmp/devops-test || echo "Directory already exists"
cd /tmp/devops-test || echo "Cannot change directory"
touch file1.txt || echo "Cannot create file"
mkdir  /tmp/devops-test || echo "Directory already exists"
