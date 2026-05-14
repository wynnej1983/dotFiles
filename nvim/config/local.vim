colorscheme gruvbox
highlight clear SignColumn
highlight clear LineNr guibg
highlight LineNr guifg=#3e3e3e
highlight LineNr guifg=#292929
" colorscheme cyberpunk
" highlight clear SignColumn
" highlight clear LineNr guibg
" highlight LineNr guifg=#202020
" colorscheme molokai
" highlight clear SignColumn
" highlight clear LineNr guibg
"  highlight LineNr guifg=#202020
" colorscheme tender
" colorscheme molokayo
" colorscheme zellner
" colorscheme lightning
" highlight clear SignColumn
" highlight clear LineNr guibg
" highlight LineNr guifg=#ffffff

" python3 host
let g:python3_host_prog = '/opt/homebrew/bin/python3'

" disable unused providers
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0

" node provider
let g:loaded_node_provider = 1

" fix paste clears clipboard issue
xnoremap p pgvy

" toggle word wrap
noremap sw :set wrap!<CR>

" select all
nnoremap <D-a> ggVG

autocmd FileType DiffviewFiles,DiffviewFilePanel,Diffview,DiffviewOpen setlocal omnifunc=

set nowrap
set equalalways
set nu
set shm=aToOFI
set cmdheight=1
set noswapfile
set directory^=$HOME/.vim/swap//
set relativenumber scrolloff=5
set path+=**
set wildignore+=**/node_modules/**
set wildignore+=**/youi/**
set wildignore+=**/build/**

" fast saving
nnoremap <Leader>w :write<CR>

" quicker command history navigation
nnoremap <Up> :<Up>

" resize focused window
augroup ReduceNoise
    autocmd!
    autocmd WinEnter * :call ResizeSplits()
augroup END

function! ResizeSplits()
    if (@% !~ '^[defx' && @% !~ 'DiffviewFilePanel')
      set winwidth=75
      wincmd =
    endif
endfunction

" opaque floating windows
set winblend=0
set pumblend=0

" commentary
xmap <leader>v <Plug>Commentary
nmap <leader>v <Plug>CommentaryLine
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
imap <c-l> <Esc>A

" delete word in insert mode
inoremap <c-bs> <c-w>
inoremap <c-h> <c-w>

" quickly insert empty line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" remove colorcolumn
set cc=

" left margin
set nuw=1

" same indent behaviour in visual mode
vmap > >gv
vmap < <gv

" escape
imap jj <ESC>

" search forwards/backwards without moving cursor
nnoremap <silent> * :execute "normal! *N"<cr>
nnoremap <silent> # :execute "normal! #n"<cr>

" replace all highlighted words
noremap ch :%s///g<left><left>
vnoremap ch :s///g<left><left>

" replace all words under cursor
noremap cm :execute "normal! *N"<cr>:%s///g<left><left>

" toggle prev buffer
map <BackSpace> :b#<cr>
set <F14>=[26~
map <F14> <C-BackSpace>
map! <F14> <C-BackSpace>
imap <C-BackSpace> <C-W>

" keep search matches in middle of window
nnoremap n nzzzv
nnoremap N Nzzzv

" same when jumping around
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

" ==========================================
" Lightline
" ==========================================
function! PomodoroStatus() abort
  if pomo#remaining_time() ==# '0'
    return "\ue001"
  else
    return "\ue003 ".pomo#remaining_time()
  endif
endfunction

function! CocStatus()
  if &filetype == 'defx'
    return ""
  else
    return get(g:, 'coc_status', '')
  endif
endfunction

function! CocCurrentFunction()
  if &filetype == 'defx'
    return ""
  else
    return get(b:, 'coc_current_function', '')
  endif
endfunction

function! Devicons_Filetype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! Devicons_Fileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! Artify_active_tab_num(n) abort
  return Artify(a:n, 'bold')." \ue0bb"
endfunction

function! Tab_num(n) abort
  return a:n." \ue0bb"
endfunction

function! Gitbranch() abort
  if gitbranch#name() !=# ''
    return gitbranch#name()." \ue725"
  else
    return "\ue61b"
  endif
endfunction

function! Artify_inactive_tab_num(n) abort
  return Artify(a:n, 'double_struck')." \ue0bb"
endfunction

function! Artify_lightline_tab_filename(s) abort
  return Artify(lightline#tab#filename(a:s), 'monospace')
endfunction

function! Artify_lightline_mode() abort
  return Artify(lightline#mode(), 'monospace')
endfunction

function! Artify_line_percent() abort
  return Artify(string((100*line('.'))/line('$')), 'bold')
endfunction

function! Artify_line_num() abort
  return Artify(string(line('.')), 'bold')
endfunction

function! Artify_col_num() abort
  return Artify(string(getcurpos()[2]), 'bold')
endfunction

function! Artify_gitbranch() abort
  if gitbranch#name() !=# ''
    return Artify(gitbranch#name(), 'monospace')." \ue725"
  else
    return "\ue61b"
  endif
endfunction

set laststatus=2
set noshowmode

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
let g:lightline.tab_component = {}
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
      \ 'artify_lineinfo': "%2{Artify_line_percent()}\uf295 %3{Artify_line_num()}:%-2{Artify_col_num()}",
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
      \ 'lineinfo': '%2p%% %3l:%-2v',
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

function! LightlineMode() abort
  if &filetype == 'defx'
    return ""
  else
    return lightline#mode()
  endif
endfunction

function! LightlineFilename()
  let path = expand('%:p')
  let root = fnamemodify(FugitiveGitDir(), ':h')
  if strlen(root) && path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  let home = expand('~')
  for dir in ['dev', 'code']
    let base = home . '/' . dir . '/'
    if path[:len(base)-1] ==# base
      return path[len(base):]
    endif
  endfor
  return expand('%:p')
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

" ==========================================
" coc
" ==========================================
call coc#config('suggest', {
\   'completionItemKindLabels': {
\   "keyword": "\uf1de",
\   "variable": "",
\   "value": "\uf89f",
\   "operator": "+",
\   "function": "",
\   "reference": "\ufa46",
\   "constant": "",
\   "method": "ƒ",
\   "struct": "",
\   "class": "𝓒",
\   "interface": " ",
\   "text": "",
\   "enum": "ℰ",
\   "enumMember": "",
\   "module": "",
\   "color": "\ue22b",
\   "property": "",
\   "field": "",
\   "unit": "",
\   "event": "",
\   "file": "\uf723",
\   "folder": "",
\   "snippet": "",
\   "typeParameter": "𝙏",
\   "default": "\uf29c"
\   }
\ })

let g:UltiSnipsSnippetDirectories = ['UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'

let g:coc_snippet_next = '<CR>'
let g:coc_node_path = '/Users/jonathanwynne/.nvm/versions/node/v22.22.2/bin/node'

let g:UltiSnipsExpandTrigger = "<nop>"
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ UltiSnips#CanExpandSnippet() ? "\<C-r>=UltiSnips#ExpandSnippet()\<CR>" :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> [[ <Plug>(coc-diagnostic-prev)
nmap <silent> ]] <Plug>(coc-diagnostic-next)

function! GotoDefinitionOrDiffview()
  let result = CocAction('jumpDefinition')
endfunction

nmap <silent> gd :call GotoDefinitionOrDiffview()<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <silent><leader>s <Plug>(coc-codeaction)
xmap <silent><leader>a <Plug>(coc-codeaction-selected)
nmap <silent><leader>a <Plug>(coc-codeaction-line)
nmap <leader>f <Plug>(coc-fix-current)
nmap <silent> <leader>r <Plug>(coc-codeaction-refactor)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

set statusline+=%{get(b:,'gitsigns_status','')}

command! -nargs=0 Prettier :CocCommand prettier.formatFile
function! s:FormatAndOrganize()
  if index(['typescript', 'typescriptreact', 'javascript', 'javascriptreact'], &filetype) >= 0
    silent call CocAction('runCommand', 'editor.action.organizeImport')
    silent call CocAction('format')
  endif
endfunction

autocmd BufWritePre *.ts,*.tsx,*.js,*.jsx call s:FormatAndOrganize()

" ==========================================
" Neogit
" ==========================================
nnoremap <silent> <Leader>g :Neogit<CR>

" open nvim config
nmap <silent>vim :e ~/.config/nvim/config/local.vim<CR>

" ==========================================
" Defx
" ==========================================
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
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_directory') :
  \ defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><buffer><expr> c  defx#do_action('copy')
  nnoremap <silent><buffer><expr> m  defx#do_action('move')
  nnoremap <silent><buffer><expr> p  defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#is_directory() ?
  \ defx#do_action('open_directory') :
  \ defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><buffer><expr> sg defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
  nnoremap <silent><buffer><expr> sv defx#do_action('multi', [['drop', 'split'], 'quit'])
  nnoremap <silent><buffer><expr> P  defx#do_action('preview')
  nnoremap <silent><buffer><expr> o  defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> K  defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N  defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M  defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S  defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d  defx#do_action('remove')
  nnoremap <silent><buffer><expr> r  defx#do_action('rename')
  nnoremap <silent><buffer><expr> !  defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x  defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .  defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;  defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h  defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~  defx#do_action('cd')
  nnoremap <silent><buffer><expr> q  defx#do_action('quit')
  nnoremap <silent><buffer><expr> <ESC> defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *  defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
endfunction

let g:svelte_preprocessors = ['typescript']

" Ensure shada saves oldfiles
set shada='100,<50,s10,h

" ==========================================
" Lua config
" ==========================================
lua << EOF
  require("copilot").setup({
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<RIGHT>",
        next = "<M-RIGHT>",
        prev = "<M-LEFT>",
        dismiss = "<C-e>",
      },
    },
    panel = { enabled = false },
  })

  require'nvim-web-devicons'.setup {
    override = {
      zsh = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Zsh"
      }
    },
    color_icons = true,
    default = true,
    strict = true,
    override_by_filename = {
      [".gitignore"] = {
        icon = "",
        color = "#f1502f",
        name = "Gitignore"
      }
    },
    override_by_extension = {
      ["log"] = {
        icon = "",
        color = "#81e043",
        name = "Log"
      }
    },
  }

  require("spectre").setup({
    replace_engine = {
      ["sed"] = {
        cmd = "sed",
        args = { "-i", "", "-E" },
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
          vim.schedule(function()
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
          end)
        end
      end
    }):sync()
  end

  local function attach_custom_mappings(prompt_bufnr, map, picker_name)
    local is_git_picker = picker_name:match("git_") ~= nil
    local is_git_status = picker_name == "git_status"

    map("n", "d", function()
      local selection = require("telescope.actions.state").get_selected_entry()
      if not selection then return end
      local filepath = selection.value or selection[1]
      if not filepath then return end

      local confirm = vim.fn.input("Delete " .. filepath .. "? (y/N): ")
      if confirm:lower() ~= "y" then return end

      local result
      if is_git_picker then
        result = vim.system({ "git", "rm", "-f", filepath }, { text = true }):wait()
        if result.code ~= 0 then
          result = vim.system({ "rm", filepath }):wait()
        end
      else
        result = vim.system({ "rm", filepath }):wait()
      end

      if result.code == 0 then
        actions.close(prompt_bufnr)
        vim.schedule(function()
          require("telescope.builtin")[picker_name]()
        end)
      else
        print("Error deleting " .. filepath .. ": " .. (result.stderr or "Unknown error"))
      end
    end)

    if is_git_picker then
      map("n", "c", function()
        local selection = require("telescope.actions.state").get_selected_entry()
        if not selection then return end
        local filepath = selection.value or selection[1]
        if not filepath then return end

        local confirm = vim.fn.input("Reset " .. filepath .. "? (y/N): ")
        if confirm:lower() ~= "y" then return end

        local result = vim.system({ "git", "checkout", "HEAD", "--", filepath }):wait()
        if result.code == 0 then
          print("Reset: " .. filepath)
        else
          print("Error resetting: " .. (result.stderr or "Unknown error"))
        end

        actions.close(prompt_bufnr)
        vim.schedule(function() require("telescope.builtin")[picker_name]() end)
      end)

      map("n", "r", function()
        local confirm = vim.fn.input("Reset entire repo? (y/N): ")
        if confirm:lower() ~= "y" then return end

        local result = vim.system({ "git", "reset", "--hard" }):wait()
        if result.code == 0 then
          print("Repository reset to HEAD")
        else
          print("Error resetting repo: " .. (result.stderr or "Unknown error"))
        end

        actions.close(prompt_bufnr)
        vim.schedule(function() require("telescope.builtin")[picker_name]() end)
      end)

      map("n", "g", function()
        local message = vim.fn.input("Commit message: ")
        if message == "" then return end

        local result = vim.system({ "git", "commit", "-m", message }, { text = true }):wait()
        if result.code == 0 then
          print("Committed: " .. message)
        else
          print("Error committing: " .. (result.stderr or "Unknown error"))
          return
        end

        actions.close(prompt_bufnr)
        vim.schedule(function() require("telescope.builtin")[picker_name]() end)
      end)
    end

    if is_git_status then
      map("n", "a", function()
        local status = vim.system({ "git", "status", "--porcelain" }, { text = true }):wait()
        if status.code ~= 0 then return end

        local output = status.stdout
        local has_unstaged = output:match("^.[^ ]")
        local has_staged = output:match("^[^ ].")

        local result
        if has_unstaged then
          result = vim.system({ "git", "add", "." }):wait()
          if result.code == 0 then print("Staged all changes") end
        elseif has_staged then
          result = vim.system({ "git", "reset" }):wait()
          if result.code == 0 then print("Unstaged all changes") end
        else
          print("No changes to stage or unstage")
          return
        end

        actions.close(prompt_bufnr)
        vim.schedule(function() require("telescope.builtin").git_status() end)
      end)
    end

    return true
  end

  local picker_initial_modes = {
    git_status   = "normal",
    git_files    = "insert",
    git_commits  = "normal",
    git_branches = "normal",
    git_stash    = "normal",
    find_files   = "insert",
    oldfiles     = "normal",
    live_grep    = "insert",
    grep_string  = "normal",
    resume       = "normal",
    pull_request = "normal",
  }

  local function make_picker(picker_name, extension_name)
    return function()
      local picker = extension_name
        and require("telescope").extensions[extension_name][picker_name]
        or require("telescope.builtin")[picker_name]
      picker({
        initial_mode = picker_initial_modes[picker_name] or "normal",
        attach_mappings = function(prompt_bufnr, map)
          return attach_custom_mappings(prompt_bufnr, map, picker_name)
        end,
      })
    end
  end

  require('telescope').setup {
    defaults = {
      vimgrep_arguments = {
	"rg",
	"--color=never",
	"--no-heading",
	"--with-filename",
	"--line-number",
	"--column",
	"--smart-case",
	"--hidden",
      },
      preview = {
	treesitter = false,
      },
      layout_strategy = "horizontal",
      layout_config = {
	height = 0.9999,
	width = 0.9999,
	mirror = false,
	prompt_position = "bottom",
	preview_width = 0.6,
	preview_cutoff = 0,
	anchor = 'N'
      },
      scrollbar = false,
      borderchars = { "", "", "", "", "", "", "", "" },
      buffer_previewer_maker = new_maker,
      mappings = {
        i = {},
        n = {
          ["sv"] = actions.file_split,
          ["sg"] = actions.file_vsplit,
          ["st"] = actions.file_tab,
        },
      },
      file_ignore_patterns = {
        "node_modules", ".work/.*", ".cache/.*", ".idea/.*",
        ".DS_Store", "dist/.*", ".git/.*", "build/.*", "dist",
        "yarn.lock", "package-json.lock", "bun.lockb",
        "ios/Pods/*", "vendor/*"
      },
    },
    pickers = {
      git_status   = { initial_mode = "normal" },
      git_files    = { initial_mode = "insert" },
      git_commits  = { initial_mode = "normal" },
      git_branches = { initial_mode = "normal" },
      git_stash    = { initial_mode = "normal" },
      find_files   = { initial_mode = "insert" },
      oldfiles     = { initial_mode = "normal" },
      live_grep    = { initial_mode = "insert" },
      grep_string  = { initial_mode = "normal" },
      resume       = { initial_mode = "normal" },
    },
    extensions = {
      gh = {},
      recent_files = {},
      persisted = { layout_config = { width = 0.55, height = 0.55 } }
    }
  }

  require('telescope').load_extension('gh')
  require("telescope").load_extension("recent_files")
  require("telescope").load_extension("persisted")

  vim.keymap.set("n", "<LocalLeader>f", make_picker("git_files"),   { desc = "Git Files" })
  vim.keymap.set("n", "<LocalLeader>g", make_picker("live_grep"),   { desc = "Live Grep" })
  vim.keymap.set("n", "<leader>gg",     make_picker("grep_string"), { desc = "Grep String" })
  vim.keymap.set("n", "<LocalLeader>r", make_picker("resume"),      { desc = "Resume" })
  vim.keymap.set("n", "<LocalLeader>i", make_picker("oldfiles"),    { desc = "Old Files" })
  vim.keymap.set("n", "gs",             make_picker("git_status"),  { desc = "Git Status" })
  vim.keymap.set("n", "gB",             make_picker("git_branches"),{ desc = "Git Branches" })
  vim.keymap.set("n", "gS",             make_picker("git_stash"),   { desc = "Git Stash" })

  require('diffview').setup({})
  require('neogit').setup({})
  require('gitsigns').setup({})

  vim.api.nvim_set_hl(0, 'DiffviewDiffAddAsDelete', { bg = "#431313" })
  vim.api.nvim_set_hl(0, 'DiffDelete',              { bg = "none", fg = "#311313" })
  vim.api.nvim_set_hl(0, 'DiffviewDiffDelete',      { bg = "none", fg = "#331313" })
  vim.api.nvim_set_hl(0, 'DiffAdd',                 { bg = "#142a03" })
  vim.api.nvim_set_hl(0, 'DiffChange',              { bg = "#3B3307" })
  vim.api.nvim_set_hl(0, 'DiffText',                { bg = "#4D520D" })

  vim.g.rooter_patterns = { ".git", "build/sh", "index.md", ".proj", ".root", ".nrepl-port", ".exercism" }
  vim.g.rooter_change_directory_for_non_project_files = "current"
  vim.g.rooter_cd_cmd = "lcd"
  vim.g.rooter_silent_chdir = true
EOF

nnoremap <LocalLeader>s <cmd>Spectre<cr>
nnoremap gl  <cmd>Telescope git_commits initial_mode=normal<cr>
nnoremap gb  <cmd>Telescope git_bcommits initial_mode=normal<cr>
nnoremap gh  <cmd>Telescope gh pull_request initial_mode=normal<cr>
nnoremap gha <cmd>Telescope gh pull_request state=all initial_mode=normal<cr>
nnoremap ghm <cmd>Telescope gh pull_request state=all author='@me' initial_mode=normal<cr>
