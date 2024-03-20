#!/bin/bash

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
  IdentityFile ~/.ssh/id_
" >> config

# install the Github CLI
brew install gh
gh auth login



