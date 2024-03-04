#!/bin/bash
# you need to install 'gh' cli
gh repo list basepair --json name --jq '.[].name' | xargs -I {} git clone git@github.com:basepair/{}

