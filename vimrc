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

" sets how vim shall represent characters internally.
" Utf-8 is necessary for most flavors of Unicode.
set encoding=utf-8

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

" Disable swap files.
set noswapfile

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

" No wrap lines.
set nowrap

" Display the status line always.
set laststatus=2

" Select the colorscheme.
colorscheme monokai

" Fix syntax highlightning for markdown files
autocmd BufNewFile,BufRead *.md set filetype=markdown

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ~>> Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fast saved.
nmap <leader>w :wa!<cr>

" Fast tab closed.
nmap <leader>q :qa!<cr>

" Fast buffer closed.
map <S-Q> :bd!<cr>

" Clear highligth search.
nnoremap <silent> <c-c> :nohl<cr><c-c>

" Smart way to move between windows.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Smart way to move between tabs.
map <S-h> :tabp<cr>
map <S-l> :tabn<cr>

" Remap | and ` to first non-blank character.
map \| ^
map ` ^

" Fast search with <C-r> in visual mode.
vnoremap <C-r> "hy:%s/<C-r>h/<C-r>h/g<left><left>

" Keep the cursor in the same place when you join lines with J.
nnoremap J mzJ`z

" Simplest it don’t do anything.
nnoremap K <nop>

" Insert a new line at the current cursor position.
map <S-s> i<cr><esc>

" After close any of this characters go left into them.
imap "" ""<left>
imap '' ''<left>
imap {} {}<left>
imap [] []<left>
imap () ()<left>

" Copy of the current position to final line.
nnoremap Y y$

" Reload vimrc file easily.
map <leader>r :so~/.vim/vimrc<CR>

" Short way to move tabs :)
map <C-right> :execute "tabmove" tabpagenr() + 1 <cr>
map <C-left> :execute "tabmove" tabpagenr() - 2 <cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ~>> Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Install Vundle if this isn't installed.
let install_bundles=0
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let install_bundles=1
endif

" Set the runtime path to include Vundle.
set rtp+=~/.vim/bundle/Vundle.vim

" Initialize Vundle plugins list and its settings.
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

  " Automatically displays all buffers when there's only one tab open.
  let g:airline#extensions#tabline#enabled=1

  " Enable powerline fonts.
  let g:airline_powerline_fonts=1

  " Airline colorscheme.
  let g:airline_theme='understated'

" Add end after if, do, def and several other keywords.
Plugin 'tpope/vim-endwise'

" A Git wrapper so awesome, it should be illegal.
Plugin 'tpope/vim-fugitive'

" A vim plugin to display the indention levels with thin vertical lines.
Plugin 'Yggdroot/indentLine'

" A vim plugin to comment stuff out.
Plugin 'tpope/vim-commentary'

" Quoting/parenthesizing made simple.
Plugin 'tpope/vim-surround'

" Auto-completion for quotes, parens, brackets, etc. in insert mode.
Plugin 'Raimondi/delimitMate'

" Start a * or # search from a visual block.
Plugin 'bronson/vim-visual-star-search'

" Manage multiple cursors easily.
Plugin 'terryma/vim-multiple-cursors'

" This plugin will allow you to run ack from vim, and shows the results in a
" split window.
Plugin 'mileszs/ack.vim'

" Enable repeating supported plugin maps with ".":
Plugin 'tpope/vim-repeat'

" Use CTRL-A/CTRL-X to increment dates, times, and more.
Plugin 'tpope/vim-speeddating'

" Simple color selector/picker plugin for Vim.
Plugin 'KabbAmine/vCoolor.vim'

" All of your plugins must be added before the following line.
call vundle#end()

" All your other plugins.
if install_bundles == 1
  echo "Installing Bundles (ignore possible key map error messages)"
  echo ""
  :BundleInstall
  :qa
end

" Change default behaviour of ctrl-p plugin when open a new file.
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-t>'],
  \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
  \ }

" Because Vundle required filetype off.
filetype plugin indent on
