#!/usr/bin/env bash

set -e
set -o pipefail

# install localstack
brew install localstack

# install some nice wrappers for the aws and sam cli
pip install awscli-local
pip install aws-sam-cli-local

# awslocal wraps the aws cli, and directs it to localstack
# samlocal wraps the sam cli, and directs it to localstack
