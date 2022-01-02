#!/usr/bin/env bash

set -e
set -o pipefail

# start localstack in the background
# to start localstack and tail the logs, remove option -d
localstack start -d
