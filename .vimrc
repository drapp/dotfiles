set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'sjbach/lusty'
Plugin 'ctrlpvim/ctrlp.vim'

nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
set nomodeline

call vundle#end()            " required
filetype plugin indent on    " required

set number
set relativenumber
let g:LycosaExplorerSuppressPythonWarning = 1

execute pathogen#infect()
syntax on
filetype plugin indent on
set expandtab
set tabstop=4
set shiftwidth=4
set hidden
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
imap <C-Space> <C-x><C-o>  
set splitbelow
set splitright
"let g:solarized_termtrans = 1
colorscheme solarized8
set incsearch
set hlsearch
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set nobackup
set noswapfile
set autoread
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
        silent exe "normal! `[v`]\"_c"
            silent exe "normal! p"
endfunction

nnoremap Y y$
nnoremap <Space> :
let g:LustyJugglerSuppressRubyWarning = 1
nmap <silent> \r :LycosaFilesystemExplorerFromHere<CR>
nmap <silent> \t :LycosaFilesystemExplorerFromHere<CR>
nmap <silent> \f :LycosaFilesystemExplorer<CR>
nmap <silent> \b :LycosaBufferExplorer<CR>
nmap <silent> \g :LycosaBufferGrep<CR>
let g:ctrlp_map = '\p'
let g:ctrlp_cmd = 'CtrlP'
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_files=200000
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(js|html|o|png)$'
  \ }

au BufNewFile,BufRead *.gradle setf groovy

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

augroup collumnLimit
  autocmd!
  autocmd BufEnter,WinEnter,FileType erl,thrift
        \ highlight CollumnLimit ctermbg=DarkGrey guibg=DarkGrey
  let collumnLimit = 99 " feel free to customize
  let pattern =
        \ '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
  autocmd BufEnter,WinEnter,FileType erl,thrift
        \ let w:m1=matchadd('CollumnLimit', pattern, -1)
augroup END


nmap , <Plug>Sneak_s
nmap < <Plug>Sneak_S
xmap , <Plug>Sneak_s
xmap < <Plug>Sneak_S
omap , <Plug>Sneak_s
omap < <Plug>Sneak_S
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

