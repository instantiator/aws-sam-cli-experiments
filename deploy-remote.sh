#!/usr/bin/env bash

set -e
set -o pipefail

# build the serverless application
sam build

# deploy using a named aws profile
sam deploy --guided --profile work-expt-staffer
