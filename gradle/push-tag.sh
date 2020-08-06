#!/bin/sh

# Git push is implemented in the script to make sure we are not leaking GH key to the output
# Expects:
# 1. 'GH_WRITE_TOKEN' env variable
# 2. tag name as a parameter of this script

TAG_NAME=$1

echo "Running git push without output for security. If it fails make sure that GH_WRITE_TOKEN env variable is set."
git push --quiet https://mockitoguy:$GH_WRITE_TOKEN@github.com/shipkit/shipkit-demo.git $TAG_NAME > /dev/null 2>&1
EXIT_CODE=$?
echo "'git push --quiet' exit code: $EXIT_CODE"
exit $EXIT_CODE
