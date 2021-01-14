#!/usr/bin/env sh

set -o errexit
set -o nounset

echo 'debug'
echo "$SHELL"
echo "$PATH"
env

if [ ! $(command -v code) ]; then
  echo 'not -v code'
fi

if [ ! $(command -v code-insiders) ]; then
  # Adding `code-insiders` to the `PATH`, it might be missing.
  VSCODE="$HOME/.vscode-remote/bin/$(ls "$HOME/.vscode-remote/bin")"
  PATH="$VSCODE:$PATH"
fi

if [ ! $(command -v code) ] && [ $(command -v code-insiders) ]; then
  # Link `code` to be the same as `code-insiders`:
  ln -s "$(which code-insiders)" "$(dirname "$(which code-insiders)")/code"
  echo 'linked `code-insiders` to be accessible as `code`'
fi

# Install plugins:
sh 'vscode/plugins.sh'
