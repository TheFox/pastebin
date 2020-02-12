#!/usr/bin/env bash

# Uninstall gem.

SCRIPT_BASEDIR=$(dirname "$0")

which gem &> /dev/null || { echo 'ERROR: gem not found in PATH'; exit 1; }

cd "${SCRIPT_BASEDIR}/.."

# Load Environment Variables
[[ -f .env ]] && source .env

if [[ -z "${GEM_NAME}" ]] ; then
  echo 'ERROR: one of the environment variables is missing'
  
  echo "GEM_NAME: '${GEM_NAME}'"
  
  exit 1
fi

gem uninstall "${GEM_NAME}" --all --executables
