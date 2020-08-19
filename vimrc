call plug#begin('~/.vim/plugged')
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
Plug 'preservim/nerdtree'
" Vim client for TabNine https://tabnine.com/
Plug 'codota/tabnine-vim'
Plug 'kaicataldo/material.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'luochen1990/rainbow'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'    " Use RipGrep in Vim and display results in a quickfix list
Plug 'rust-lang/rust.vim'
Plug 'majutsushi/tagbar'
Plug 'preservim/nerdcommenter'
Plug 'buoto/gotests-vim'
Plug 'google/vim-colorscheme-primary'
Plug 'terryma/vim-multiple-cursors'
Plug 'cstrahan/vim-capnp'
Plug 'wakatime/vim-wakatime'
" Initialize plugin system
call plug#end()

" Set the leader button
let mapleader = ','

" Allow vim to set a custom font or color for a word
" syntax enable
syntax on

"if (has("termguicolors"))
"        set termguicolors
"endif
let NERDTreeQuitOnOpen=1
" Autosave buffers before leaving them
autocmd BufLeave * silent! :wa

" Remove trailing white spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Center the screen quickly
nnoremap <space> zz

"let g:material_theme_style = 'darker'
"let g:material_terminal_italics = 1
let g:rainbow_active = 1
"colorscheme material
set t_Co=256
set background=dark
colorscheme primary

set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
set autoread                      " reload file if the file changes on the disk
set autowrite                     " write when switching buffers
set autowriteall                  " write on :quit
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif
"set clipboard=unnamedplus
"set colorcolumn=81                " highlight the 80th column as an indicator
set completeopt-=preview          " remove the horrendous preview window
"set cursorline                    " highlight the current line for the cursor
"hi clear CursorLine
"hi CursorLine gui=underline cterm=underline
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234
set encoding=utf-8
set expandtab                     " expands tabs to spaces
set list                          " show trailing whitespace
set listchars=tab:\|\ ,trail:▫
set nospell                       " disable spelling
set noswapfile                    " disable swapfile usage
set nowrap
set noerrorbells                  " No bells!
set novisualbell                  " I said, no bells!
set number                        " show number ruler
set relativenumber                " show relative numbers in the ruler
set ruler
set formatoptions=tcqronj         " set vims text formatting options
set softtabstop=2
set tabstop=2
"set textwidth=80
set title                         " let vim set the terminal title
set updatetime=300                " redraw the status bar often
set wildmenu			  " command-line completion operates in an enhanced mode
set wildmode=longest,list,full	  " :h 'wildmode'
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"----------------------------------------------
" Plugin: scrooloose/nerdtree
"----------------------------------------------
nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <F2> :NERDTreeToggle<cr>
"----------------------------------------------
" Language: Golang
"----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
"----------------------------------------------
" Language: Rust
"----------------------------------------------
au FileType rust set expandtab
"au FileType rust set noexpandtab
au FileType rust set shiftwidth=4
au FileType rust set softtabstop=4
au FileType rust set tabstop=4
let g:rustfmt_autosave = 1
"----------------------------------------------
" Language: Python
"----------------------------------------------
au FileType python set expandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4
"----------------------------------------------
" Plugin: 'junegunn/fzf.vim'
"----------------------------------------------
nnoremap <c-p> :FZF<cr>

" tagbar
nmap <F3> :TagbarToggle<CR>
nnoremap <leader>t :TagbarToggle<cr>
let g:rust_use_custom_ctags_defs = 1
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/usr/local/bin/ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }

" Language: Go
" Tagbar configuration for Golang
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 2
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
