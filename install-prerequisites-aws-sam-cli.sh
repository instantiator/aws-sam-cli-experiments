#!/usr/bin/env bash

set -e
set -o pipefail

# update xcode cli
softwareupdate --all --install --force
# if that fails, try this:
# sudo rm -rf /Library/Developer/CommandLineTools
# sudo xcode-select --install

# install aws sam cli
brew tap aws/tap
brew install awscli aws-sam-cli
