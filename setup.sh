#!/bin/bash

# Change to the project directory
cd "$(dirname "$0")"

# Install dependencies
gem install faker clipboard

# Run the Ruby application
ruby src/app.rb "$@"

# Detect the user's shell
if [[ -n "$ZSH_VERSION" ]]; then
  shell_profile="$HOME/.zshrc"
else
  shell_profile="$HOME/.bashrc"
fi

# Add the alias to the user's shell configuration file
alias_command="alias fake='ruby $PWD/src/app.rb'"
echo -e "\n# Fake Data Generator Alias" >> "$shell_profile"
echo "$alias_command" >> "$shell_profile"

# Restart the terminal
exec "$SHELL"
