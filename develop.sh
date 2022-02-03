#!/usr/bin/env bash

set -euo pipefail
stack exec site watch & browser-sync start --server --files '_site/**' --startPath '_site/index.html' && fg
