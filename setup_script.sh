#!/bin/bash

cd
mkdir work
cd work
brew install gh
gh auth login
gh repo list basepair --json name --jq '.[].name' | xargs -I {} git clone git@github.com:basepair/{}

