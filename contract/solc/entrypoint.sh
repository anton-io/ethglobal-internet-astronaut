#!/bin/bash

if [ "$1" = "bash" ]; then
  exec bash
else
  # Default command.
  umask 000
  exec /usr/local/bin/solcjs "$@"
fi