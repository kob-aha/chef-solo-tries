#!/bin/sh

# Making sure rbenv is installed successfully

which rbenv >> /dev/null 2>&1

if [ $? -gt 0 ]; then
  echo "rbenv is not installed. Did you provision the machine properly?"
  exit 1
fi

rbenv install 2.1.5
rbenv global 2.1.5
ruby -v

if [ $? -gt 0 ]; then
  echo "Error installing ruby. See log above"
  exit 1
fi

# Configure rubygems to ignore documentation and install bundler
echo "gem: --no-ri --no-rdoc" > /home/vagrant/.gemrc

# Installing Ruby --- End ---

echo "Installing chef solo gems"

export USE_SYSTEM_GECODE=1

gem install -V 'knife-solo'

if [ $? -gt 0 ]; then
  echo "Error installing knife-solo. See log above"
  exit 1
fi

gem install -V 'berkshelf'

if [ $? -gt 0 ]; then
  echo "Error installing berkshelf. See log above"
  exit 1
fi

echo "Finish installing chef solo gems"
