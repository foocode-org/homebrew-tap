#!/bin/bash

if [[ ${CI_COMMIT_TAG:0:1} == "v" ]]
then
  VERSION=${CI_COMMIT_TAG:1}
else
  VERSION=$CI_COMMIT_TAG
fi

# Save artifact
mkdir formula
mv updated_formula.rb formula/updated_formula.rb

# For test version
VERSION="2.26.0"
echo "Commit tag: ${CI_COMMIT_TAG}"
echo "Version: ${VERSION}"

git config --global user.email ${GITHUB_USER_EMAIL}
git config --global user.name ${GITHUB_USER_NAME}

# clone the brew-tap repository
git clone ${HOMEBREW_REPO}
cd homebrew-tools/Formula
cp -f ../../formula/updated_formula.rb foocode-cli.rb

git add foocode-cli.rb
git commit -m "Brew formula update for helloworld-cli version $VERSION"
git remote set-url origin https://${GITHUB_TOKEN}@github.com/foocode123/homebrew-tools.git
git push origin main

# Clean up
git config --global --unset-all user.name
git config --global --unset-all user.email
rm -rf ../../${HOMEBREW_REPO}