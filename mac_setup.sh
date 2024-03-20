#!/bin/bash

echo "WARNING: This script will overwrite your ssh private key named : '~/.ssh/id_rsa', if it exists"
while :
do
  read -p "Press y/n: " -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Sit back and relax! Setting up your mac..."
    break ### <<<---- terminate the loop
  fi
  echo "\nYou entered N/n"
done

# install homebrew
echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# complete homebrew install
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/$USER/.zprofile
eval $(/opt/homebrew/bin/brew shellenv)


# install oh my zsh! => to add some bling
echo "Installing omzsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# to start vscode using `code .`
echo "setting up VS CODE..."

echo 'code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}' >> $HOME/.zshrc




# add vim configuration





# set python alias 
echo 'alias python="python3"' >> $HOME/.zshrc
echo 'alias pip="pip3"' >> $HOME/.zshrc
source $HOME/.zshrc

# python setup
pip install virtualenvwrapper
# get the path of virtualenvwrapper (suggested in the installation process)
v_wrappper_path=''

echo "
  export PATH='\$PATH:$v_wrapper_path'
  export WORKON_HOME=$HOME/.virtualenvs
  export PROJECT_HOME=$HOME/Devel
  source $v_wrapper_path/virtualenvwrapper.sh
" >> $HOME/.zshrc



# set up git
echo "setting up ssh rsa key..."
echo "creating SSH key"
cd ~
mkdir .ssh
cd .ssh
ssh-keygen -t rsa -b 4096 -C "amiayn@iitbhilai.ac.in"

eval "$(ssh-agent -s)"	# with time you can make this more robust
ssh-add --apple-use-keychain ~/.ssh/id_rsa

touch config
echo "Host github.com
  AddKeysToAgent yes
  UseKeychain yes 
  IdentityFile ~/.ssh/id_rsa
" >> config

# install the Github CLI
brew install gh
gh auth login


# install aws => https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
echo "setting up aws"
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg ./AWSCLIV2.pkg -target /
which aws
aws --version
aws configure

