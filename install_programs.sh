if hash apt-get 2>/dev/null; then
    MANAGER="apt-get"
elif hash dnf 2>/dev/null; then
    MANAGER="dnf"
elif hash yum 2>/dev/null; then
    MANAGER="yum"
else
    echo "No package manager found. Aborting."
    exit 1
fi
sudo $MANAGER update
sudo $MANAGER -y install vim git python3 subversion build-essential

mkdir temp
cd temp

if ! hash python3 2>/dev/null; then
    wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tar.xz
    tar -xvf Python-3.4.3.tar.xz

    cd Python-3.4.3
    ./configure && make && sudo make install
    cd ..
fi

cd ..
sudo rm -rf ./temp

sudo pip3 install --upgrade pip
