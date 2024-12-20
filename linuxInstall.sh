#!/usr/bin/bash

ln .bashrc $HOME/.bashrc
ln .gitconfig $HOME/.gitconfig
ln .vimrc $HOME/.vimrc

# VIM SETUP {{{

# Create vim plugin directory structure
mkdir --parents $HOME/.vim/pack/plugins/start
mkdir --parents $HOME/.vim/pack/plugins/opt
ln updatePlugins.sh $HOME/.vim/pack/plugins/updatePlugins.sh
chmod +x $HOME/.vim/pack/plugins/updatePlugins.sh

# Install Current Plugins

cd $HOME/.vim/pack/plugins/start

# auto-pairs: bracket pair tool
git clone https://github.com/LunarWatcher/auto-pairs

# fuzzyy: in-program fuzzy finder
git clone https://github.com/Donaldttt/fuzzyy

# indentLine: shows vertical indendation bars
git clone https://github.com/Yggdroot/indentLine

# rainbow: bracket colorizer
git clone https://github.com/luochen1990/rainbow

# vimcomplete: a lightweight vim9script autocompletion engine
git clone https://github.com/girishji/vimcomplete

# vim-cpp-modern: improved syntax highlighting for C/C++
git clone https://github.com/bfrg/vim-cpp-modern

# vim-gitgutter: shows git diff changes in left gutter
git clone https://github.com/airblade/vim-gitgutter

cd $HOME/.vim/pack/plugins/opt

# lsp: vim9 Language Server implementation
git clone https://github.com/yegappan/lsp.git

# gruvbox8: a low contrast retro colorscheme
git clone https://github.com/lifepillar/vim-gruvbox8.git

# }}}
