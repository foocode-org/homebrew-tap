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

# Create a new branch with a name based on the version
BRANCH_NAME="homebrew-cli-release-$VERSION"



# clone the brew-tap repository
git clone https://${HOMEBREW_REPO}
cd homebrew-tools/Formula
git checkout -b $BRANCH_NAME
cp -f ../../formula/updated_formula.rb veracode-cli.rb

git add veracode-cli.rb
git commit -m "Brew formula update for helloworld-cli version $VERSION"
git remote set-url origin https://${GITHUB_USER_NAME}:${GITHUB_TOKEN}@${HOMEBREW_REPO}
git push origin $BRANCH_NAME

# Create a pull request using GitHub CLI
echo ${GITHUB_TOKEN} | gh auth login --with-token
gh pr create --title "Update formula for veracode-cli version $VERSION" --body "This PR updates the brew formula to version $VERSION" --base main --head $BRANCH_NAME

# Get the pull request ID
PR_ID=$(gh pr view --json number --jq '.number')
echo "PR ID $PR_ID"

# Check the status of PR checks
attempts=10
delay=60

for ((i=1; i<=attempts; i++))
do
  # Get the raw output of PR checks
  PR_CHECKS=$(gh pr checks $PR_ID)
  
  echo "Attempt $i: PR checks output:"
  echo "$PR_CHECKS"

  # Check for successful status
  if echo "$PR_CHECKS" | grep -q "pass"; then
    # Merge the pull request
    echo "CI Verification passed successfully"
    #gh pr merge $PR_ID --merge
    echo "Pull request is merged successfully"
    break
  elif [[ $i -eq $attempts ]]; then
    echo "PR checks failed or not completed within the expected time."
    exit 1
  else
    echo "PR checks not yet completed, retrying in $delay seconds... (Attempt $i of $attempts)"
    sleep $delay
  fi
done


# Clean up
git config --global --unset-all user.name
git config --global --unset-all user.email
rm -rf ../../${HOMEBREW_REPO}