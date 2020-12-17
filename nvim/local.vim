colorscheme gruvbox
  highlight clear SignColumn
  highlight clear LineNr guibg
  highlight LineNr guifg=#292929
" colorscheme molokai
"   highlight clear SignColumn
"   highlight clear LineNr guibg
"   highlight LineNr guifg=#202020
" colorscheme tender
" colorscheme molokayo
" colorscheme zellner
" colorscheme lightning
"   highlight clear SignColumn
"   highlight clear LineNr guibg
"   highlight LineNr guifg=#ffffff
" colorscheme atom
set cursorline
set nowrap
" set nonu
set nu
" set command height
set cmdheight=1

" set path=$PWD/**
set path+=**
set wildignore+=**/node_modules/**
set wildignore+=**/youi/**
set wildignore+=**/build/**

" fast saving
nnoremap <Leader>w :write<CR>

" keep cursor position after leaving insert mode
au InsertLeave * call cursor([getpos('.')[1], getpos('.')[2]+1])

" quicker Command history navigation
nnoremap <Up> :<Up>

" resize focused window
augroup ReduceNoise
    autocmd!
    " Automatically resize active split to 85 width
    autocmd WinEnter * :call ResizeSplits()
augroup END

function! ResizeSplits()
    set winwidth=85
    wincmd =
endfunction

" opaque floating windows
set winblend=0
set pumblend=0

" begin/end line movement
map H ^
map L $

" open newline with space below
nmap 1o o<Esc>O
" open newline with space above and below
nmap 2o 2o<Esc>O
" open new row above while in insert mode
imap <c-o> <Esc>O
" move to end of line when in insert mode
imap <c-l> <Esc>A

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
" nnoremap <c-n> @="m`o\eg``"<cr>
" hello <c-p> @="m`O\eg``"<cr>

" remove colorcolumn
set cc=

" left margin
set nuw=1

" same indent behaviour in visual mode
vmap > >gv
vmap < <gv
" nnoremap > >>
" nnoremap < <<

" Escape
imap jk <ESC>

" remap `*`/`#` to search forwards/backwards (resp.)
" w/o moving cursor
nnoremap <silent> * :execute "normal! *N"<cr>
nnoremap <silent> # :execute "normal! #n"<cr>

" replace all highlighted words
noremap cm :%s///gc<left><left><left>
" replace all selected words
vnoremap cm "hy:%s/<C-r>h//gc<left><left><left>

" map jumplists navigation to BackSpace
" map <BackSpace> <C-o>
" map <S-BackSpace> <C-i>

" this toggles prev buffer
map <BackSpace> :b#<cr>
" ctrl-backspace deletes word in insert mode
set <F14>=[26~
map <F14> <C-BackSpace>
map! <F14> <C-BackSpace>
imap <C-BackSpace> <C-W>

" " Keep search matches in the middle of the window.
" nnoremap n nzzzv
" nnoremap N Nzzzv
" nnoremap * *Nzzzv
"
" " center when return to undo line
" nnoremap u uzzzv
"
" " Same when jumping around
" nnoremap g; g;zz
" nnoremap g, g,zz

" map <Space> <S-m><C-d>
" map <S-Space> <S-m><C-u>
map <Space> <C-d>
map <S-Space> <C-u>

nnoremap <C-n>i <C-i>
" tab navigation
nmap <Tab> :tabnext<CR>
nmap <S-Tab> :tabprev<CR>
" nmap <c-n> gt
" nmap <c-p> gT
" nmap <S-Tab> gT

" " if hidden is not set, TextEdit might fail.
" set hidden
"
" " Some servers have issues with backup files, see #649
" set nobackup
" set nowritebackup
"
" " Better display for messages
" set cmdheight=2
"
" " You will have bad experience for diagnostic messages when it's default 4000.
" set updatetime=300
"
" " don't give |ins-completion-menu| messages.
" set shortmess+=c
"
" " always show signcolumns
" set signcolumn=yes
"
" " always show box caret
set guicursor=
"
"close tag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.tsx"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx,*.erb'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" emmet
let g:user_emmet_leader_key='<C-X>'

" airline
let g:airline#extensions#vista#enabled = 0
let g:airline_theme='dark'
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'short_path'
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline#extensions#tabline#ignore_bufadd_pat = '!|defx|gundo|nerd_tree|startify|tagbar|term://|undotree|vimfiler|denite'
let g:airline_highlighting_cache = 1
let g:airline_filetype_overrides = {
      \ 'defx':  ['defx', '%{b:defx.paths[0]}'],
      \ 'gundo': [ 'Gundo', '' ],
      \ 'help':  [ 'Help', '%f' ],
      \ 'minibufexpl': [ 'MiniBufExplorer', '' ],
      \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
      \ 'startify': [ 'startify', '' ],
      \ 'vim-plug': [ 'Plugins', '' ],
      \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
      \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
      \ }
let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'C',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : 'N',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'V',
      \ 'V'      : 'V',
      \ ''     : 'V',
      \ }

" coc
" imap <C-l> <Plug>(coc-snippets-expand)
let g:coc_snippet_next = '<CR>'
" let g:coc_snippet_next = '<C-j>'
" let g:coc_snippet_prev = '<C-k>'
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-l> to trigger completion.
" inoremap <silent><expr> <c-l> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Remap for rename current word
nmap <leader>r <Plug>(coc-rename)
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" coc terminal
" nmap <leader>t :CocCommand terminal.Toggle<CR>

" prettier
nmap <Leader>f <Plug>(Prettier)
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" plugins settings
" Disable Deoplete auto complete, use coc autocomplete instead
" autocmd FileType * call deoplete#custom#buffer_option('auto_complete', v:false)
nnoremap <silent> - :<C-U>:Defx `expand('%:p:h')` -search=`expand('%:p')` -buffer-name=defx<CR>
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  " nnoremap <silent><buffer><expr> <C-l>
  "\ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
  nnoremap <silent><buffer><expr> st
  \ defx#do_action('multi', [['quit'], ['open', 'tabnew']])
endfunction
