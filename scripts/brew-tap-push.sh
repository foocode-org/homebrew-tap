#!/bin/bash

if [[ ${CI_COMMIT_TAG:0:1} == "v" ]]
then
  VERSION=${CI_COMMIT_TAG:1}
else
  VERSION=$CI_COMMIT_TAG
fi

git config --global user.email "test@example.com"
git config --global user.name "Noushad"
git clone https://github.com/foocode123/homebrew-tools.git
cd homebrew-tools/Formula
cp -f ../../updated_formula.rb foocode-cli.rb
git add .
git commit -m "Brew formula update for foocode-cli version $VERSION"
git remote set-url origin https://${GITHUB_TOKEN}@github.com/foocode123/homebrew-tools.git
git push origin main

git config --unset-all user.email
git config --unset-all user.name
cd ../../
rm -rf ./updated_formula.rb
rm -rf ./homebrew-tools