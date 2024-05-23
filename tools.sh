#!/bin/sh

# install for faster file sorting (for telescope)
# sudo apt-get install ripgrep -y

# isntall elixir-ls (Installing through Mason doesn't work)
curl -fLO https://github.com/elixir-lsp/elixir-ls/releases/download/v0.16.0/elixir-ls-v0.16.0.zip
unzip elixir-ls-v0.16.0.zip -d ./ls/elixir-ls
rm elixir-ls-v0.16.0.zip

chmod +x ./ls/elixir-ls/language_server.sh
