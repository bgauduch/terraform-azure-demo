#!/usr/bin/env sh

mkdir -p "$(pwd "$0")"/ssh
ssh-keygen -t rsa -b 2048 -f "$(pwd "$0")"/ssh/azure-vm-rsa