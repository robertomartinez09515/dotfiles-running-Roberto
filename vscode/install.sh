#!/usr/bin/env sh

set -o errexit
set -o nounset

if [ ! $(command -v code) ] && [ $(command -v code-insiders) ]; then
  # Link `code` to be the same as `code-insiders`:
  ln -s "$(which code-insiders)" "$(dirname "$(which code-insiders)")/code"
  echo 'linked `code-insiders` to be accessible as `code`'
fi

# Install plugins:
sh 'vscode/plugins.sh'
