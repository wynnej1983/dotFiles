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
NeoBundle 'shougo/unite.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Lokaltog/powerline-fonts'
NeoBundle 'bling/vim-airline'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'fatih/vim-go'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'othree/yajs.vim'
NeoBundle 'jason0x43/vim-js-indent'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'othree/es.next.syntax.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'wesgibbs/vim-irblack'
NeoBundle 'goatslacker/mango.vim'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'rbgrouleff/bclose.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'ervandew/supertab'
NeoBundle 'gertjanreynaert/cobalt2-vim-theme'
NeoBundle 'gorkunov/smartpairs.vim'
NeoBundle 'sirver/ultisnips'
NeoBundle 'terryma/vim-multiple-cursors'

call neobundle#end()

filetype plugin on
filetype indent on

filetype plugin indent on

NeoBundleCheck

" map leader key
let mapleader = ","

nnoremap <Leader><Leader> :e#<CR>

" Add keyboard shortcuts
map <C-Tab> :bn<Esc>
map <C-S-Tab> :bp<Esc>

" map <leader>w :bp<bar>sp<bar>bn<bar>bd<CR>
" macmenu &File.Close key=<nop>
" map <D-w> :bp<bar>sp<bar>bn<bar>bd<CR>

autocmd FileType nerdtree cnoreabbrev <buffer> bd <nop
autocmd FileType nerdtree cnoreabbrev <buffer> bn <nop
autocmd FileType nerdtree cnoreabbrev <buffer> bp <nop

set shortmess+=I
set cursorline
set number relativenumber

" NerdTree style for default file explorer
let g:netrw_liststyle=3

" 引数なしでvimを開くとNERDTreeを起動
let file_name = expand('%')
if has('vim_starting') &&  file_name == ''
  autocmd VimEnter * NERDTree ./
endif
" auto format json files on save
" autocmd FileType json autocmd BufWritePre <buffer> %!python -m json.tool

" カラースキーム
" colorscheme cobalt2
" set background=dark
highlight NonText ctermbg=none

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
set guifont=Inconsolata\ for\ Powerline\ 18

""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""
" Airline
let g:airline#extensions#tabline#enabled = 0
" let g:airline_theme='papercolor'
let g:Powerline_symbols = 'compatible' "compatible unicode fancy
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
"let g:airline#extensions#tabline#enabled = 1
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
""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""
let g:syntastic_javascript_checkers = ['eslint', 'standard']
"let g:syntastic_javascript_checkers = ['jsxhint']
"let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
let g:airline#extensions#tabline#enabled = 1

" javascipt standard auto format file on save
" autocmd bufwritepost *.js silent !standard-format -w %
" set autoread

"----------------------------------------
" Vim-Jsx
"--------------------------------------
let g:jsx_ext_required = 0

"----------------------------------------
" Indent
"----------------------------------------
" 画面に表示されるタブ幅
set tabstop=4
" タブをスペース展開
set expandtab
" インデント時のスペース数
set shiftwidth=2
" タブが押された場合にtabstopでなく、shiftwidthの数だけインデントする
set smarttab
" 自動インデント
set autoindent
"let g:js_indent_log = 1

"----------------------------------------
" Search
"----------------------------------------
" シンタックスハイライト
syntax on
" remove delay when esc
set timeoutlen=1000 ttimeoutlen=0
" 行番号の表示
set number
" 空白文字の表示
"set list
" カーソル行をハイライト
" set nocursorline
"hi CursorLine ctermbg=8 ctermfg=15 "8 = dark gray, 15 = white
"hi Cursor ctermbg=15 ctermfg=8

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
" Golang
"----------------------------------------
au BufNewFile,BufRead *.go setlocal noet ts=8 sw=8 sts=8

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go nmap <Leader>s <Plug>(go-implements)

au FileType go nmap <Leader>i <Plug>(go-info)

au FileType go nmap <Leader>e <Plug>(go-rename)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
"----------------------------------------
" Other
"----------------------------------------
" タブと行末半角スペースを強調する
" :highlight TabSpace ctermbg=DarkBlue
" :match TabSpace /\t\|\s\+$/

" ペースト時にオートインデント停止
set paste
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>
vnoremap <C-c> "+y
set clipboard=unnamed
vmap <C-c> "+y

" enable scrolling
set mouse=a

" バックアップファイルを作成しない
set nobackup

set fillchars+=stl:\ ,stlnc:\
set encoding=utf-8
set termencoding=utf8
set term=xterm
set t_Co=256

let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

" Making cursor a bar in insert mode
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" cursor guide
" let &t_ti.="\<Esc>]1337;HighlightCursorLine=true\x7"
" let &t_te.="\<Esc>]1337;HighlightCursorLine=false\x7"

if has("gui_running")
  autocmd GUIEnter * set vb t_vb=
  set guifont=Source\ Code\ Pro\ for\ Powerline:h16
  set linespace=2
  set guioptions=
  "set guioptions-=r
endif


set columns=150
set noswapfile

" prevents cursor lag when jk'ing
set lazyredraw

" ctags
set tags=./tags;~/code

" begin/end line movement
map H ^
map L $

" NERDTree toggle
map <silent> <leader>n :NERDTreeToggle<CR>
map <silent> <leader>N :NERDTreeFocus<CR>
map <silent> <leader>f :NERDTreeFind<CR>

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
" map <F10> :set number!<cr>:set number?<cr>

" CtrlP mappings
let g:ctrlp_working_path_mode='a'
set wildignore+=**/bower_components/*,**/node_modules/*,**/tmp/*,**/assets/images/*,**/assets/fonts/*,**/public/images/*
nnoremap <Leader>t :CtrlPMixed<Enter>
"nnoremap <C-t> :CtrlPMixed<Enter>
nnoremap <C-b> :CtrlPMRUFiles<Enter>
map <Leader>fuf :CtrlPClearCache<Enter>

" multiple cursors

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" close all buffers
" nnoremap <leader>bd :%bd 
" nnoremap <silent> <Leader>b :Bclose<CR>

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
set <F13>=[25~
map <F13> <S-BackSpace>
map! <F13> <S-BackSpace>
map <BackSpace> :bp<Enter>
map <S-BackSpace> :bn<Enter>

" pagedown/pageup
set <F14>=[30~
map <F14> <S-Space>
map! <F14> <S-Space>
map <Space> <S-m><C-d>
map <S-Space> <S-m><C-u>

" these are shortcuts for auto indentation
nmap tt gg=G
vmap tt ngg=Gv

" full screen
map <D-u> :set invfu<CR>

" same indent behaviour in visual mode
vmap > >gv
vmap < <gv
" fast way to switch to normal mode
imap ii <Esc>
" show current file in NERDTree
map <silent> <C-s> :NERDTree<CR><C-w>p:NERDTreeFind<CR>
set laststatus=2

" Fix Background Color Erase in tmux
if &term =~ 'term'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden

" TMUX
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif
