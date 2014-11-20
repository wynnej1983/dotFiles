" Setup Neobundle
"----------------------------------------
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Lokaltog/powerline-fonts'
NeoBundle 'bling/vim-airline'
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'wesgibbs/vim-irblack'
NeoBundle 'goatslacker/mango.vim'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" map leader key
let mapleader = ","

" 引数なしでvimを開くとNERDTreeを起動
let file_name = expand('%')
if has('vim_starting') &&  file_name == ''
  autocmd VimEnter * NERDTree ./
endif

" カラースキーム
colorscheme ir_black
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
let g:Powerline_symbols = 'compatible' "compatible unicode fancy
"let g:airline_powerline_fonts = 1
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

"----------------------------------------
" Indent
"----------------------------------------
" 画面に表示されるタブ幅
set tabstop=2
" タブをスペース展開
set expandtab
" インデント時のスペース数
set shiftwidth=2
" タブが押された場合にtabstopでなく、shiftwidthの数だけインデントする
set smarttab
" 自動インデント
set autoindent

"----------------------------------------
" Search
"----------------------------------------
" シンタックスハイライト
syntax on

" 行番号の表示
set number
" 空白文字の表示
"set list
" カーソル行をハイライト
set cursorline

" インクリメンタルサーチ
set incsearch
" 大文字小文字を区別しない
set ignorecase
" 大文字と小文字の両方が入力された場合のみ区別する
set smartcase
" 検索文字をハイライトする
set hlsearch
" 最終行まで検索したら先頭行に戻る
set wrapscan

"----------------------------------------
" Other
"----------------------------------------
" タブと行末半角スペースを強調する
:highlight TabSpace ctermbg=DarkBlue
:match TabSpace /\t\|\s\+$/

" ペースト時にオートインデント停止
:set paste

" バックアップファイルを作成しない
set nobackup

filetype plugin on
filetype indent on

set fillchars+=stl:\ ,stlnc:\
set encoding=utf-8
set termencoding=utf8
set term=xterm
set t_Co=256

set columns=150
set noswapfile

" ctags
set tags=./tags;~/code

" begin/end line movement
map H ^
map L $

" NERDTree toggle
map <silent> <leader>n :NERDTreeToggle<CR>

nmap <silent> <leader>s :set spell!<CR>
nmap <silent> <leader>vim :e ~/.vimrc<CR>

" Window Movement
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
nmap <silent> <C-o> :wincmd o<CR>

" Keep the cursor in place while joining limes
nnoremap J mzJ`z

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" toggle paste mode on/off
map <F9> :set paste!<cr>:set paste?<cr>

" toggle line numbers
map <F10> :set number!<cr>:set number?<cr>

" CtrlP mappings
nnoremap <C-t> :CtrlPMixed<Enter>
nnoremap <C-b> :CtrlPMRUFiles<Enter>
map <Leader>fuf :CtrlPClearCache<Enter>

" Main Buffers
map <D-]> :bn<Enter>
map <D-[> :bp<Enter>
map <d-1> :b1<enter>
map <d-2> :b2<enter>
map <d-3> :b3<enter>
map <d-4> :b4<enter>
map <d-5> :b5<enter>
map <d-6> :b6<enter>
map <d-7> :b7<enter>
map <d-8> :b8<enter>
map <d-9> :b9<enter>

" this hops between your previous buffers
map <BackSpace> :b#<Enter>

" these are shortcuts for auto indentation
nmap tt gg=G
vmap tt ngg=Gv

" full screen
map <D-u> :set invfu<CR>

" pagedown/pageup
nmap <Space> <S-m><C-d>
nmap <S-Space> <S-m><C-u>

" same indent behaviour in visual mode
vmap > >gv
vmap < <gv
" fast way to switch to normal mode
imap ii <Esc>
" show current file in NERDTree
map <silent> <C-s> :NERDTree<CR><C-w>p:NERDTreeFind<CR>

"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden
