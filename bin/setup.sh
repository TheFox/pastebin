#!/usr/bin/env bash

# Development setup.

SCRIPT_BASEDIR=$(dirname "$0")

which cp &> /dev/null || { echo 'ERROR: cp not found in PATH'; exit 1; }
which bundler &> /dev/null || { echo 'ERROR: bundler not found in PATH'; exit 1; }

cd "${SCRIPT_BASEDIR}/.."

# Create .env file.
if [[ ! -f .env ]]; then
  cp .env.example .env
fi

bundler install
