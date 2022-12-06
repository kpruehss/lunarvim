#!/bin/bash
mkdir -p ~/.config/lvim
cp /usr/share/doc/lunarvim/config.example.lua ~/.config/lvim/config.lua
mkdir -p ~/.local/share/lunarvim
ln -s /usr/share/lunarvim ~/.local/share/lunarvim/lvim

echo -e "\033[1;32m==> Installing dependencies of NodeJS & Rust...\033[0m"
yarn global add neovim
yarn global add tree-sitter-cli
cargo install fd-find
cargo install ripgrep

echo -e "\033[1;32m==> Installing Packer...\033[0m"
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/lunarvim/site/pack/packer/start/packer.nvim

echo -e "\033[1;32m==> PackerInstall...\033[0m"
lvim --headless +'autocmd User PackerComplete sleep 100m | qall' +PackerInstall

echo -e "\033[1;32m==> PackerSync...\033[0m"
lvim --headless +'autocmd User PackerComplete sleep 100m | qall' +PackerSync
rm ~/.config/lvim/config.lua
cp /usr/share/doc/lunarvim/config.example.lua ~/.config/lvim/config.lua

echo -e "\033[1;32m==> Installing treesitter parsers..\033[0m"
ln -s /usr/share/lunarvim/prebuild/nvim-treesitter/parser/* \
  ~/.local/share/lunarvim/site/pack/packer/start/nvim-treesitter/parser/
ln -s /usr/share/lunarvim/prebuild/nvim-treesitter/parser-info/* \
  ~/.local/share/lunarvim/site/pack/packer/start/nvim-treesitter/parser-info/

echo -e "\033[1;32m==> Generate the new ftplugin template files..\033[0m"
lvim --headless +LvimUpdate +q

echo -e "\033[1;32m===============================================\033[0m"
echo "lunarvim runtime is inited for $(whoami)"
echo "clean up by:"
echo "    rm -rf ~/.config/lvim ~/.local/share/lunarvim"
echo -e "\033[1;32m===============================================\033[0m"
