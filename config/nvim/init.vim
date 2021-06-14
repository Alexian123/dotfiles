" <======>  NEOVIM CONFIG <======>
" <==> Author: Alexian Hentiu <==>
" <==> Licensed under GPL 3.0 <==>



" === Install vim plug on first use ===
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" === Plugins ===
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'joshdick/onedark.vim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/nerdtree-project-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()


" === General settings ===
syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set rnu
set nowrap
set ignorecase
set noswapfile
set nobackup
set undodir=~/.cache/nvim/undodir
set undofile
set incsearch
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
colorscheme onedark


" === Constants ===
let mapleader = " "
let g:deoplete#enable_at_startup = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'owo'
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUseNerdFonts = 1


" === Keymaps ===
"
" Exit terminal insert mode
tnoremap <Esc> <C-\><C-n>
"
" Launch built-in terminal
nnoremap <C-s> :split term://bash<CR>
"
" Use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
"
" Deoplete
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
"
" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-n> :NERDTree<CR>


" === Auto commands ===
"
" Always enter terminal buffer in insert mode
autocmd BufWinEnter,WinEnter term://* startinsert
"
" Always exit terminal buffer in normal mode
autocmd BufLeave term://* stopinsert
"
" Relative line numbers in normal mode and regular ones in insert mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
"
" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
"
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
"
" Fix Alacritty window size bug
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
