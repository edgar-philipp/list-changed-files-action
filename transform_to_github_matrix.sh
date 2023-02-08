#!/bin/bash

echo "::group::transform-to-github-matrix"

changed_files=( $(echo "$CHANGED_FILES") )
matrix=$(echo "{}")

if [ -n "$changed_files" ]; then
  for i in "${!changed_files[@]}"; do
    changed_files[$i]="{\"file\": \"${changed_files[$i]}\"}"
  done
  json_elements=$(IFS=, ; echo "${changed_files[*]}")
  matrix=$(echo "{\"include\":[$json_elements]}")
fi

echo "Matrix: $matrix"
echo "matrix=$matrix" >> $GITHUB_OUTPUT

echo "::endgroup::"
