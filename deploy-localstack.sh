#!/usr/bin/env bash

set -e
set -o pipefail

# deploy to a named stack, in a named region
# option --resolve-s3 automatically creates an s3 bucket if needed
# alternatively, provide --s3-bucket <name> to specify it yourself
samlocal deploy --stack-name local-expt-stack --region eu-west-2 --resolve-s3
