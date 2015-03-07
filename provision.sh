#!/bin/bash

# Installing Ruby --- Start ---

sudo yum update
sudo yum install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev openssl-devel gecode-devel gcc-c++

# Install ruby using rbenv

#RBENV_FOLDER=/home/vagrant/.rbenv
#RBENV_FILE=/home/vagrant/.bashrc
RBENV_FOLDER=/usr/local/rbenv
RBENV_FILE=/etc/profile.d/rbenv.sh

#su vagrant
#cd /home/vagrant
git clone git://github.com/sstephenson/rbenv.git $RBENV_FOLDER
#echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vagrant/.bashrc
echo 'export PATH="$RBENV_FOLDER/bin:$PATH"' >> $RBENV_FILE

git clone git://github.com/sstephenson/ruby-build.git $RBENV_FOLDER/plugins/ruby-build
echo 'export PATH="$RBENV_FOLDER/plugins/ruby-build/bin:$PATH"' >> $RBENV_FILE
echo 'eval "$(rbenv init -)"' >> $RBENV_FILE

git clone https://github.com/sstephenson/rbenv-gem-rehash.git $RBENV_FOLDER/plugins/rbenv-gem-rehash

chmod +x $RBENV_FILE

su vagrant
source ~/.bashrc

rbenv install 2.1.5
rbenv global 2.1.5
ruby -v

if [ $? -gt 0 ]; then
  echo "Error installing ruby. See log above"
  exit 1
fi

# Configure rubygems to ignore documentation and install bundler

echo "gem: --no-ri --no-rdoc" > /home/vagrant/.gemrc
#echo "Installing bundler"
#gem install bundler
#echo "Finish installing bundler"

# Installing Ruby --- End ---

# Install chef solo --- Start ---

echo "Installing chef solo gems"
/vagrant/install-knife-solo.sh
echo "Finish installing chef solo gems"

# Install chef solo --- End ---
