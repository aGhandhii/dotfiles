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

# fuzzyy: in-program fuzzy finder
git clone https://github.com/Donaldttt/fuzzyy

# indentLine: shows vertical indendation bars
git clone https://github.com/Yggdroot/indentLine

# rainbow: bracket colorizer
git clone https://github.com/luochen1990/rainbow

# vim-auto-highlight: highlights matching words in Normal mode
git clone https://github.com/obxhdx/vim-auto-highlight

# vim-cpp-modern: improved syntax highlighting for C/C++
git clone https://github.com/bfrg/vim-cpp-modern

# vim-gitbranch: gets the name of the current branch, used for the status line
git clone https://github.com/itchyny/vim-gitbranch

# vim-gitgutter: shows git diff changes in left gutter
git clone https://github.com/airblade/vim-gitgutter

cd $HOME/.vim/pack/plugins/opt

# lsp: vim9 Language Server implementation
git clone https://github.com/yegappan/lsp.git

# gruvbox8: a low contrast retro colorscheme
git clone https://github.com/lifepillar/vim-gruvbox8.git

# }}}
