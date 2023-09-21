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
"             |   |- <colorscheme/lsp plugins>
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
"   -> https://github.com/Donaldttt/fuzzyy
"
" indentLine: shows vertical indendation bars
"   -> https://github.com/Yggdroot/indentLine
"
" rainbow: bracket colorizer
"   -> https://github.com/luochen1990/rainbow
"
" vim-auto-highlight: highlights matching words in Normal mode
"   -> https://github.com/obxhdx/vim-auto-highlight
"
" vim-cpp-modern: improved syntax highlighting for C/C++
"   -> https://github.com/bfrg/vim-cpp-modern
"
" vim-gitbranch: gets the name of the current branch, used for the status line
"   -> https://github.com/itchyny/vim-gitbranch
"
" vim-gitgutter: shows git diff changes in left gutter
"   -> https://github.com/airblade/vim-gitgutter
"
" vim-pydocstring: automatically generate python function docstrings
"   -> https://github.com/heavenshell/vim-pydocstring
"   -> requires 'doq', installed with 'pip'
"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}


" LSP: {{{
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
" Place in ../.vim/pack/plugins/opt/
"
" lsp: vim9 Language Server implementation
"   -> https://github.com/yegappan/lsp.git
"
" Load the plugin
packadd lsp

" Set Options
call LspOptionsSet(#{
    \   aleSupport: v:false,
    \   autoComplete: v:true,
    \   autoHighlight: v:true,
    \   autoHighlightDiags: v:true,
    \   autoPopulateDiags: v:true,
    \   completionMatcher: 'case',
    \   completionTextEdit: v:true,
    \   completionKinds: {},
    \   customCompletionKinds: v:false,
    \   diagSignErrorText: '',
    \   diagSignInfoText: '',
    \   diagSignHintText: '',
    \   diagSignWarningText: '',
    \   diagVirtualTextAlign: 'above',
    \   echoSignature: v:false,
    \   hideDisabledCodeActions: v:false,
    \   highlightDiagInline: v:true,
    \   hoverInPreview: v:false,
    \   ignoreMissingServer: v:false,
    \   keepFocusInDiags: v:true,
    \   keepFocusInReferences: v:true,
    \   noNewlineInCompletion: v:false,
    \   omniComplete: v:true,
    \   outlineOnRight: v:false,
    \   outlineWinSize: 20,
    \   showDiagInBalloon: v:true,
    \   showDiagInPopup: v:true,
    \   showDiagOnStatusLine: v:true,
    \   showDiagWithSign: v:true,
    \   showDiagWithVirtualText: v:false,
    \   showInlayHints: v:false,
    \   showSignature: v:true,
    \   snippetSupport: v:false,
    \   ultisnipsSupport: v:false,
    \   usePopupInCodeAction: v:true,
    \   useQuickfixForLocations: v:false,
    \   useBufferCompletion: v:true,
    \ })

" pylsp Python Language Server
call LspAddServer([#{
    \   name: 'pylsp',
    \   filetype: 'python',
    \   path: 'pylsp',
    \   args: []
    \ }])

" Clangd C/C++ Language Server
call LspAddServer([#{
    \   name: 'clangd',
    \   filetype: ['c', 'cpp'],
    \   path: 'clangd',
    \   args: ['--background-index', '--clang-tidy']
    \ }])

" Verible SystemVerilog Language Server
call LspAddServer([#{
    \   name: 'verible-verilog-ls',
    \   filetype: ['systemverilog', 'verilog'],
    \   path: 'verible-verilog-ls',
    \   args: ['--rules_config_search']
    \ }])

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
let g:gruvbox_italicize_strings = 0
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
set relativenumber
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

" Smooth line scrolling with mouse
set smoothscroll

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
set statusline+=%#WarningMsg#%{&modified?'*':''}\               " Modified marker
set statusline+=%=                                              " Move to right side
set statusline+=%#LineNr#\%{DisplayOS()}\                       " Operating System
set statusline+=%{&fileencoding}\                               " File encoding type
set statusline+=%#Constant#\\ %-2l\ \ %-2c%#LineNr#           " Row and column numbers

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
let g:indentLine_char = ''

" Configure Rainbow
let g:rainbow_active = 1

" Configure fuzzyy
let g:fuzzyy_devicons = 0                                       " Disable devicons
let g:files_respect_gitignore = 1                               " Respect GitIgnore

" Configure pydocstring
let g:pydocstring_formatter = 'google'
let g:pydocstring_doq_path = 'C:/Users/ghand/AppData/Local/Programs/Python/Python311/Scripts/doq.exe'
let g:pydocstring_enable_mapping = 0

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}


" KEY SHORTCUTS: {{{
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Open netrw File Explorer
nnoremap <silent> t :Lexplore<CR>
" Open Fuzzyy Text Search
nnoremap <silent> <C-f> :FuzzyGrep<CR>
" Open a new tab
nnoremap <silent> <C-t> :tabnew<CR>
" Toggle Relative Line Number
nnoremap <silent> <F1> :set relativenumber!<CR>
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

" Display the current operating system
function DisplayOS()
    if has('win32')
        return ''
    elseif has('win32unix')
        return ''
    elseif has('macunix')
        return '󰀶'
    elseif has('unix')
        return ''
    else
        return ''
    endif
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
    \ 'sv'                : '󰘚',
    \ 'v'                 : '󰘚',
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
    \ 'cxx'               : '',
    \ 'cc'                : '',
    \ 'cp'                : '',
    \ 'c'                 : '',
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
    \ 'r'                 : '󰟔',
    \ 'rproj'             : '󰟔',
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
