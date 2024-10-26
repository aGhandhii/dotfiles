# Windows Dotfiles Setup Script

New-Item -ItemType HardLink -Path $PROFILE           -Target "Microsoft.PowerShell_profile.ps1" -Force
New-Item -ItemType HardLink -Path "$HOME\.gitconfig" -Target ".gitconfig" -Force
New-Item -ItemType HardLink -Path "$HOME\.vimrc"     -Target ".vimrc" -Force

# VIM SETUP {{{

# Create vim plugin directory structure
New-Item -ItemType Directory -Path "$HOME\.vim\pack\plugins\start" -Force
New-Item -ItemType Directory -Path "$HOME\.vim\pack\plugins\opt" -Force
New-Item -ItemType HardLink  -Path "$HOME\.vim\pack\plugins\updatePlugins.ps1" -Target "updatePlugins.ps1" -Force

# Install Current Plugins

Set-Location -Path "$HOME\.vim\pack\plugins\start"

# auto-pairs: bracket pair tool
git clone https://github.com/LunarWatcher/auto-pairs

# fuzzyy: in-program fuzzy finder
git clone https://github.com/Donaldttt/fuzzyy

# indentLine: shows vertical indendation bars
git clone https://github.com/Yggdroot/indentLine

# rainbow: bracket colorizer
git clone https://github.com/luochen1990/rainbow

# vim-auto-highlight: highlights matching words in Normal mode
git clone https://github.com/obxhdx/vim-auto-highlight

# vimcomplete: a lightweight vim9script autocompletion engine
git clone https://github.com/girishji/vimcomplete

# vim-cpp-modern: improved syntax highlighting for C/C++
git clone https://github.com/bfrg/vim-cpp-modern

# vim-gitgutter: shows git diff changes in left gutter
git clone https://github.com/airblade/vim-gitgutter

Set-Location -Path "$HOME\.vim\pack\plugins\opt"

# lsp: vim9 Language Server implementation
git clone https://github.com/yegappan/lsp.git

# gruvbox8: a low contrast retro colorscheme
git clone https://github.com/lifepillar/vim-gruvbox8.git

# }}}
