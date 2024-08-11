<div align="center">

# Configuration Files

## Quick Install

Linux: run `linuxInstall.sh`

Windows: run `windowsInstall.ps1`

## Shell Config

All shells use [lsDeluxe](https://github.com/lsd-rs/lsd) for icons/colorizing and [RipGrep](https://github.com/BurntSushi/ripgrep) for improved searching

### Powershell

![image](https://github.com/aGhandhii/dotfiles/assets/110639969/a4690444-ded3-4e90-a376-e43260dee7f7)

### Bash

![image](https://github.com/aGhandhii/dotfiles/assets/110639969/6e0c35c1-8678-44c4-84f1-3ad487e80e87)

## Vim

Custom status line shows branch, filename, LSP diagnostics, operating system, encoding, and row/column:

![image](https://github.com/aGhandhii/dotfiles/assets/110639969/31a4f10d-0890-4667-b16c-b2b3c5eaf307)

Status lines also dynamically change on a per-buffer basis:

![image](https://github.com/aGhandhii/dotfiles/assets/110639969/5ebc5e30-3758-433c-a5e5-34c741002ccd)

### Current Plugins

Name | Location | Description
---  | ---      | ---
[fuzzyy](https://github.com/Donaldttt/fuzzyy)                       | ...\start\ | In-program fuzzy finder
[indentLine](https://github.com/Yggdroot/indentLine)                | ...\start\ | Shows vertical indendation bars
[rainbow](https://github.com/luochen1990/rainbow)                   | ...\start\ | Bracket colorizer
[vim-auto-highlight](https://github.com/obxhdx/vim-auto-highlight)  | ...\start\ | Highlights matching words in Normal mode
[vimcomplete](https://github.com/girishji/vimcomplete)              | ...\start\ | A lightweight vim9script autocompletion engine
[vim-cpp-modern](https://github.com/bfrg/vim-cpp-modern)            | ...\start\ | Improved syntax highlighting for C/C++
[vim-gitbranch](https://github.com/itchyny/vim-gitbranch)           | ...\start\ | Gets the name of the current branch, used for the status line
[vim-gitgutter](https://github.com/airblade/vim-gitgutter)          | ...\start\ | Shows git diff changes in left gutter
[lsp](https://github.com/yegappan/lsp)                              | ...\opt\   | Vim9Script Language Server compatibility layer
[vim-gruvbox8](https://github.com/lifepillar/vim-gruvbox8)          | ...\opt\   | A retro-themed low-contrast colorscheme

### Updating Plugins

The `updatePlugins` scripts can be used to quickly update all plugins.

To use, place the scripts in `~/.vim/pack/plugins/` then call the script corresponding to your shell.

</div>
