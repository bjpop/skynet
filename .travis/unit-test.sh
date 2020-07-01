#!/bin/bash

set -e
errors=0

# Run unit tests
python skynet/skynet_test.py || {
    echo "'python python/skynet/skynet_test.py' failed"
    let errors+=1
}

# Check program style
pylint -E skynet/*.py || {
    echo 'pylint -E skynet/*.py failed'
    let errors+=1
}

[ "$errors" -gt 0 ] && {
    echo "There were $errors errors found"
    exit 1
}

echo "Ok : Python specific tests"
