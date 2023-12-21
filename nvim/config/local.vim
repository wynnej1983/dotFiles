colorscheme gruvbox
  highlight clear SignColumn
  highlight clear LineNr guibg
  highlight LineNr guifg=#3e3e3e
  highlight LineNr guifg=#292929
" colorscheme cyberpunk
"   highlight clear SignColumn
"   highlight clear LineNr guibg
"   highlight LineNr guifg=#202020
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
" set cursorline

autocmd BufEnter,BufReadPost,FileReadPost,BufNewFile * call system("tmux set -g set-titles-string " . expand("%"))

" Go to last file(s) if invoked without arguments.
" autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
"    \ call mkdir($HOME . "/.vim") |
"    \ endif |
"    \ execute "mksession! " . $HOME . "/.vim/Session.vim"
" 
" autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
"    \ execute "source " . $HOME . "/.vim/Session.vim"

set nowrap
set equalalways
" set nonu
set nu
set shm=aToOFI
set cmdheight=1
set title

" set timeoutlen=300
" set updatetime=300

set noswapfile

" Show relative line numbers and never let cursor touch top/bottom
set relativenumber scrolloff=5

" set path=$PWD/**
set path+=**
set wildignore+=**/node_modules/**
set wildignore+=**/youi/**
set wildignore+=**/build/**

" fast saving
nnoremap <Leader>w :write<CR>

" keep cursor position after leaving insert mode
" au InsertLeave * call cursor([getpos('.')[1], getpos('.')[2]+1])

" quicker Command history navigation
nnoremap <Up> :<Up>

" resize focused window
augroup ReduceNoise
    autocmd!
    " Automatically resize active split to 85 width
    autocmd WinEnter * :call ResizeSplits()
augroup END

function! ResizeSplits()
    if (@% !~ '^[defx')
      set winwidth=85
      wincmd =
    endif
endfunction

" opaque floating windows
set winblend=0
set pumblend=0

" commentary
" Visual mode
xmap <leader>v <Plug>Commentary
" Normal mode
nmap <leader>v <Plug>CommentaryLine
" Operator pending mode (this lets you do e.g. `dgc` to delete a block of comments)
omap <leader>v <Plug>Commentary

" begin/end line movement
map H ^
map L $

nmap gp o<Esc>p

nmap go o<Esc>O
nmap 1o o<Esc>o
nmap 2o 2o<Esc>O

nmap gO O<Esc>o
nmap 1O O<Esc>O
nmap 2O 2O<Esc>o

imap <c-o> <Esc>O
" move to end of line when in insert mode
imap <c-l> <Esc>A

" delete word insert mode
inoremap <c-bs> <c-w>
inoremap <c-h> <c-w>
" vim.keymap.set("i", "<c-bs>", "<c-w>", { noremap = true })
" vim.keymap.set("i", "<c-h>", "<c-w>", { noremap = true })

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
imap jj <ESC>

" remap `*`/`#` to search forwards/backwards (resp.)
" w/o moving cursor
nnoremap <silent> * :execute "normal! *N"<cr>
nnoremap <silent> # :execute "normal! #n"<cr>

" replace all highlighted words
noremap ch :%s///g<left><left>
vnoremap ch :s///g<left><left>

" replace all words under cursor
noremap cm :execute "normal! *N"<cr>:%s///g<left><left>

" this toggles prev buffer
map <BackSpace> :b#<cr>
" ctrl-backspace deletes word in insert mode
set <F14>=[26~
map <F14> <C-BackSpace>
map! <F14> <C-BackSpace>
imap <C-BackSpace> <C-W>

" " Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

map <Space> <C-d>
map <S-Space> <C-u>

nnoremap <C-n>i <C-i>

" tab navigation
nmap <Tab> :tabnext<CR>
nmap <S-Tab> :tabprev<CR>

" always show box caret
set guicursor=
"
"close tag
" let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.tsx"
" let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx,*.erb'
" let g:closetag_emptyTags_caseSensitive = 1
" let g:closetag_shortcut = '>'
" let g:closetag_close_shortcut = '<leader>>'

" lightline
"{{{lightline.vim
"{{{lightline.vim-usage
" :h 'statusline'
" :h g:lightline.component
"}}}
"{{{functions
function! PomodoroStatus() abort"{{{
  if pomo#remaining_time() ==# '0'
    return "\ue001"
  else
    return "\ue003 ".pomo#remaining_time()
  endif
endfunction"}}}
function! CocCurrentFunction()"{{{
  return get(b:, 'coc_current_function', '')
endfunction"}}}
function! Devicons_Filetype()"{{{
  " return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft') : ''
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction"}}}
function! Devicons_Fileformat()"{{{
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction"}}}
function! Artify_active_tab_num(n) abort"{{{
  return Artify(a:n, 'bold')." \ue0bb"
endfunction"}}}
function! Tab_num(n) abort"{{{
  return a:n." \ue0bb"
endfunction"}}}
function! Gitbranch() abort"{{{
  if gitbranch#name() !=# ''
    return gitbranch#name()." \ue725"
  else
    return "\ue61b"
  endif
endfunction"}}}
function! Artify_inactive_tab_num(n) abort"{{{
  return Artify(a:n, 'double_struck')." \ue0bb"
endfunction"}}}
function! Artify_lightline_tab_filename(s) abort"{{{
  return Artify(lightline#tab#filename(a:s), 'monospace')
endfunction"}}}
function! Artify_lightline_mode() abort"{{{
  return Artify(lightline#mode(), 'monospace')
endfunction"}}}
function! Artify_line_percent() abort"{{{
  return Artify(string((100*line('.'))/line('$')), 'bold')
endfunction"}}}
function! Artify_line_num() abort"{{{
  return Artify(string(line('.')), 'bold')
endfunction"}}}
function! Artify_col_num() abort"{{{
  return Artify(string(getcurpos()[2]), 'bold')
endfunction"}}}
function! Artify_gitbranch() abort"{{{
  if gitbranch#name() !=# ''
    return Artify(gitbranch#name(), 'monospace')." \ue725"
  else
    return "\ue61b"
  endif
endfunction"}}}
"}}}
set laststatus=2  " Basic
set noshowmode  " Disable show mode info
augroup lightlineCustom
  autocmd!
  autocmd BufWritePost * call lightline_gitdiff#query_git() | call lightline#update()
augroup END
let g:lightline = {
     \ 'mode_map': {
       \ 'n' : 'N',
       \ 'i' : 'I',
       \ 'R' : 'R',
       \ 'v' : 'V',
       \ 'V' : 'VL',
       \ "\<C-v>": 'VB',
       \ 'c' : 'C',
       \ 's' : 'S',
       \ 'S' : 'SL',
       \ "\<C-s>": 'SB',
       \ 't': 'T',
       \ },
     \ }
let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf529"
let g:lightline#ale#indicator_errors = "\uf00d"
let g:lightline#ale#indicator_ok = "\uf00c"
let g:lightline_gitdiff#indicator_added = '+'
let g:lightline_gitdiff#indicator_deleted = '-'
let g:lightline_gitdiff#indicator_modified = '*'
let g:lightline_gitdiff#min_winwidth = '70'
let g:lightline#asyncrun#indicator_none = ''
let g:lightline#asyncrun#indicator_run = 'Running...'
" if g:lightlineArtify == 1
"   let g:lightline.active = {
"        \ 'left': [ [ 'artify_mode', 'paste' ],
"        \           [ 'readonly', 'filename', 'modified', 'fileformat', 'devicons_filetype' ] ],
"        \ 'right': [ [ 'artify_lineinfo' ],
"        \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'pomodoro' ],
"        \           [ 'asyncrun_status', 'coc_status' ] ]
"        \ }
"   let g:lightline.inactive = {
"        \ 'left': [ [ 'filename' , 'modified', 'fileformat', 'devicons_filetype' ]],
"        \ 'right': [ [ 'artify_lineinfo' ] ]
"        \ }
"   let g:lightline.tabline = {
"        \ 'left': [ [ 'vim_logo', 'tabs' ] ],
"        \ 'right': [ [ 'artify_gitbranch' ],
"        \ [ 'gitstatus' ] ]
"        \ }
"   let g:lightline.tab = {
"        \ 'active': [ 'artify_activetabnum', 'artify_filename', 'modified' ],
"        \ 'inactive': [ 'artify_inactivetabnum', 'filename', 'modified' ] }
" else
  let g:lightline.active = {
        \ 'left': [ [ 'mode', 'paste' ],
        \           [ 'readonly', 'modified', 'filename' ] ],
        \ 'right': [ [ 'lineinfo' ],
        \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
        \           [ 'asyncrun_status', 'coc_status' ] ]
        \ }
  let g:lightline.inactive = {
        \ 'left': [ [ 'filename' ]],
        \ 'right': [ ]
        \ }
  let g:lightline.tabline = {
        \ 'left': [ [ 'vim_logo', 'tabs' ] ],
        \ 'right': [ [ 'gitbranch' ],
        \ [ 'gitstatus' ] ]
        \ }
  let g:lightline.tab = {
        \ 'active': [ 'tabnum', 'filename', 'modified' ],
        \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }
" endif
let g:lightline.tab_component = {
      \ }
let g:lightline.tab_component_function = {
      \ 'artify_activetabnum': 'Artify_active_tab_num',
      \ 'artify_inactivetabnum': 'Artify_inactive_tab_num',
      \ 'artify_filename': 'Artify_lightline_tab_filename',
      \ 'filename': 'lightline#tab#filename',
      \ 'modified': 'lightline#tab#modified',
      \ 'readonly': 'lightline#tab#readonly',
      \ 'tabnum': 'Tab_num'
      \ }
let g:lightline.component = {
      \ 'artify_gitbranch' : '%{Artify_gitbranch()}',
      \ 'artify_mode': '%{Artify_lightline_mode()}',
      \ 'artify_lineinfo': "%2{Artify_line_percent()}\uf295 %3{Artify_line_num()}:%-2{Artify_col_num()}",
      \ 'gitstatus' : '%{lightline_gitdiff#get_status()}',
      \ 'bufinfo': '%{bufname("%")}:%{bufnr("%")}',
      \ 'vim_logo': "\ue7c5",
      \ 'pomodoro': '%{PomodoroStatus()}',
      \ 'mode': '%{lightline#mode()}',
      \ 'absolutepath': '%F',
      \ 'relativepath': '%f',
      \ 'filename': '%t',
      \ 'filesize': "%{HumanSize(line2byte('$') + len(getline('$')))}",
      \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
      \ 'fileformat': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
      \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
      \ 'modified': '%M',
      \ 'bufnum': '%n',
      \ 'paste': '%{&paste?"PASTE":""}',
      \ 'readonly': '%R',
      \ 'charvalue': '%b',
      \ 'charvaluehex': '%B',
      \ 'percent': '%2p%%',
      \ 'percentwin': '%P',
      \ 'spell': '%{&spell?&spelllang:""}',
      \ 'lineinfo': '%2p%% %3l:%-2v',
      \ 'line': '%l',
      \ 'column': '%c',
      \ 'close': '%999X X ',
      \ 'winnr': '%{winnr()}'
      \ }
let g:lightline.component_function = {
      \ 'gitbranch': 'Gitbranch',
      \ 'devicons_filetype': 'Devicons_Filetype',
      \ 'devicons_fileformat': 'Devicons_Fileformat',
      \ 'coc_status': 'coc#status',
      \ 'coc_currentfunction': 'CocCurrentFunction'
      \ }
let g:lightline.component_expand = {
      \ 'linter_checking': 'lightline#ale#checking',
      \ 'linter_warnings': 'lightline#ale#warnings',
      \ 'linter_errors': 'lightline#ale#errors',
      \ 'linter_ok': 'lightline#ale#ok',
      \ 'asyncrun_status': 'lightline#asyncrun#status'
      \ }
let g:lightline.component_type = {
      \ 'linter_warnings': 'warning',
      \ 'linter_errors': 'error'
      \ }
let g:lightline.component_visible_condition = {
      \ 'gitstatus': 'lightline_gitdiff#get_status() !=# ""'
      \ }
"}}}
function! LightlineMode() abort
    let ftmap = {
                \ 'coc-explorer': 'EXPLORER',
                \ 'fugitive': 'FUGITIVE'
                \ }
    return get(ftmap, &filetype, lightline#mode())
endfunction

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction


" copilot
imap <silent><script><expr> <Right> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" coc
let g:coc_snippet_next = '<CR>'
" let g:coc_snippet_next = '<C-j>'
" let g:coc_snippet_prev = '<C-k>'
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ CheckBackspace() ? "\<TAB>" :
"       \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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

" Remap keys for applying codeAction to the current buffer.
nmap <leader>s <Plug>(coc-codeaction)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-line)
" Apply AutoFix to problem on the current line.
nmap <leader>f <Plug>(coc-fix-current)
" Refactor
nmap <silent> <leader>r <Plug>(coc-codeaction-refactor)
" nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
" xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
" nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" prettier
" nmap <Leader>f <Plug>(Prettier)

" lazygit
nnoremap <silent> <Leader>g :LazyGit<CR>
tunmap jj

" Find files using Telescope command-line sugar.
" nnoremap <LocalLeader>f <cmd>Telescope find_files theme=get_ivy<cr>
nnoremap <LocalLeader>f <cmd>Telescope git_files theme=get_ivy<cr>
nnoremap <LocalLeader>g <cmd>Telescope live_grep theme=get_ivy<cr>
nnoremap <leader>gg <cmd>Telescope grep_string theme=get_ivy<cr>
vnoremap <leader>gg <cmd>Telescope grep_string theme=get_ivy<cr>
nnoremap <LocalLeader>r <cmd>Telescope resume theme=get_ivy<cr>
nnoremap <LocalLeader>i <cmd>Telescope oldfiles theme=get_ivy<cr>

" coc-explorer
" nnoremap <silent><LocalLeader>e :CocCommand explorer<CR>
" nnoremap <silent><LocalLeader>a :CocCommand explorer --no-toggle<CR>
" autocmd User CocExplorerOpenPost set cursorline

nnoremap <silent><LocalLeader>a :Defx -split=vertical -winwidth=50 -direction=topleft `escape(expand('%:p:h'), ' :')` -search=`expand('%:p')`<CR>
nnoremap <silent><LocalLeader>e :Defx -split=vertical -winwidth=50 -direction=topleft -toggle -resume<CR>
nnoremap <silent><buffer> gr :<C-u>call denite#start(
	\ [{'name': 'grep', 'args':
	\  [map(defx#get_selected_candidates(),
	\       { _, val -> val['action__path'] })]
	\ }])<CR>
autocmd FileType defx call s:defx_my_settings()
autocmd BufWritePost * call defx#redraw()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_directory') :
  \ defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#is_directory() ?
  \ defx#do_action('open_directory') :
  \ defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><buffer><expr> sg
  \ defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
  nnoremap <silent><buffer><expr> sv
  \ defx#do_action('multi', [['drop', 'split'], 'quit'])
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('preview')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_tree', 'toggle')
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
  nnoremap <silent><buffer><expr> <ESC>
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
endfunction

let g:svelte_preprocessors = ['typescript']

lua << EOF
  local actions = require('telescope.actions')
  local previewers = require("telescope.previewers")
  local Job = require("plenary.job")
  local new_maker = function(filepath, bufnr, opts)
    filepath = vim.fn.expand(filepath)
    Job:new({
      command = "file",
      args = { "--mime-type", "-b", filepath },
      on_exit = function(j)
        local mime_type = vim.split(j:result()[1], "/")[1]
        if mime_type == "text" then
          previewers.buffer_previewer_maker(filepath, bufnr, opts)
        else
          -- maybe we want to write something to the buffer here
          vim.schedule(function()
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
          end)
        end
      end
    }):sync()
  end

  require('telescope').setup{
    defaults = {
      buffer_previewer_maker = new_maker,
      mappings = {
	i = {
	},
	n = {
	  ["sv"] = actions.file_split,
	  ["sg"] = actions.file_vsplit,
	  ["st"] = actions.file_tab,
	},
      },
    }
  }

  local nvim_lsp = require("lspconfig")

  local on_attach = function(client, bufnr)
    local buf_map = vim.api.nvim_buf_set_keymap
    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspOrganize lua lsp_organize_imports()")
    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.lsp.diagnostic.goto_next()")
    vim.cmd("command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
    buf_map(bufnr, "n", "gd", ":LspDef<CR>", {silent = true})
    buf_map(bufnr, "n", "gr", ":LspRename<CR>", {silent = true})
    buf_map(bufnr, "n", "gR", ":LspRefs<CR>", {silent = true})
    buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>", {silent = true})
    buf_map(bufnr, "n", "K", ":LspHover<CR>", {silent = true})
    buf_map(bufnr, "n", "gs", ":LspOrganize<CR>", {silent = true})
    buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>", {silent = true})
    buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>", {silent = true})
    buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>", {silent = true})
    buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>", {silent = true})
    buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>", {silent = true})
    if client.resolved_capabilities.document_formatting then
	  vim.api.nvim_exec([[
	  augroup LspAutocommands
	      autocmd! * <buffer>
	      autocmd BufWritePost <buffer> LspFormatting
	  augroup END
	  ]], true)
    end
  end

  nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }

  vim.g.rooter_patterns = {
    ".git",
    "build/sh",
    "index.md",
    ".proj",
    ".root",
    ".nrepl-port",
    ".exercism" ,
  }
  vim.g.rooter_change_directory_for_non_project_files = "current" -- when non of the above patterns is found
  vim.g.rooter_cd_cmd =  "lcd"
  vim.g.rooter_silent_chdir = true
EOF
