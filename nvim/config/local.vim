colorscheme gruvbox
  highlight clear SignColumn
  highlight clear LineNr guibg
  highlight LineNr guifg=#3e3e3e
  highlight LineNr guifg=#292929
  " autocmd BufEnter * set nocursorline
  " autocmd BufLeave * set nocursorline
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

" fix paste clears clipboard issue
xnoremap p pgvy

" select all
nnoremap <D-a> ggVG

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
" set title

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
    " Automatically resize active split to 75 width
    autocmd WinEnter * :call ResizeSplits()
augroup END

function! ResizeSplits()
    if (@% !~ '^[defx' && @% !~ 'DiffviewFilePanel')
      set winwidth=75
      wincmd =
    endif
endfunction
" let g:golden_ratio_exclude_nonmodifiable = 1
" let g:goldenview__enable_default_mapping = 0

" chatGPT
let g:chat_gpt_max_tokens=2000
" let g:chat_gpt_model='gpt-3.5-turbo'
let g:chat_gpt_session_mode=0
let g:chat_gpt_temperature = 0.7
let g:chat_gpt_lang = 'English'
let g:chat_gpt_split_direction = 'vertical'
let g:split_ratio=4

" vim-ai
" :AI
" - engine: complete | chat - see how to configure chat engine in the section below
" - options: openai config (see https://platform.openai.com/docs/api-reference/completions)
" - options.request_timeout: request timeout in seconds
" - options.enable_auth: enable authorization using openai key
" - options.selection_boundary: seleciton prompt wrapper (eliminates empty responses, see #20)
" - ui.paste_mode: use paste mode (see more info in the Notes below)
let g:vim_ai_complete = {
\  "engine": "complete",
\  "options": {
\    "model": "gpt-3.5-turbo-instruct",
\    "endpoint_url": "https://api.openai.com/v1/completions",
\    "max_tokens": 1000,
\    "temperature": 0.1,
\    "request_timeout": 20,
\    "enable_auth": 1,
\    "selection_boundary": "#####",
\  },
\  "ui": {
\    "paste_mode": 1,
\  },
\}

" :AIEdit
" - engine: complete | chat - see how to configure chat engine in the section below
" - options: openai config (see https://platform.openai.com/docs/api-reference/completions)
" - options.request_timeout: request timeout in seconds
" - options.enable_auth: enable authorization using openai key
" - options.selection_boundary: seleciton prompt wrapper (eliminates empty responses, see #20)
" - ui.paste_mode: use paste mode (see more info in the Notes below)
let g:vim_ai_edit = {
\  "engine": "complete",
\  "options": {
\    "model": "gpt-3.5-turbo-instruct",
\    "endpoint_url": "https://api.openai.com/v1/completions",
\    "max_tokens": 1000,
\    "temperature": 0.1,
\    "request_timeout": 20,
\    "enable_auth": 1,
\    "selection_boundary": "#####",
\  },
\  "ui": {
\    "paste_mode": 1,
\  },
\}

" This prompt instructs model to work with syntax highlighting
let s:initial_chat_prompt =<< trim END
>>> system

You are a general assistant.
If you attach a code block add syntax type after ``` to enable syntax highlighting.
END

" :AIChat
" - options: openai config (see https://platform.openai.com/docs/api-reference/chat)
" - options.initial_prompt: prompt prepended to every chat request (list of lines or string)
" - options.request_timeout: request timeout in seconds
" - options.enable_auth: enable authorization using openai key
" - options.selection_boundary: seleciton prompt wrapper (eliminates empty responses, see #20)
" - ui.populate_options: put [chat-options] to the chat header
" - ui.open_chat_command: preset (preset_below, preset_tab, preset_right) or a custom command
" - ui.scratch_buffer_keep_open: re-use scratch buffer within the vim session
" - ui.paste_mode: use paste mode (see more info in the Notes below)
let g:vim_ai_chat = {
\  "options": {
\    "model": "gpt-4o",
\    "endpoint_url": "https://api.openai.com/v1/chat/completions",
\    "max_tokens": 0,
\    "temperature": 1,
\    "request_timeout": 20,
\    "enable_auth": 1,
\    "selection_boundary": "",
\    "initial_prompt": s:initial_chat_prompt,
\  },
\  "ui": {
\    "code_syntax_enabled": 1,
\    "populate_options": 0,
\    "open_chat_command": "preset_right",
\    "scratch_buffer_keep_open": 0,
\    "paste_mode": 1,
\  },
\}

" Notes:
" ui.paste_mode
" - if disabled code indentation will work but AI doesn't always respond with a code block
"   therefore it could be messed up
" - find out more in vim's help `:help paste`
" options.max_tokens
" - note that prompt + max_tokens must be less than model's token limit, see #42, #46
" - setting max tokens to 0 will exclude it from the OpenAI API request parameters, it is
"   unclear/undocumented what it exactly does, but it seems to resolve issues when the model
"   hits token limit, which respond with `OpenAI: HTTPError 400`

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

map <C-d> <C-d>zz
map <Space> <C-d>
map <C-u> <C-u>zz
map <S-Space> <C-u>zz

nnoremap <C-n>i <C-i>

" tab navigation
nmap <Tab> :tabnext<CR>
nmap <S-Tab> :tabprev<CR>

" always show box caret
set guicursor=
" Lightline
function! PomodoroStatus() abort"{{{
  if pomo#remaining_time() ==# '0'
    return "\ue001"
  else
    return "\ue003 ".pomo#remaining_time()
  endif
endfunction"}}}
function! CocStatus()"{{{
  if &filetype == 'defx'
    return ""
  else
    return get(g:, 'coc_status', '')
  endif
endfunction"}}}
function! CocCurrentFunction()"{{{
  if &filetype == 'defx'
    return ""
  else
    return get(b:, 'coc_current_function', '')
  endif
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
" augroup lightlineCustom
"   autocmd!
"   autocmd BufWritePost * call lightline_gitdiff#query_git() | call lightline#update()
" augroup END
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
let g:lightline.colorscheme = 'cyberpunk'
let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
let g:lightline#coc#indicator_checking = "\uf110"
let g:lightline#coc#indicator_warnings = "\uf529"
let g:lightline#coc#indicator_errors = "✗"
let g:lightline#coc#indicator_ok = "\uf00c"
let g:lightline_gitdiff#indicator_added = '+'
let g:lightline_gitdiff#indicator_deleted = '-'
let g:lightline_gitdiff#indicator_modified = '*'
let g:lightline_gitdiff#min_winwidth = '70'
let g:lightline#asyncrun#indicator_none = ''
let g:lightline#asyncrun#indicator_run = 'Running...'
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
      \ 'left': [ [ 'pomodoro', 'tabs' ] ],
      \ 'right': [ [ 'gitbranch' ],
      \ [ 'gitstatus' ] ]
      \ }
let g:lightline.tab = {
      \ 'active': [ 'tabnum', 'filename', 'modified' ],
      \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }
let g:lightline.tab_component = {
      \ }
let g:lightline.tab_component_function = {
      \ 'artify_activetabnum': 'Artify_active_tab_num',
      \ 'artify_inactivetabnum': 'Artify_inactive_tab_num',
      \ 'artify_filename': 'Artify_lightline_tab_filename',
      \ 'filename': 'LightlineTablineGitRelativePath',
      \ 'modified': 'lightline#tab#modified',
      \ 'readonly': 'lightline#tab#readonly',
      \ 'tabnum': 'Tab_num'
      \ }
let g:lightline.component = {
      \ 'artify_gitbranch' : '%{Artify_gitbranch()}',
      \ 'artify_mode': '%{Artify_lightline_mode()}',
      \ 'artify_lineinfo': "%2{Artify_line_percent()}\uf295 %3{Artify_line_num()}:%-2{Artify_col_num()}",
      \ 'bufinfo': '%{bufname("%")}:%{bufnr("%")}',
      \ 'vim_logo': "\ue7c5",
      \ 'pomodoro': '%{PomodoroStatus()}',
      \ 'mode': '%{LightlineMode()}',
      \ 'absolutepath': '%F',
      \ 'relativepath': '%f',
      \ 'filename': '%{LightlineFilename()}',
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
      \ 'coc_currentfunction': 'CocCurrentFunction'
      \ }
let g:lightline.component_expand = {
      \ 'linter_checking': 'lightline#coc#checking',
      \ 'linter_warnings': 'lightline#coc#warnings',
      \ 'linter_errors': 'lightline#coc#errors',
      \ 'linter_ok': 'lightline#coc#ok',
      \ 'asyncrun_status': 'lightline#asyncrun#status'
      \ }
let g:lightline.component_type = {
      \ 'coc_error': 'error',
      \ 'coc_warning': 'warning',
      \ 'coc_info': 'info',
      \ 'coc_hint': 'hint',
      \ 'coc_fix': 'fix'
      \ }
" let g:lightline.component_visible_condition = {
"       \ 'gitstatus': 'lightline_gitdiff#get_status() !=# ""'
"       \ }
"}}}
function! LightlineMode() abort
  if &filetype == 'defx'
    return ""
  else
    return lightline#mode()
  endif
endfunction

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

function! LightlineTablineGitRelativePath(n)
      let buflist = tabpagebuflist(a:n)
      let winnr = tabpagewinnr(a:n)
      let bufnum = buflist[winnr - 1]
      let bufname = expand('#'.bufnum.':t')
      let buffullname = expand('#'.bufnum.':p')
      let gitroot = fnamemodify(FugitiveGitDir(bufnum), ':h')
      if strlen(gitroot)
        if buffullname[:len(gitroot)-1] ==# gitroot
          return buffullname[len(gitroot)+1:]
        endif
      endif
      return bufname
    endfunction

" copilot
let g:copilot_enabled = 0
" imap <silent><script><expr> <D-CR> copilot#Accept("\<CR>")
" imap <silent><script><expr> <RIGHT> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
" codium
" let g:codeium_disable_bindings = 1
let g:codeium_no_map_tab = 1
imap <script><silent><nowait><expr> <RIGHT> codeium#Accept()
imap <M-RIGHT>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <M-LEFT>   <Cmd>call codeium#CycleCompletions(-1)<CR>
" chatGPT
" trigger chat
xnoremap <leader>c :AIChat<CR>
nnoremap <leader>c :AIChat<CR>

" coc
call coc#config('suggest', {
\   'completionItemKindLabels': {
\   "keyword": "\uf1de",
\   "variable": "",
\   "value": "\uf89f",
\   "operator": "+",
\   "function": "",
\   "reference": "\ufa46",
\   "constant": "",
\   "method": "ƒ",
\   "struct": "",
\   "class": "𝓒",
\   "interface": " ",
\   "text": "",
\   "enum": "ℰ",
\   "enumMember": "",
\   "module": "",
\   "color": "\ue22b",
\   "property": "",
\   "field": "",
\   "unit": "",
\   "event": "",
\   "file": "\uf723",
\   "folder": "",
\   "snippet": "",
\   "typeParameter": "𝙏",
\   "default": "\uf29c"
\   }
\ })

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

" Use `[[` and `]]` to navigate diagnostics
nmap <silent> [[ <Plug>(coc-diagnostic-prev)
nmap <silent> ]] <Plug>(coc-diagnostic-next)
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
nmap <silent><leader>s <Plug>(coc-codeaction)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <silent><leader>a <Plug>(coc-codeaction-selected)
nmap <silent><leader>a <Plug>(coc-codeaction-line)
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
set statusline+=%{get(b:,'gitsigns_status','')}
"coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" prettier
" nmap <Leader>f <Plug>(Prettier)

" lazygit
" nnoremap <silent> <Leader>g :LazyGit<CR>
" tunmap jj
" Neogit
nnoremap <silent> <Leader>g :Neogit<CR>

" open nvim config
nmap <silent>vim :e ~/.config/nvim/config/local.vim<CR>

" Find files using Telescope command-line sugar.
" nnoremap <LocalLeader>f <cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files theme=get_ivy<cr>
nnoremap <LocalLeader>f <cmd>Telescope git_files theme=get_ivy<cr>
nnoremap <LocalLeader>g <cmd>Telescope live_grep theme=get_ivy<cr>
nnoremap <leader>gg <cmd>Telescope grep_string initial_mode=normal theme=get_ivy<cr>
vnoremap <leader>gg <cmd>Telescope grep_string initial_mode=normal theme=get_ivy<cr>
nnoremap <LocalLeader>r <cmd>Telescope resume initial_mode=normal theme=get_ivy<cr>
nnoremap <LocalLeader>i <cmd>Telescope oldfiles initial_mode=normal theme=get_ivy<cr>
nnoremap <LocalLeader>s <cmd>Spectre<cr>
" nnoremap gl <cmd>Telescope git_commits theme=get_ivy<cr>
nnoremap gl <cmd>DiffviewFileHistory<cr>
nnoremap gb <cmd>DiffviewFileHistory %<cr>
nnoremap gp <cmd>DiffviewOpen origin/HEAD...HEAD --imply-local<cr>
nnoremap gB <cmd>Telescope git_branches initial_mode=normal theme=get_ivy<cr>
" nnoremap gD <cmd>Telescope git_bcommits theme=get_ivy<cr>
nnoremap gs <cmd>Telescope git_status initial_mode=normal theme=get_ivy<cr>
nnoremap gS <cmd>Telescope git_stash theme=get_ivy<cr>
nnoremap gh <cmd>Telescope gh pull_request initial_mode=normal theme=get_ivy<cr>
nnoremap gha <cmd>Telescope gh pull_request initial_mode=normal state=all theme=get_ivy<cr>
nnoremap ghm <cmd>Telescope gh pull_request initial_mode=normal state=all author='@me' theme=get_ivy<cr>

nnoremap <silent><LocalLeader>a :Defx -split=vertical -winwidth=35 -direction=topleft `escape(expand('%:p:h'), ' :')` -search=`expand('%:p')`<CR>
nnoremap <silent><LocalLeader>e :Defx -split=vertical -winwidth=35 -direction=topleft -toggle -resume<CR>
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
  require'nvim-web-devicons'.setup {
    -- your personnal icons can go here (to override)
    -- you can specify color or cterm_color instead of specifying both of them
    -- DevIcon will be appended to `name`
    override = {
      zsh = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Zsh"
      }
    };
    -- globally enable different highlight colors per icon (default to true)
    -- if set to false all icons will have the default icon's color
    color_icons = true;
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true;
    -- globally enable "strict" selection of icons - icon will be looked up in
    -- different tables, first by filename, and if not found by extension; this
    -- prevents cases when file doesn't have any extension but still gets some icon
    -- because its name happened to match some extension (default to false)
    strict = true;
    -- same as `override` but specifically for overrides by filename
    -- takes effect when `strict` is true
    override_by_filename = {
      [".gitignore"] = {
        icon = "",
        color = "#f1502f",
        name = "Gitignore"
      }
    };
    -- same as `override` but specifically for overrides by extension
    -- takes effect when `strict` is true
    override_by_extension = {
      ["log"] = {
        icon = "",
        color = "#81e043",
        name = "Log"
      }
    };
  }

  require("spectre").setup({
    replace_engine = {
      ["sed"] = {
	cmd = "sed",
	args = {
	  "-i",
	  "",
	  "-E",
	},
      },
    },
  })

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

  local telescope = require('telescope')
  local gh_a = require "telescope._extensions.gh_actions"
  telescope.setup{
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
      file_ignore_patterns = {
        "node_modules",
        ".work/.*",
        ".cache/.*",
        ".idea/.*",
        ".DS_Store",
        "dist/.*",
        ".git/.*",
        "build/.*",
        "dist",
        "yarn.lock",
        "package-json.lock",
        "bun.lockb",
        "ios/Pods/*",
        "vendor/*"
      },
    },
  }
  telescope.load_extension('gh')
  -- telescope.load_extension('repo')
  local diffview = require("diffview")
  diffview.setup({
    enhanced_diff_hl = true,
    show_help_hints = false,
    key_bindings = {
      file_history_panel = { q = '<Cmd>DiffviewClose<CR>' },
      file_panel = { q = '<Cmd>DiffviewClose<CR>' },
      view = { q = '<Cmd>DiffviewClose<CR>' },
    },
    file_panel = {
      listing_style = "tree",             -- One of 'list' or 'tree'
      tree_options = {                    -- Only applies when listing_style is 'tree'
        flatten_dirs = true,              -- Flatten dirs that only contain one single dir
        folder_statuses = "only_folded",  -- One of 'never', 'only_folded' or 'always'.
      },
      win_config = {                      -- See ':h diffview-config-win_config'
        position = "left",
        width = 35,
        win_opts = {}
      },
    },
    file_history_panel = {
      log_options = {   -- See ':h diffview-config-log_options'
        git = {
          single_file = {
            diff_merges = "combined",
          },
          multi_file = {
            diff_merges = "first-parent",
          },
        },
        hg = {
          single_file = {},
          multi_file = {},
        },
      },
      win_config = {    -- See ':h diffview-config-win_config'
        position = "bottom",
        height = 10,
        win_opts = {}
      },
    },
  })
  local neogit = require('neogit')
  neogit.setup {}
  require('gitsigns').setup({
    current_line_blame = true
  })

  vim.api.nvim_set_keymap('n', 'ai', ':AIChat<CR>', { noremap = true, silent = true })
  --vim.api.nvim_set_keymap('n', '<leader>cf', ':CopilotChatFixDiagnostic<CR>', { noremap = true, silent = true })
  --vim.api.nvim_set_keymap('n', '<leader>ct', ':CopilotChatTests<CR>', { noremap = true, silent = true })

  --require("mason").setup({
  --    ui = {
  --        icons = {
  --            package_installed = "✓",
  --            package_pending = "➜",
  --            package_uninstalled = "✗"
  --        }
  --    }
  --})
  --require("typescript-tools").setup {}
  --local lspconfig = require("lspconfig")
  --require('lspsaga').setup({})

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
