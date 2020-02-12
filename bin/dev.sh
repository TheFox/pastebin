#!/usr/bin/env bash

SCRIPT_BASEDIR=$(dirname "$0")
RUBYOPT=-w

which bundler &> /dev/null || { echo 'ERROR: bundler not found in PATH'; exit 1; }

cd "${SCRIPT_BASEDIR}/.."

bundler exec ./bin/pastebin --help
