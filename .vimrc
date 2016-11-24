"
" ~/.vimrc
"

" General Options
"---------------------------------
set nocompatible
set autoread
set backspace=indent,eol,start
set backupcopy=yes                     " keep attributes of original file
set backupdir=$HOME/.vim/backup        " store backups under ~/.vim/backup
set backupskip=/tmp/*
set completeopt=longest,menuone
set directory=~/.vim/swap,~/tmp,.      " keep swp files under ~/.vim/swap
set expandtab
set formatoptions+=j
set history=50
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set number
set printoptions=left:5pc,right:5pc,top:5pc,bottom:10pc,syntax:n
set ruler
set scrolloff=5
set shiftwidth=2
set shortmess=atI
set showcmd
set showmatch
set showmode
set shell=/bin/bash
set smartcase
set smarttab
set tabstop=4
set title
set virtualedit=all
set wildmenu
set wildmode=list:longest,full

source ~/.vim/functions.vim

if filereadable(expand("$HOME") . "/.vim/vundle.vim")
  source ~/.vim/vundle.vim
endif

filetype plugin indent on


" extra colors
"---------------------------------
syntax on
"colorscheme dante
hi Pmenu ctermfg=Cyan ctermbg=Blue
hi PmenuSel ctermfg=White ctermbg=DarkYellow

colorscheme molokai

" variables
"---------------------------------
let maplocalleader = ","
let mapleader = ","


" keymapping
"---------------------------------
map Q gq
map <LocalLeader>t <Esc>:tabnew<CR>
map <LocalLeader>1  1gt
map <LocalLeader>2  2gt
map <LocalLeader>3  3gt
map <LocalLeader>4  4gt
map <LocalLeader>5  5gt
map <LocalLeader>6  6gt
map <LocalLeader>7  7gt
map <LocalLeader>8  8gt
map <LocalLeader>9  9gt

cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

nnoremap <F5> :make<CR>
nnoremap <S-F5> :make %<<CR>
nnoremap <S-F6> :./%<<CR>

vmap <LocalLeader>y "+y
vmap <LocalLeader>p "+p
vmap <LocalLeader>c :call CommentLines()<CR>

map <LocalLeader>b :let b:is_bash=1<CR>:let g:sh_no_error=1<CR>:set syn=sh<CR>

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

nnoremap j gj
nnoremap k gk

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

map <LocalLeader>l :Tlist<CR>


" Tab/Indent Exceptions
"---------------------------------
autocmd FileType make set noexpandtab
autocmd FileType python set shiftwidth=4 tabstop=4

" autocmd BufRead,BufWritePre,FileWritePre * silent! %s/[\r \t]\+$//


" Commenting
"---------------------------------
" default comment symbol
let g:StartComment="#"
let g:EndComment=""

let g:tar_cmd= "bsdtar"

" example of changing it for a filetype
au FileType c,cpp     let g:StartComment = "//"
au FileType vim       let g:StartComment = "\""


" Code Folding
"---------------------------------
if has ('folding')
  set foldenable
  set foldmethod=marker
  set foldmarker={{{,}}}
  set foldcolumn=0
endif


" Substitutions
"---------------------------------
if &term !=# "linux" && $LANG !=# "C"
    set list listchars=tab:\»\ ,trail:·,extends:›,precedes:‹
endif

" Mutt
"--------------------------------
au BufRead,BufNew ~/.mutt/tmp/mutt* so ~/.mutt/mutt.vim

au BufRead,BufNew *.am set ft=automake
au BufNewFile,BufRead *.yaml,*.yml    setf yaml
