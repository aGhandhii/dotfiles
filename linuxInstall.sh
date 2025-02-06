#!/usr/bin/bash

echo -n -e "Linking config files to Home Directory ... "
rm $HOME/.bashrc    2> /dev/null
rm $HOME/.gitconfig 2> /dev/null
rm $HOME/.vimrc     2> /dev/null
ln -s -f $(pwd)/.bashrc       $HOME/.bashrc
ln -s -f $(pwd)/.gitconfig    $HOME/.gitconfig
ln -s -f $(pwd)/.vimrc        $HOME/.vimrc
echo -n -e "Done!\n"

# VIM SETUP {{{

# Create vim plugin directory structure
mkdir --parents $HOME/.vim/pack/plugins/start
mkdir --parents $HOME/.vim/pack/plugins/opt

# Install Current Plugins
cd $HOME/.vim/pack/plugins/start

# Clear current plugins
rm -rf *

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

# vim-c-cpp-modern: improved syntax highlighting for C/C++
git clone https://github.com/bfrg/vim-c-cpp-modern

# vim-gitgutter: shows git diff changes in left gutter
git clone https://github.com/airblade/vim-gitgutter

cd $HOME/.vim/pack/plugins/opt

# Clear current plugins
rm -rf *

# lsp: vim9 Language Server implementation
git clone https://github.com/yegappan/lsp.git

# gruvbox8: a low contrast retro colorscheme
git clone https://github.com/lifepillar/vim-gruvbox8.git

# }}}
