if [[ -e ~/.nvm/alias/default ]]; then
  PATH="${PATH}:${HOME}/.nvm/versions/node/v$(cat ~/.nvm/alias/default)/bin"
fi
