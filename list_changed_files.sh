#!/bin/bash

echo "::group::list-changed-files"
set -x #echo on

echo $(git log --oneline)

# filter M = modified
list=$(git diff-tree --diff-filter=M --no-commit-id --name-only -r $CURRENT_HASH -- '${PATH_FILTER}/*.yml' '${PATH_FILTER}/*.yaml')
echo "Changed files: $list"

changed_files="${list[*]//$'\n'/ }"
echo "changed_files=${changed_files}" >> $GITHUB_OUTPUT

set +x
echo "::endgroup::"
