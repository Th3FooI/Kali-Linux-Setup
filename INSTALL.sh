#!/bin/bash 

if [ $(id -u) -ne 1 ]; then
	echo "This script must NOT be run as root."
	exit 1
fi

echo "Installing Xerxes..."
cd ~
git clone https://github.com/sepehrdaddev/Xerxes.git ~
cd Xerxes
git submodule update --init --recursive
mkdir build
cd build 
cmake ..
make 

cd ~

echo "Xerxes installation complete."



echo "Installing Pyenv"

curl https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
exec $SHELL
pyenv install 2.7.18
pyenv global 2.7.18
pyenv versions
python2 --version
python3 --version
pip2 --version
pip3 --version

echo "Pyenv installed."

exit 0 