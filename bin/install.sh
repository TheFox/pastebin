#!/usr/bin/env bash

# Install gem local.

SCRIPT_BASEDIR=$(dirname "$0")

option=$1

which mkdir &> /dev/null || { echo 'ERROR: mkdir not found in PATH'; exit 1; }
which mv &> /dev/null || { echo 'ERROR: mv not found in PATH'; exit 1; }
which chmod &> /dev/null || { echo 'ERROR: chmod not found in PATH'; exit 1; }
which gem &> /dev/null || { echo 'ERROR: gem not found in PATH'; exit 1; }
which bundler &> /dev/null || { echo 'ERROR: bundler not found in PATH'; exit 1; }

cd "${SCRIPT_BASEDIR}/.."

# Load Environment Variables
[[ -f .env ]] && source .env

if [[ -z "${GEMSPEC_FILE}" ]] ; then
  echo 'ERROR: one of the environment variables is missing'
  
  echo "GEMSPEC_FILE: '${GEMSPEC_FILE}'"
  
  exit 1
fi

echo "GEMSPEC_FILE: '${GEMSPEC_FILE}'"

gem_file=$(gem build "${GEMSPEC_FILE}" 2> /dev/null | grep 'File:' | tail -1 | awk '{ print $2 }')

if [[ -z "$gem_file" ]] ; then
  echo 'ERROR: gem_file variable not set'
  exit 1
fi

echo "install gem file '$gem_file'"
sudo gem install "$gem_file"

# Create tmp directory.
if [[ ! -d tmp/releases ]]; then
  mkdir -p tmp/releases
  
  chmod u=rwx,go-rwx tmp
  chmod u=rwx,go-rwx tmp/releases
fi

if [[ "$option" = "-f" ]]; then
  mv -v "$gem_file" tmp/releases
else
  mv -v -i "$gem_file" tmp/releases
fi
