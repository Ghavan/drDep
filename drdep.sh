#!/bin/bash

# Install depcheck globally
echo installing depcheck ....
npm install -g depcheck typescript vue

echo Finding unused modules...
# Run depcheck to find unused dependencies, excluding certain files and directories
depcheck --skip-missing

for package in $(depcheck --skip-missing | awk '{if((NR>1) && ($1!="Unused")) print $2}'); do
  # Extract list of unused dependencies from depcheck output and remove them
  echo "Uninstalling package: $package"
  npm uninstall $package
done

echo uninstalling depcheck....  
npm uninstall -g depcheck
