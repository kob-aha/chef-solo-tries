#!/bin/bash

CHEFDK_PATH=/tmp/chefdk.rpm

curl https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chefdk-0.4.0-1.x86_64.rpm -o $CHEFDK_PATH
rpm -i $CHEFDK_PATH
cp setup-chef.sh /etc/profile.d/
