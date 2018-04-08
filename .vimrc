set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Bundle 'christoomey/vim-tmux-navigator'

call vundle#end()            " required
filetype plugin indent on    " required

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
let g:solarized_termtrans = 1
colorscheme solarized
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
nmap <silent> \r <Plug>LustyFilesystemExplorerFromHere<CR>
nmap <silent> \t <Plug>LustyFilesystemExplorerFromHere<CR>
nmap <silent> \f <Plug>LustyFilesystemExplorer<CR>
nmap <silent> \b <Plug>LustyBufferExplorer<CR>
nmap <silent> \g <Plug>LustyBufferGrep<CR>
let g:ctrlp_map = '\p'
set runtimepath^=~/.vim/bundle/ctrlp.vim


let @p = 'yyp==iio:format("drappLog f(s~p~n", [{f)C}]),'
let @d = 'yawoio:format("drappLog pa ~p~n", [pa]),'
let @t = 'y%oio:format("drappLog pa ~p~n", [pa]),'
let @c = 'A€kbcatch Err:Reason ->io:format("drappLog caught ~p:~p ~p", [Err, Reason, erlang:get_stacktrace()])end,'
let @n = 'rAllrBf>lskoio:format("drappLog caught ~p:~p~n", [A, B]),'
let @b = 'F"i<<f";a>>'

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


call togglebg#map("<F5>")
let g:ctrlp_custom_ignore = {
  \ 'dir':  '^deps$',
  \ 'file': '\v\.beam$',
  \ }
nmap , <Plug>Sneak_s
nmap < <Plug>Sneak_S
xmap , <Plug>Sneak_s
xmap < <Plug>Sneak_S
omap , <Plug>Sneak_s
omap < <Plug>Sneak_S
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
