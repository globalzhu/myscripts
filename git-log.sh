#!/bin/bash

git log --color --pretty=oneline --abbrev-commit |sed 's/^/ /g'
