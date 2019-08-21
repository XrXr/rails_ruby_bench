# To be run as "ubuntu" user with sudo access.

set -e

#sleep 30 # Time for OS to boot properly during AMI build

# No ~/.bash_profile? Make one that sources ~/.bashrc. Otherwise you won't like what happens
# if rvm creates it for you.
if [ ! -f ~/.bash_profile ]; then
   cat >~/.bash_profile <<EOF
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
EOF
fi

sudo apt-get update

# Basics
whoami > /tmp/username
sudo add-apt-repository ppa:chris-lea/redis-server
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get -yqq update
sudo apt-get -yqq --allow-unauthenticated install python-software-properties vim curl expect debconf-utils git-core build-essential zlib1g-dev libssl-dev openssl libcurl4-openssl-dev libreadline6-dev libpcre3 libpcre3-dev imagemagick postgresql postgresql-contrib-9.5 libpq-dev postgresql-server-dev-9.5 redis-server advancecomp gifsicle jhead jpegoptim libjpeg-turbo-progs optipng pngcrush pngquant gnupg2 brotli
sudo apt-get install g++-7 -y
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 \
                         --slave /usr/bin/g++ g++ /usr/bin/g++-7
gcc --version
g++ --version
sudo /etc/init.d/redis-server start

# Ruby
curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
curl -sSL https://get.rvm.io | bash -s stable
echo 'gem: --no-document' >> ~/.gemrc

# Node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
