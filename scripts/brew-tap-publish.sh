#!/bin/bash

git config --global user.email ${GITHUB_USER_EMAIL}
git config --global user.name ${GITHUB_USER_NAME}

# clone the brew-tap repository
git clone https://github.com/Noush-012/homebrew-tools.git
cd homebrew-tools/Formula
cp -f ../../dist/homebrew/Formula/helloworld.rb .

git add .
git commit -m "Brew formula update for foocode-cli version $VERSION"
git remote set-url origin https://${GITHUB_TOKEN}@github.com/foocode123/homebrew-tools.git
git push origin main

git config --global --unset-all user.name
git config --global --unset-all user.email