#!/bin/sh

echo "Setting up the project..."
mkdir -p private/keys

# create symlinks to ssh keys ignoring the existing files
if [ -L private/keys/key.pub ]; then
  echo "Symlink private/keys/key.pub already exists"
else
  ln -s ~/.ssh/id_rsa.pub private/keys/key.pub && echo "Symlink private/keys/key.pub created" || echo "Failed to create symlink private/keys/key.pub"
fi

if [ -L private/keys/key ]; then
  echo "Symlink private/keys/key already exists"
else
  ln -s ~/.ssh/id_rsa private/keys/key && echo "Symlink private/keys/key created" || echo "Failed to create symlink private/keys/key"
fi

# git hooks
git config --local core.hooksPath .githooks && echo "Git hooks path set to .githooks" || echo "Failed to set Git hooks path"