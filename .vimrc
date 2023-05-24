" NERD FONTS: {{{
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
"   -> This setup requires the use of NERD fonts, which are patched fonts that
"      have a large icon library
"
"   -> Install a NERD font of your choice at this link:
"       -> https://www.nerdfonts.com
"       -> Be sure to change your terminal preferences to use this font
"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}


" VIM PLUGIN FILE STRUCTURE REFERENCE: {{{
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
"   📂.vim
"     |-📂pack
"         |-📂plugins
"             |-📂opt
"             |   |- <colorscheme plugins>
"             |-📂start
"                 |- <all other plugins>
"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}


" CURRENT PLUGINS: {{{
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
" PLACE PLUGINS IN ../.vim/pack/plugins/start/
"
" TO INSTALL
"   -> cd into the appropriate directory
"   -> git clone <plugin url>
"   -> use 'git pull' to update
"
" fuzzyy: in-program fuzzy finder
"   -> https://github.com/Donaldttt/fuzzyy.git
"
" indentLine: shows vertical indendation bars
"   -> https://github.com/Yggdroot/indentLine.git
"
" rainbow: bracket colorizer
"   -> https://github.com/luochen1990/rainbow.git
"
" vim-auto-highlight: highlights matching words in Normal mode
"   -> https://github.com/obxhdx/vim-auto-highlight.git
"
" vim-cpp-modern: improved syntax highlighting for C/C++
"   -> https://github.com/bfrg/vim-cpp-modern.git
"
" vim-gitbranch: gets the name of the current branch, used for the status line
"   -> https://github.com/itchyny/vim-gitbranch.git
"
" vim-gitgutter: shows git diff changes in left gutter
"   -> https://github.com/airblade/vim-gitgutter.git
"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}


" LSP: {{{
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
" vim-lsp: communicate with a language server in vim
"   -> https://github.com/prabirshrestha/vim-lsp.git
"
" vim-lsp-settings: handles installation/uninstallation of language servers
"   -> https://github.com/mattn/vim-lsp-settings.git
"
" asyncomplete.vim: asynchronous autocompletion engine for vim
"   -> https://github.com/prabirshrestha/asyncomplete.vim.git
"
" asyncomplete-lsp.vim: use vim-lsp as a source for asyncomplete completion
"   -> https://github.com/prabirshrestha/asyncomplete-lsp.vim.git

" PLUGIN CONFIGURATION

"" vim-lsp
"let g:lsp_diagnostics_enabled = 0
"let g:lsp_document_highlight_enabled = 0
"
"" asyncomplete
"inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"
"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
"if executable('pyls')                                           " Config for Python LSP 'pyls'
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'pyls',
"        \ 'cmd': {server_info->['pyls']},
"        \ 'allowlist': ['python'],
"        \ })
"endif
"if executable('clangd')                                         " Config for C/C++ LSP 'clangd'
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'clangd',
"        \ 'cmd': {server_info->['clangd', '-background-index']},
"        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"        \ })
"endif

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}


" COLOR SETTINGS: {{{
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Fixes potential color issues
let &t_ut=''
if has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"                      " Turns on true terminal colors
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors                                           " Turns on 24-bit RGB color support
    set t_Co=256                                                " Defines how many colors should be used
endif

"  PLACE COLORSCHEMES IN ../.vim/pack/*/opt/

"  gruvbox8: a low contrast retro colorscheme
"       -> https://github.com/lifepillar/vim-gruvbox8.git

" Gruvbox8 configuration
packadd vim-gruvbox8
set background=dark
let g:gruvbox_bold = 1
let g:gruvbox_italics = 0
"let g:gruvbox_transp_bg = 1
colorscheme gruvbox8_soft

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}


" GENERAL SETTINGS: {{{
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Fold about triple '{' instances
set foldmethod=marker

" Enable syntax highlighting
syntax enable

" Display line numbers
set number

" Expand command history
set history=1000

" Use UTF-8 encoding
set encoding=utf-8

" Use system clipboard (COMMENT OUT ON WINDOWS)
"set clipboard=unnamedplus

" Update screen more frequently
set updatetime=50

" Disable spell checking
set nospell

" Track location of cursor
set ruler

" Disables flashing and sounds
set noerrorbells
set novisualbell

" Indentation settings
set shiftwidth=4                                                " Define shift spacing
set tabstop=4                                                   " Tab equates to 4 spaces
set smarttab                                                    " Indent according to tabstop
set expandtab                                                   " Tab is turned into 'tabstop' spaces
set shiftround                                                  " Round indentation to multiples of 'shiftwidth'
set backspace=indent,eol,start                                  " Backspacing includes indentation
set autoindent                                                  " Remember indentation on newline
au FileType * set fo-=c fo-=r fo-=o                             " Prevent auto-commentation on newline

" Column highlighting preferences
set cursorline                                                  " Highlight current line
set colorcolumn=80,120                                          " Set style line limits at 80 and 120 characters

" File/Directory settings
set nobackup                                                    " Stop storing auto backups
set noswapfile                                                  " Stop creating swap files
"set autochdir                                                   " Switch working directory to current window
set hidden                                                      " Ignore saving when switching between tabs
set confirm                                                     " Skip confirmation when saving and quitting a file

" Text navigation settings
set nowrap                                                      " Disable text wrapping
set sidescroll=1                                                " Allow for horizontal scrolling
set scrolloff=1                                                 " Keep lines above/below cursor
set sidescrolloff=5                                             " Keep lines to the right of the cursor
set mouse=a                                                     " Allow mouse use

" Search settings
"set ignorecase                                                  " Ignore capital letters when searching
set hlsearch                                                    " Allows highlighting during a search
set showcmd                                                     " Show partial commands in search
set incsearch                                                   " Incremental searching

" Window split preferences
set splitbelow                                                  " Default :split to below
set splitright                                                  " Default :vsplit to right

" Show title in terminal bar
set title
set titleold=

" Word completion menu preferences
set complete=.,w,b,u,t,i                                        " Scan all buffers and tags
set completeopt=menuone,popup,noinsert                          " Give completion menu popup info

" Command line completion menu
set wildmenu                                                    " Enable auto completion menu
set wildmode=list:longest,full                                  " Make wildmenu act more like Bash
set wildignore=                                                 " Ignore files with specific extensions
\ *.docx,
\ *.jpg,
\ *.png,
\ *.gif,
\ *.pdf,
\ *.pyc,
\ *.exe,
\ *.flv,
\ *.img,
\ *.xlsx

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}


" STATUS LINE CONFIGURATION: {{{
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Always show the status line
set laststatus=2

" Status line layout
" Currently set to work with the Gruvbox8 Colorscheme
set statusline=                                                 " Clear current status
set statusline+=%#Special#%{TruncatedBranch()}%#LineNr#\        " Display git branch name
set statusline+=%#Identifier#\%{GetFileIcon()}\ %f              " Filename
set statusline+=%#WarningMsg#%{Modified()}\                     " Modified marker
set statusline+=%=                                              " Move to right side
set statusline+=%#LineNr#\%{&fileencoding}\                     " File encoding type
set statusline+=%#Constant#\row:\ %-3l\ col:\ %-3c%#LineNr#     " Row and column numbers

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}


" PLUGIN CONFIGURATION: {{{
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Configure Netrw (Should be built in to VIM)
let g:netrw_liststyle=3                                         " Tree layout
let g:netrw_banner=0                                            " Removes the info banner
let g:netrw_browse_split=4                                      " Open new files to the right window
let g:netrw_winsize=25                                          " Default vertical width
let g:netrw_altv=1                                              " Split to left side
let g:netrw_preview=1                                           " Show preview in vertical split

" Configure GitGutter
autocmd BufWritePost * GitGutter                                " Update gitgutter more often
autocmd CmdwinLeave * GitGutter
autocmd WinEnter * GitGutter
let g:gitgutter_sign_added='█'                                  " Make gitgutter look uniform
let g:gitgutter_sign_modified='█'
let g:gitgutter_sign_removed='█'
let g:gitgutter_sign_removed_first_line='█'
let g:gitgutter_sign_modified_removed='█'

" Configure indentLine
let g:indentLine_char = '¦'

" Configure Rainbow
let g:rainbow_active = 1

" Configure fuzzyy
let g:enable_fuzzyy_keymaps = 0                                 " Disable default keymaps

" LSP Setup (plugin is slow, implement this over time)
" python-lsp-server
" call LspAddServer([#{name: 'pylsp',
"                  \   filetype: 'python',
"                  \   path: 'PATH TO SERVER EXECUTABLE',
"                  \   args: []
"                  \ }])

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}


" KEY SHORTCUTS: {{{
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Open netrw File Explorer
nnoremap <silent> t :Lexplore<CR>
" Open Fuzzyy File Explorer
nnoremap <silent> <C-p> :FuzzyFiles<CR>
" Open a Split Terminal
nnoremap <silent> <C-t> :vert term<CR>
" Toggle relative line number
nnoremap <silent> <F1> :exec &rnu==1? "set nornu" : "set rnu"<CR>
" Change Buffer
nnoremap <silent> <A-Left> :bp<CR>
nnoremap <silent> <A-Right> :bn<CR>
" Close a Buffer, not a Window
nnoremap <silent> q :bp<bar>sp<bar>bn<bar>bd<CR>
" Better Scrolling
noremap <S-k> <S-Up>
noremap <S-j> <S-Down>
noremap <C-Up> 5<C-y>
noremap <C-k>  5<C-y>
noremap <C-Down> 5<C-e>
noremap <C-j> 5<C-e>
noremap <S-Left> 5zh
noremap <S-h> 5zh
noremap <S-Right> 5zl
noremap <S-l> 5zl
" Tab Completion
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <silent><expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}


" CUSTOM UTILITY FUNCTIONS: {{{
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Limit git branch text length (for status bar)
function TruncatedBranch()
    let branch = gitbranch#name()
    if strlen(branch) > 50
        return "   " . strpart(branch, 0, 50)
    elseif strlen(branch) == 0
        return ""
    endif
    return "   " . branch
endfunction

"Function to determine if file is modified
function Modified()
    if &modified
        return '*'
    endif
    return ''
endfunction

" Determine file icon for file type
function GetFileIcon()
    let file_extension = expand('%:e')
    if has_key(g:file_icons, expand('%:e'))
        return g:file_icons[expand('%:e')]
    elseif has_key(g:file_icons, expand('%:t'))
        return g:file_icons[expand('%:t')]
    endif
    return ''
endfunction

" Icon references
let g:file_icons = {
    \ 'styl'              : '',
    \ 'sass'              : '',
    \ 'scss'              : '',
    \ 'htm'               : '',
    \ 'html'              : '',
    \ 'slim'              : '',
    \ 'haml'              : '',
    \ 'ejs'               : '',
    \ 'css'               : '',
    \ 'less'              : '',
    \ 'md'                : '',
    \ 'mdx'               : '',
    \ 'markdown'          : '',
    \ 'rmd'               : '',
    \ 'json'              : '',
    \ 'webmanifest'       : '',
    \ 'js'                : '',
    \ 'mjs'               : '',
    \ 'jsx'               : '',
    \ 'rb'                : '',
    \ 'gemspec'           : '',
    \ 'rake'              : '',
    \ 'php'               : '',
    \ 'py'                : '',
    \ 'pyc'               : '',
    \ 'pyo'               : '',
    \ 'pyd'               : '',
    \ 'coffee'            : '',
    \ 'mustache'          : '',
    \ 'hbs'               : '',
    \ 'conf'              : '',
    \ 'ini'               : '',
    \ 'yml'               : '',
    \ 'yaml'              : '',
    \ 'toml'              : '',
    \ 'bat'               : '',
    \ 'mk'                : '',
    \ 'jpg'               : '',
    \ 'jpeg'              : '',
    \ 'bmp'               : '',
    \ 'png'               : '',
    \ 'webp'              : '',
    \ 'gif'               : '',
    \ 'ico'               : '',
    \ 'twig'              : '',
    \ 'cpp'               : '',
    \ 'c++'               : '',
    \ 'cxx'               : '',
    \ 'cc'                : '',
    \ 'cp'                : '',
    \ 'c'                 : '',
    \ 'cs'                : '',
    \ 'h'                 : '',
    \ 'hh'                : '',
    \ 'hpp'               : '',
    \ 'hxx'               : '',
    \ 'hs'                : '',
    \ 'lhs'               : '',
    \ 'nix'               : '',
    \ 'lua'               : '',
    \ 'java'              : '',
    \ 'sh'                : '',
    \ 'fish'              : '',
    \ 'bash'              : '',
    \ 'zsh'               : '',
    \ 'ksh'               : '',
    \ 'csh'               : '',
    \ 'awk'               : '',
    \ 'ps1'               : '',
    \ 'ml'                : 'λ',
    \ 'mli'               : 'λ',
    \ 'diff'              : '',
    \ 'db'                : '',
    \ 'sql'               : '',
    \ 'dump'              : '',
    \ 'clj'               : '',
    \ 'cljc'              : '',
    \ 'cljs'              : '',
    \ 'edn'               : '',
    \ 'scala'             : '',
    \ 'go'                : '',
    \ 'dart'              : '',
    \ 'xul'               : '',
    \ 'sln'               : '',
    \ 'suo'               : '',
    \ 'pl'                : '',
    \ 'pm'                : '',
    \ 't'                 : '',
    \ 'rss'               : '',
    \ 'f#'                : '',
    \ 'fsscript'          : '',
    \ 'fsx'               : '',
    \ 'fs'                : '',
    \ 'fsi'               : '',
    \ 'rs'                : '',
    \ 'rlib'              : '',
    \ 'd'                 : '',
    \ 'erl'               : '',
    \ 'hrl'               : '',
    \ 'ex'                : '',
    \ 'exs'               : '',
    \ 'eex'               : '',
    \ 'leex'              : '',
    \ 'heex'              : '',
    \ 'vim'               : '',
    \ 'ai'                : '',
    \ 'psd'               : '',
    \ 'psb'               : '',
    \ 'ts'                : '',
    \ 'tsx'               : '',
    \ 'jl'                : '',
    \ 'pp'                : '',
    \ 'vue'               : '﵂',
    \ 'elm'               : '',
    \ 'swift'             : '',
    \ 'xcplayground'      : '',
    \ 'tex'               : 'ﭨ',
    \ 'r'                 : 'ﳒ',
    \ 'rproj'             : '鉶',
    \ 'sol'               : 'ﲹ',
    \ 'pem'               : '',
    \ 'gruntfile.coffee'  : '',
    \ 'gruntfile.js'      : '',
    \ 'gruntfile.ls'      : '',
    \ 'gulpfile.coffee'   : '',
    \ 'gulpfile.js'       : '',
    \ 'gulpfile.ls'       : '',
    \ 'mix.lock'          : '',
    \ 'dropbox'           : '',
    \ '.ds_store'         : '',
    \ '.gitconfig'        : '',
    \ '.gitignore'        : '',
    \ '.gitattributes'    : '',
    \ '.gitlab-ci.yml'    : '',
    \ '.bashrc'           : '',
    \ '.zshrc'            : '',
    \ '.zshenv'           : '',
    \ '.zprofile'         : '',
    \ '.vimrc'            : '',
    \ '.gvimrc'           : '',
    \ '_vimrc'            : '',
    \ '_gvimrc'           : '',
    \ '.bashprofile'      : '',
    \ 'favicon.ico'       : '',
    \ 'license'           : '',
    \ 'node_modules'      : '',
    \ 'react.jsx'         : '',
    \ 'procfile'          : '',
    \ 'dockerfile'        : '',
    \ 'docker-compose.yml': '',
    \ 'rakefile'          : '',
    \ 'config.ru'         : '',
    \ 'gemfile'           : '',
    \ 'makefile'          : '',
    \ 'cmakelists.txt'    : '',
    \ 'robots.txt'        : 'ﮧ'
    \}

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}
