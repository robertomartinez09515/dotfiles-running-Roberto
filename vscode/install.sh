#!/usr/bin/env sh

set -o errexit
set -o nounset

echo 'debug'
echo "$SHELL"
echo "$PATH"

if [ ! $(command -v code) ]; then
  echo 'not -v code'
fi

if [ $(command -v code-insiders) ]; then
  echo '-v code-insiders'
fi

if [ ! $(command -v code) ] && [ $(command -v code-insiders) ]; then
  # Link `code` to be the same as `code-insiders`:
  ln -s "$(which code-insiders)" "$(dirname "$(which code-insiders)")/code"
  echo 'linked `code-insiders` to be accessible as `code`'
fi

# Install plugins:
sh 'vscode/plugins.sh'
