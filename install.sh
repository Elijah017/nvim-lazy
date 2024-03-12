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

sudo apt install python4-venv

if [ ! -x lazygit ]; then
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') \
    && curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" \
    && tar xf lazygit.tar.gz lazygit \
    && sudo install lazygit /usr/local/bin \
    && rm lazygit lazygit.tar.gz
fi

mv nvim-lazy nvim && cd nvim
printf "\e[0;92mInstalled Nvim"
