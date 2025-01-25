# Windows Dotfiles Setup Script

# THESE ACTIONS REQUIRE ADMIN PRIVELAGES
New-Item -ItemType SymbolicLink -Path $PROFILE           -Target "$PWD\Microsoft.PowerShell_profile.ps1" -Force
New-Item -ItemType SymbolicLink -Path "$HOME\.gitconfig" -Target "$PWD\.gitconfig" -Force
New-Item -ItemType SymbolicLink -Path "$HOME\.vimrc"     -Target "$PWD\.vimrc" -Force

# VIM SETUP {{{

# Create vim plugin directory structure
New-Item -ItemType Directory -Path "$HOME\.vim\pack\plugins\start" -Force
New-Item -ItemType Directory -Path "$HOME\.vim\pack\plugins\opt" -Force

# Install Current Plugins
Push-Location
Set-Location -Path "$HOME\.vim\pack\plugins\start"

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

Set-Location -Path "$HOME\.vim\pack\plugins\opt"

# lsp: vim9 Language Server implementation
git clone https://github.com/yegappan/lsp.git

# gruvbox8: a low contrast retro colorscheme
git clone https://github.com/lifepillar/vim-gruvbox8.git

Pop-Location

# }}}
