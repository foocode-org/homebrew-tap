ls ./

git config --global user.email ${GITHUB_USER_EMAIL}
git config --global user.name ${GITHUB_USER_NAME}
git clone https://github.com/foocode123/homebrew-tools.git
cd homebrew-tools/Formula
cp -f ./dist/homebrew/helloworld.rb /homebrew-tools/Formula/

git add .
git commit -m "Brew formula update for foocode-cli version $VERSION"
git remote set-url origin https://${GITHUB_TOKEN}@github.com/foocode123/homebrew-tools.git
git push origin main

git config --global --unset-all user.name
git config --global --unset-all user.email