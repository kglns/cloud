#!/bin/bash

# Install ruby in Debian/Ubuntu
RUBY_VERSION="2.7.1"
RAILS_VERSION="6.0.2.2"

# Ensure curl is installed
apt-get --yes install curl

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Install Dependencies
sudo apt-get update
sudo apt-get --yes install zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

# Install rbenv
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

# Install ruby
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION

ruby -v

# Install bundler and rails
gem install bundler
gem install rails -v "RAILS_VERSION"

rbenv rehash

rails -v

# Install postgres
apt-get --yes install postgresql-11 libpq-dev