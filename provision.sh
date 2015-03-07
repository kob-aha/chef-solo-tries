#!/bin/bash

# Installing Ruby --- Start ---

sudo yum update
sudo yum install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev openssl-devel gecode-devel gcc-c++

# Install ruby using rbenv

RBENV_FOLDER=/usr/local/rbenv
RBENV_FILE=/etc/profile.d/rbenv.sh

groupadd rubies
usermod -a -G rubies vagrant

echo "export RBENV_ROOT=$RBENV_FOLDER" > $RBENV_FILE

git clone git://github.com/sstephenson/rbenv.git $RBENV_FOLDER
echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> $RBENV_FILE

git clone git://github.com/sstephenson/ruby-build.git $RBENV_FOLDER/plugins/ruby-build
echo 'export PATH="$RBENV_ROOT/plugins/ruby-build/bin:$PATH"' >> $RBENV_FILE
echo 'eval "$(rbenv init -)"' >> $RBENV_FILE

git clone https://github.com/sstephenson/rbenv-gem-rehash.git $RBENV_FOLDER/plugins/rbenv-gem-rehash

# Changing group to avoid permission errors. Taken from here: http://blakewilliams.me/blog/system-wide-rbenv-install
chgrp -R rubies $RBENV_FOLDER
chmod -R g+rwxXs $RBENV_FOLDER

chmod +x $RBENV_FILE

echo '---------------------------------'
echo '    rbenv installed system wide to /usr/local/rbenv'
echo '    In order to use knife solo, Log in to the machine using "vagrant up" '
echo '    and run "/vagrant/install-knife-solo.sh '
echo '---------------------------------'
