export PATH=$PATH:/usr/local/go/bin

export PATH="$HOME/.cargo/bin:$PATH"

if (( $+commands[go] )); then
  export PATH=$PATH:$(go env GOPATH)/bin
fi

if [[ -e ~/.nvm/alias/default ]]; then
  PATH="${PATH}:${HOME}/.nvm/versions/node/v$(cat ~/.nvm/alias/default)/bin"
fi
