""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Note:
"    PLEASE!!! DON'T PUT ANY LINES IN YOUR VIMRC THAT YOU DON'T UNDERSTAND.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Vim configuration file ~/.vimrc
"
"  Author:
"    Gasparrini, Jonathan Leonel
"    jlgasparrini@gmail.com
"
"  Sections:
"    ~>> General settings
"    ~>> Visual settings
"    ~>> Shortcuts
"    ~>> Plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ~>> General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Be IMproved.
set nocompatible

" Disable the welcome screen.
set shortmess+=I

" Enable filetype plugins.
filetype plugin on
filetype indent on

" Sets how many lines of history VIM has to remember.
set history=800

" Return to last edit position when opening files.
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" When searching ignore case sensitive.
set ignorecase

" Highlight search results.
set hlsearch

" Incremental search, makes search act like search in modern browsers.
set incsearch

" Vim will automatically remove all trailing whitespace before saving.
autocmd BufWritePre * :%s/\s\+$//e

" Disable swap files
set noswapfile

" Which will place yanked text into the global clipboard, and allow you to
" paste from the global clipboard.
set clipboard=unannamedplus

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ~>> Visual settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax processing.
syntax enable

" Show line numbers.
set number

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=5

" Use the appropriate number of spaces to insert a <Tab>.
set expandtab

" A <Tab> in front of a line inserts blanks according to 'shiftwidth'.
set smarttab

" Number of spaces to use for each step of (auto)indent.
set shiftwidth=2

" Number of spaces that a <Tab> in the file counts for.
set tabstop=2

" Enable auto indent.
set autoindent

" Enable smart indent.
set smartindent

" No wrap lines
set nowrap

" Display the status line always
set laststatus=2

" Select the colorscheme
colorscheme monokai

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ~>> Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fast saved
nmap <leader>w :wa!<cr>

" Fast tab closed
nmap <leader>q :qa!<cr>

" Fast buffer closed
map <S-Q> :bd!<cr>

" Clear highligth search
nnoremap <silent> <c-c> :nohl<CR><c-c>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Smart way to move between tabs
map <S-h> :tabp<cr>
map <S-l> :tabn<cr>

" Remap | to first non-blank character
map \| ^

" Fast search with <C-r> in visual mode.
vnoremap <C-r> "hy:%s/<C-r>h/<C-r>h/g<left><left>

" Keep the cursor in the same place when you join lines with J
nnoremap J mzJ`z

" Simplest it don’t do anything
nnoremap K <nop>

" Insert a new line at the current cursor position
map <S-s> i<cr><esc>

" After close any of this characters insert a space automatically
imap "" ""<Left>
imap '' ''<Left>
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>

" Copy of the current position to final line
nnoremap Y y$

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ~>> Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the runtime path to include Vundle.
set rtp+=~/.vim/bundle/Vundle.vim

" Initialize Vundle plugin.
call vundle#begin()

" Let Vundle manage Vundle, required  by Vundle.
Plugin 'gmarik/Vundle.vim'

" The NERD tree allows you to explore your filesystem and to open files and directories.
Plugin 'scrooloose/nerdtree.git'

" NERDTree and tabs together in Vim, painlessly.
Plugin 'jistr/vim-nerdtree-tabs'

  " Open NERDTree on console vim startup.
  let g:nerdtree_tabs_open_on_console_startup=1

  " When switching into a tab, make sure that focus is on the file window, not in the NERDTree window.
  let g:nerdtree_tabs_focus_on_files=1

  " Automatically find and select currently opened file in NERDTree.
  let g:nerdtree_tabs_autofind=1

" Fuzzy file, buffer, mru, tag, etc finder.
Plugin 'kien/ctrlp.vim'

" Lean & mean status/tabline for vim that's light as air.
Plugin 'bling/vim-airline'

  " Automatically displays all buffers when there's only one tab open
  let g:airline#extensions#tabline#enabled = 1

  " Enable powerline fonts
  let g:airline_powerline_fonts = 1

  " Airline colorscheme
  let g:airline_theme = 'understated'

" Add end after if, do, def and several other keywords.
Plugin 'tpope/vim-endwise'

" A Git wrapper so awesome, it should be illegal.
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line. Required by Vundle.
call vundle#end()

" Because Vundle required filetype off.
filetype plugin indent on
