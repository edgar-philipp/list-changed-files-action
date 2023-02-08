#!/bin/bash

echo "::group::list-changed-files"

list=$(git diff-tree --diff-filter=M --no-commit-id --name-only -r $CURRENT_HASH -- 'openapi/**/*.yml' 'openapi/**/*.yaml')
echo "Changed files: $list"

changed_files="(${list[*]//$'\n'/ })"
echo "changed_files=${changed_files}" >> $GITHUB_OUTPUT

echo "::endgroup::"
