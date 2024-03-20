#!/bin/bash

cd
mkdir work
cd work
gh repo list basepair --json name --jq '.[].name' | xargs -I {} git clone git@github.com:basepair/{}

