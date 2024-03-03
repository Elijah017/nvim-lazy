#!/bin/sh

if [ -d ~/.config/nvim ]; then
  printf "\n\e[0;92mNvim is already installed\n\n"
  exit 0
fi

if [ ! -d ~/.config ]; then
  mkdir ~/.config
fi

# check if nvim is installed
if [ ! -x nvim ]; then

  if [ ! -d ~/.local/share ]; then
    mkdir ~/.local/share
  fi

  cd ~/.local/share
  # Install neovim
  sudo apt-get install ninja-build gettext cmake unzip curl -y 1> /dev/null \
    && git clone https://github.com/neovim/neovim \
    && cd neovim && make CMAKE_BUILD_TYPE=Release 1> /dev/null \
    && sudo make install \
    && sudo ln -s $(pwd)/build/bin/nvim /usr/local/sbin/nvim

  if [ ! -x nvim ]; then
    exit 1
  fi
fi

cd ~/.config
if [ ! -d ~/.config/nvim-lazy ]; then
  git clone https://Elijah017/nvim-lazy
fi

mv nvim-lazy nvim && cd nvim
printf "\e[0;92mInstalled Nvim"
