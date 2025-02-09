" CURRENT PLUGINS: {{{
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Explicitly declare plugin path
set packpath+=$HOME/.vim

" PLACE PLUGINS IN ../.vim/pack/plugins/start/
"
" auto-pairs: bracket pair tool
"   -> https://github.com/LunarWatcher/auto-pairs
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
    \   aleSupport:                 v:false,
    \   autoComplete:               v:true,
    \   autoHighlight:              v:true,
    \   autoHighlightDiags:         v:true,
    \   autoPopulateDiags:          v:true,
    \   completionMatcher:          'case',
    \   completionTextEdit:         v:true,
    \   completionKinds:            {},
    \   customCompletionKinds:      v:false,
    \   diagSignErrorText:          '',
    \   diagSignInfoText:           '',
    \   diagSignHintText:           '',
    \   diagSignWarningText:        '',
    \   diagVirtualTextAlign:       'above',
    \   echoSignature:              v:false,
    \   hideDisabledCodeActions:    v:false,
    \   highlightDiagInline:        v:true,
    \   hoverInPreview:             v:false,
    \   ignoreMissingServer:        v:false,
    \   keepFocusInDiags:           v:true,
    \   keepFocusInReferences:      v:true,
    \   noNewlineInCompletion:      v:false,
    \   omniComplete:               v:true,
    \   outlineOnRight:             v:false,
    \   outlineWinSize:             20,
    \   showDiagInBalloon:          v:true,
    \   showDiagInPopup:            v:true,
    \   showDiagOnStatusLine:       v:true,
    \   showDiagWithSign:           v:true,
    \   showDiagWithVirtualText:    v:false,
    \   showInlayHints:             v:false,
    \   showSignature:              v:true,
    \   snippetSupport:             v:false,
    \   ultisnipsSupport:           v:false,
    \   usePopupInCodeAction:       v:true,
    \   useQuickfixForLocations:    v:false,
    \   useBufferCompletion:        v:true,
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
if executable('veridian')
    call LspAddServer([#{
        \   name: 'veridian',
        \   filetype: ['systemverilog', 'verilog'],
        \   path: 'veridian',
        \   features: {'diagnostics': v:false}
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

" Make cursor a vertical bar
let &t_EI="\e[6 q]"

" Smooth line scrolling with mouse
if exists('&smoothscroll')
    set smoothscroll
endif

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
augroup NoCommentOnNewLine
    autocmd!
    autocmd BufReadPost * set formatoptions=ql
augroup END

" Column highlighting preferences
set cursorline                                                  " Highlight current line
set colorcolumn=80,120                                          " Set style line limits at 80 and 120 characters

" File/Directory settings
set nobackup                                                    " Stop storing auto backups
set noswapfile                                                  " Stop creating swap files
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
function SetStatusLine()
    if &ft ==# "netrw"
        setlocal statusline=
        setlocal statusline+=%#Include#\ 
        setlocal statusline+=%#DiffChange#\󱏒\ Netrw
        setlocal statusline+=%#Include#\
    elseif &bt ==# "terminal"
        setlocal statusline=
        setlocal statusline+=%#ModeMsg#\
        setlocal statusline+=%#Search#\\ %{&shell}
        setlocal statusline+=%#ModeMsg#\
    else
        " Clear Status Line
        setlocal statusline=

        " Git Branch
        setlocal statusline+=%#Special#%{b:git_branch==''?'':''}
        setlocal statusline+=%#IncSearch#%{TruncatedBranch()}%#LineNr#
        setlocal statusline+=%#Special#%{b:git_branch==''?'':''} 

        " Filename
        setlocal statusline+=%#Identifier#%{b:git_branch==''?'':''} 
        setlocal statusline+=%#InsertMode#%{b:git_branch==''?'':''} 
        setlocal statusline+=%#InsertMode#\%{WebDevIconsGetFileTypeSymbol()}\ %t
        setlocal statusline+=%{&modified?'*':''}
        setlocal statusline+=%#Identifier#

        " Switch to the Right Side
        setlocal statusline+=%=

        " Language Server Diagnostics
        if b:LspSummary['Info'] != 0
            setlocal statusline+=%#Define#%{b:LspInfoString}\ 
        endif
        if b:LspSummary['Hint'] != 0
            setlocal statusline+=%#Identifier#%{b:LspHintString}\ 
        endif
        if b:LspSummary['Warn'] != 0
            setlocal statusline+=%#ModeMsg#%{b:LspWarnString}\ 
        endif
        if b:LspSummary['Error'] != 0
            setlocal statusline+=%#WarningMsg#%{b:LspErrString}\ 
        endif

        " Operating System and File Encoding
        setlocal statusline+=%#LineNr#\ 
        setlocal statusline+=%#PMenuThumb#
        setlocal statusline+=%{DisplayOS()}\ %{(&fileencoding==''?'':&fileencoding)}
        setlocal statusline+=

        " Row and Column
        setlocal statusline+=%#Constant#
        setlocal statusline+=%#CommandMode#\ %-1l\ \ %-1c
        setlocal statusline+=%#Constant#

    endif
endfunction

" Update the status line with multiple buffers
augroup HandleStatusLines
    autocmd!
    autocmd VimEnter,ColorScheme * highlight! PMenuThumb guifg=bg
    autocmd VimEnter,WinEnter,BufEnter,BufWritePost,InsertLeave
        \ * call GetGitBranch() | call GetLspStats()
        \ | set statusline= | setlocal statusline=%!SetStatusLine()
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
let g:enable_fuzzyy_MRU_files = 1                               " Store recent files
let g:fuzzyy_enable_mappings = 0                                " Disable keymap defaults
" Fuzzy keymaps
nnoremap <silent> <leader>ff :FuzzyFiles<CR>
nnoremap <silent> <Leader>fb :FuzzyBuffers<CR>
nnoremap <silent> <leader>fm :FuzzyMru<CR>

" Configure vimcomplete
let g:vimcomplete_conf = {
    \ 'tag' : {'enable' : v:true},
    \ 'completor' : {'kindDisplayType' : 'icon'}
    \ }
autocmd VimEnter * call g:VimCompleteOptionsSet(g:vimcomplete_conf)

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}


" KEY SHORTCUTS: {{{
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Open netrw File Explorer
nnoremap <silent> <Leader>t     :Lexplore<CR>
" Close a Buffer, not a Window
nnoremap <silent> <Leader>q     :bp<bar>sp<bar>bn<bar>bd<CR>
" Open a tag in a vertical split
nnoremap <silent> <C-w><C-]>    :only<bar>vsplit<CR>:execute "tag " . expand('<cword>')<CR>

" Better Scrolling
noremap <silent> <S-k>          <S-Up>
noremap <silent> <S-j>          <S-Down>
noremap <silent> <C-Up>         5<C-y>
noremap <silent> <C-k>          5<C-y>
noremap <silent> <C-Down>       5<C-e>
noremap <silent> <C-j>          5<C-e>
noremap <silent> <S-Left>       5zh
noremap <silent> <S-h>          5zh
noremap <silent> <S-Right>      5zl
noremap <silent> <S-l>          5zl

" Tab Completion
inoremap <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <silent><expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <silent><expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}


" CUSTOM UTILITY FUNCTIONS: {{{
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Automatically highlight matching words in normal mode
function AutoHighlightWord()
    silent! call ClearAutoHighlightMatches()
    let s:word = expand('<cword>')
    if &background ==# "dark"
        highlight! AutoHighlightWord guibg=#444444 guifg=NONE
    else
        highlight! AutoHighlightWord guibg=#E4E4E4 guifg=NONE
    endif
    if match(s:word, '\w\+') >= 0 && len(s:word) > 1
        let s:escaped_word = substitute(s:word, '\(*\)', '\\\1', 'g')
        call add(w:highlight_ids, matchadd('AutoHighlightWord', '\<'.s:escaped_word.'\>', 0))
    endif
endfunction
" Clear existing auto-highlighed matches
function ClearAutoHighlightMatches()
    if !exists('w:highlight_ids')
        let w:highlight_ids = []
    endif
    let ids = w:highlight_ids
    while !empty(ids)
        silent! call matchdelete(remove(ids, -1))
    endwhile
endfunction
" Automate auto-highlight functionality
augroup AutoHighlightWords
    autocmd!
    autocmd CursorHold  * call AutoHighlightWord()
    autocmd CursorMoved * call ClearAutoHighlightMatches()
augroup END

" Get the git branch name
function GetGitBranch()
    let b:dir = expand('%:p:h')
    if has('win32')
        let b:git_branch = trim(system("powershell cd " . b:dir . "; git rev-parse --abbrev-ref HEAD 2> NUL"))
    else
        let b:git_branch = trim(system("cd " . b:dir . "; git rev-parse --abbrev-ref HEAD 2> /dev/null"))
    endif
endfunction

" If available, automatically load tags file for a repository
augroup AutoGitRepoTags
    autocmd!
    autocmd VimEnter,WinEnter,BufEnter * call LoadRepoTags()
augroup END
function LoadRepoTags()
    let b:repo_root = trim(system('git rev-parse --show-toplevel')) . "/tags"
    if filereadable(b:repo_root)
        exec "set tags+=" . b:repo_root
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

" Display Language Server Diagnostic Summary on the Statusline
function GetLspStats()
    let b:LspSummary    = lsp#lsp#ErrorCount()
    let b:LspInfoString = '' . b:LspSummary['Info']
    let b:LspHintString = '' . b:LspSummary['Hint']
    let b:LspWarnString = '' . b:LspSummary['Warn']
    let b:LspErrString  = '' . b:LspSummary['Error']
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
