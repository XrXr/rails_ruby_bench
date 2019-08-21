set -e

rvm install 2.6.3
rvm --default use 2.6.3 # If this error out check https://rvm.io/integration/gnome-terminal
gem install bundler -v1.17.3
gem install mailcatcher
