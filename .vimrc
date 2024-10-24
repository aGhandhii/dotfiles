" NERD FONTS: {{{
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
"   -> This setup requires the use of NERD fonts, which are patched fonts that
"      include an extended icon library
"
"   -> Install a NERD font at this link:
"       -> https://www.nerdfonts.com
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

" Explicitly declare plugin path
set packpath+=$HOME/.vim

" PLACE PLUGINS IN ../.vim/pack/plugins/start/
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
" vimcomplete: a lightweight vim9script autocompletion engine
"   -> https://github.com/girishji/vimcomplete
"
" vim-cpp-modern: improved syntax highlighting for C/C++
"   -> https://github.com/bfrg/vim-cpp-modern
"
" vim-gitgutter: shows git diff changes in left gutter
"   -> https://github.com/airblade/vim-gitgutter
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
    \   diagSignErrorText: '',
    \   diagSignInfoText: '',
    \   diagSignHintText: '',
    \   diagSignWarningText: '',
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

" PyLSP Python Language Server
if executable ('pylsp')
    call LspAddServer([#{
        \   name: 'pylsp',
        \   filetype: 'python',
        \   path: 'pylsp',
        \   args: []
        \ }])
endif

" Clangd C/C++ Language Server
if executable ('clangd')
    call LspAddServer([#{
        \   name: 'clangd',
        \   filetype: ['c', 'cpp'],
        \   path: 'clangd',
        \   args: ['--background-index', '--clang-tidy']
        \ }])
endif

" Verible SystemVerilog Language Server
if executable('verible-verilog-ls')
    call LspAddServer([#{
        \   name: 'verible-verilog-ls',
        \   filetype: ['systemverilog', 'verilog'],
        \   path: 'verible-verilog-ls',
        \   args: ['--rules_config_search']
        \ }])
endif

" Veridian SystemVerilog Language Server
if executable('veridian-ls')
    call LspAddServer([#{
        \   name: 'veridian-ls',
        \   filetype: ['systemverilog', 'verilog'],
        \   path: 'veridian',
        \   args: []
        \ }])
endif

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

augroup ColorFix
    autocmd!
    autocmd ColorScheme * highlight! link LspDiagSignErrorText Exception
    autocmd ColorScheme * highlight! link LspDiagSignHintText Identifier
    autocmd ColorScheme * highlight! link LspDiagSignInfoText Include
    autocmd ColorScheme * highlight! link LspDiagSignWarningText Type
augroup END

colorscheme gruvbox8_soft

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}


" GENERAL SETTINGS: {{{
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Fold about triple '{' instances
set foldmethod=marker

" Enable syntax highlighting
syntax enable

" Display line numbers, and relative line numbers when in insert mode
set number

" Expand command history
set history=1000

" Use UTF-8 encoding
set encoding=utf-8

" Use system clipboard
if has('win32')
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif

" Update screen more frequently
set updatetime=50

" Disable spell checking
set nospell

" Track location of cursor
set ruler

" Smooth line scrolling with mouse
set smoothscroll

" Character divider for vertical splits
set fillchars=vert:󱋱

" Disables flashing and sounds
set noerrorbells
set novisualbell
set belloff=all

" Indentation settings
set shiftwidth=4                                                " Define shift spacing
set tabstop=4                                                   " Tab equates to 4 spaces
set smarttab                                                    " Indent according to tabstop
set expandtab                                                   " Tab is turned into 'tabstop' spaces
set shiftround                                                  " Round indentation to multiples of 'shiftwidth'
set backspace=indent,eol,start                                  " Backspacing includes indentation
set autoindent                                                  " Remember indentation on newline
set formatoptions=ql                                            " Prevent auto-commentation on newline

" Column highlighting preferences
set cursorline                                                  " Highlight current line
set colorcolumn=80,120                                          " Set style line limits at 80 and 120 characters

" File/Directory settings
set nobackup                                                    " Stop storing auto backups
set noswapfile                                                  " Stop creating swap files
set autochdir                                                   " Switch working directory to current window
set hidden                                                      " Ignore saving when switching between tabs
set confirm                                                     " Skip confirmation when saving and quitting a file

" Text navigation settings
set nowrap                                                      " Disable text wrapping
set sidescroll=1                                                " Allow for horizontal scrolling
set scrolloff=1                                                 " Keep lines above/below cursor
set sidescrolloff=5                                             " Keep lines to the right of the cursor
set mouse=a                                                     " Allow mouse use

" Search settings
set ignorecase                                                  " Ignore capital letters when searching
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
\ *.jpeg,
\ *.heic,
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

" FOR CUSTOMIZATION, these are delimiter characters
" in Insert Mode: (C-v)+u+e0b[0,4,6] -> [,,] 

" Status line layout
" Currently set to work with the Gruvbox8 Colorscheme
function SetStatusLine()
    if &ft ==# "netrw"
        setlocal statusline=
        setlocal statusline+=%#Include#\ 
        setlocal statusline+=%#DiffChange#\󱏒\ Netrw
        setlocal statusline+=%#Include#\
    elseif &bt ==# "terminal"
        setlocal statusline=
        setlocal statusline+=%#Constant#\ 
        setlocal statusline+=%#CommandMode#\\ %{&shell}
        setlocal statusline+=%#Constant#\
    else
        " Clear Status Line
        setlocal statusline=

        " Git Branch
        setlocal statusline+=%#Special#%{TruncatedBranch()==''?'':''}
        setlocal statusline+=%#IncSearch#%{TruncatedBranch()}%#LineNr#
        setlocal statusline+=%#Special#%{TruncatedBranch()==''?'':''}\ 

        " Filename
        setlocal statusline+=%#Identifier#
        setlocal statusline+=%#InsertMode#\%{WebDevIconsGetFileTypeSymbol()}\ %f
        setlocal statusline+=%{&modified?'*':''}
        setlocal statusline+=%#Identifier#\

        " Switch to the Right Side
        setlocal statusline+=%=

        " Language Server Diagnostics

        " Info
        setlocal statusline+=%#Include#%{ShowLspInfo()!=''?'':''}
        setlocal statusline+=%#DiffChange#%{ShowLspInfo()}
        setlocal statusline+=%#Include#%{ShowLspInfoEnd()}

        " Hints
        setlocal statusline+=%#Identifier#%{ShowLspHint()!=''?'':''}
        setlocal statusline+=%#InsertMode#%{ShowLspHint()}
        setlocal statusline+=%#Identifier#%{ShowLspHintEnd()}

        " Warnings
        setlocal statusline+=%#Type#%{ShowLspWarning()!=''?'':''}
        setlocal statusline+=%#Search#%{ShowLspWarning()}
        setlocal statusline+=%#Type#%{ShowLspWarningEnd()}

        " Errors
        setlocal statusline+=%#Exception#%{ShowLspError()!=''?'':''}
        setlocal statusline+=%#ErrorMsg#%{ShowLspError()}
        setlocal statusline+=%#Exception#%{ShowLspErrorEnd()}

        " Operating System and File Encoding
        setlocal statusline+=%#LineNr#
        setlocal statusline+=%#PMenuThumb#
        highlight PMenuThumb guifg=#32302f
        setlocal statusline+=%{DisplayOS()}\%{FileEncodeSpace()}\%{&fileencoding}
        setlocal statusline+=%#LineNr#\

        " Row and Column
        setlocal statusline+=%#Constant#\ 
        setlocal statusline+=%#CommandMode#
        setlocal statusline+=\\ %-2l\ \ %-2c
        setlocal statusline+=%#Constant#

    endif
endfunction

" Update the status line with multiple buffers
augroup HandleStatusLines
    autocmd!
    autocmd VimEnter,WinEnter,BufEnter,BufWritePost * call GetGitBranch() | set statusline= | setlocal statusline=%!SetStatusLine()
augroup END

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}


" PLUGIN CONFIGURATION: {{{
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Configure Netrw
let g:netrw_liststyle=3                                         " Tree layout
let g:netrw_banner=0                                            " Removes the info banner
let g:netrw_browse_split=4                                      " Open new files to the right window
let g:netrw_winsize=25                                          " Default vertical width
let g:netrw_altv=1                                              " Split to left side
let g:netrw_preview=1                                           " Show preview in vertical split

" Configure GitGutter
augroup UpdateGitGutter
    autocmd!
    autocmd BufWritePost,CmdwinLeave,WinEnter * GitGutter       " Update gitgutter more often
augroup END
let g:gitgutter_sign_added=''
let g:gitgutter_sign_modified=''
let g:gitgutter_sign_removed=''
let g:gitgutter_sign_removed_first_line=''
let g:gitgutter_sign_removed_above_and_below =''
let g:gitgutter_sign_modified_removed=''
let g:gitgutter_sign_priority = 0

" Configure indentLine
let g:indentLine_char = ''

" Configure Rainbow
let g:rainbow_active = 1

" Configure fuzzyy
let g:fuzzyy_devicons = 1                                       " Enable devicons
let g:files_respect_gitignore = 1                               " Respect GitIgnore
let g:enable_fuzzyy_MRU_files = 1                               " Store recent files

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}


" KEY SHORTCUTS: {{{
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Open netrw File Explorer
nnoremap <silent> <Leader>t :Lexplore<CR>
" Open a new tab
nnoremap <silent> <C-t> :tabnew<CR>
" Change Buffer
nnoremap <silent> <A-Left> :bp<CR>
nnoremap <silent> <A-Right> :bn<CR>
" Close a Buffer, not a Window
nnoremap <silent> q :bp<bar>sp<bar>bn<bar>bd<CR>

" Better Scrolling
noremap <silent> <S-k>                  <S-Up>
noremap <silent> <S-j>                  <S-Down>
noremap <silent> <C-Up>                 5<C-y>
noremap <silent> <C-k>                  5<C-y>
noremap <silent> <C-Down>               5<C-e>
noremap <silent> <C-j>                  5<C-e>
noremap <silent> <S-Left>               5zh
noremap <silent> <S-h>                  5zh
noremap <silent> <C-ScrollWheelUp>      5zh
noremap <silent> <S-Right>              5zl
noremap <silent> <S-l>                  5zl
noremap <silent> <C-ScrollWheelDown>    5zl

" Tab Completion
inoremap <C-b> <C-n>
inoremap <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <silent><expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <silent><expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}


" CUSTOM UTILITY FUNCTIONS: {{{
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Get the git branch name
function GetGitBranch()
    let b:dir = expand('%:p:h')
    if has('win32')
        let b:git_branch = trim(system("powershell cd " . b:dir . "; git rev-parse --abbrev-ref HEAD 2> NUL"))
    else
        let b:git_branch = trim(system("cd " . b:dir . "; git rev-parse --abbrev-ref HEAD 2> /dev/null"))
    endif
endfunction

" Limit git branch text length (for status bar)
function TruncatedBranch()
    if strlen(b:git_branch) > 50
        return "  " . strpart(b:git_branch, 0, 50)
    elseif strlen(b:git_branch) == 0
        return ""
    endif
    return "  " . b:git_branch
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

" Get file encoding spacing for the status line
function FileEncodeSpace()
    if &fileencoding!=''
        return ' '
    endif
    return ''
endfunction

" Display Language Server Diagnostic Summary on the Statusline

" Information
function ShowLspInfo()
    let summary = lsp#lsp#ErrorCount()
    let LspInfoString = ''
    if summary['Info'] != 0
        let LspInfoString = LspInfoString . ' ' . summary['Info']
    endif
    return LspInfoString
endfunction
function ShowLspInfoEnd()
    if ShowLspInfo()==''
        return ''
    endif
    return ' '
endfunction

" Hints
function ShowLspHint()
    let summary = lsp#lsp#ErrorCount()
    let LspHintString = ''
    if summary['Hint'] != 0
        let LspHintString = LspHintString . ' ' . summary['Hint']
    endif
    return LspHintString
endfunction
function ShowLspHintEnd()
    if ShowLspHint()==''
        return ''
    endif
    return ' '
endfunction

" Warnings
function ShowLspWarning()
    let summary = lsp#lsp#ErrorCount()
    let LspWarnString = ''
    if summary['Warn'] != 0
        let LspWarnString = LspWarnString . ' ' . summary['Warn']
    endif
    return LspWarnString
endfunction
function ShowLspWarningEnd()
    if ShowLspWarning()==''
        return ''
    endif
    return ' '
endfunction

" Errors
function ShowLspError()
    let summary = lsp#lsp#ErrorCount()
    let LspErrString = ''
    if summary['Error'] != 0
        let LspErrString = LspErrString . ' ' . summary['Error']
    endif
    return LspErrString
endfunction
function ShowLspErrorEnd()
    if ShowLspError()==''
        return ''
    endif
    return ' '
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

" Determine file icon for file type
" Code modified from vim-devicons for compatibility with fuzzyy plugin
function! WebDevIconsGetFileTypeSymbol(...) abort

    " Check for args and store file extension and name
    if a:0 == 0
        let fileNode = expand('%:t')
        let fileNodeExtension = !empty(expand('%:e')) ? expand('%:e') : &filetype
    else
        let fileNode = fnamemodify(a:1, ':t')
        let fileNodeExtension = fnamemodify(a:1, ':e')
    endif

    " Set symbol default and prevent case sensitivity errors
    let symbol = ''
    let fileNode = tolower(fileNode)
    let fileNodeExtension = tolower(fileNodeExtension)
  
    " Check for a match in the glyph dictionary
    if has_key(g:file_icons, fileNode)
        let symbol = g:file_icons[fileNode]
    elseif has_key(g:file_icons, fileNodeExtension)
        let symbol = g:file_icons[fileNodeExtension]
    endif

    " Return the icon
    return symbol

endfunction

" Icon references
let g:file_icons = {
    \ 'sv'                : '󰘚',
    \ 'v'                 : '󰘚',
    \ 's'                 : '',
    \ 'arm'               : '',
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
    \ 'elm'               : '',
    \ 'swift'             : '',
    \ 'xcplayground'      : '',
    \ 'tex'               : 'ﭨ',
    \ 'r'                 : '󰟔',
    \ 'rproj'             : '󰟔',
    \ 'readme.md'         : '',
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
    \ 'do'                : '',
    \ 'cmakelists.txt'    : '',
    \ 'robots.txt'        : 'ﮧ'
    \}

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}
