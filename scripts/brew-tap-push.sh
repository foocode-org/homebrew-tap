#!/bin/bash

if [[ ${CI_COMMIT_TAG:0:1} == "v" ]]
then
  VERSION=${CI_COMMIT_TAG:1}
else
  VERSION=$CI_COMMIT_TAG
fi

git clone https://github.com/veracode/homebrew-tools
cd homebrew-tools/Formula
cp -f ../../updated_formula.rb veracode-cli.rb
git add .
git commit -m "Brew formula update for veracode-cli version $VERSION"
git remote set-url origin https://${GITHUB_TOKEN}@github.com/veracode/homebrew-tools.git
git push origin main

cd ../../
rm -rf ./updated_formula.rb
rm -rf ./homebrew-tools