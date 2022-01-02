#!/usr/bin/env bash

set -e
set -o pipefail

# validate the SAM template.yaml against a named aws profile
sam validate --profile work-expt-staffer

# attempt to build the serverless application, following template.yaml
sam build
