call plug#begin('~/.config/nvim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ap/vim-buftabline'
  Plug 'chaoren/vim-wordmotion'
  Plug 'christoomey/vim-sort-motion'
  Plug 'farmergreg/vim-lastplace'
  Plug 'janko-m/vim-test'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'jtratner/vim-flavored-markdown'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'kassio/neoterm'
  Plug 'leafOfTree/vim-vue-plugin'
  Plug 'majutsushi/tagbar'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'milch/vim-fastlane'
  Plug 'mileszs/ack.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'roman/golden-ratio'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'scrooloose/nerdtree'
  Plug 'tommcdo/vim-exchange'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-scripts/argtextobj.vim'
  Plug 'dense-analysis/ale'
call plug#end()

let g:coc_global_extensions = ['coc-solargraph', 'coc-json', 'coc-css', 'coc-html']

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

set dir=/tmp//
set hidden
set ignorecase
set mouse=
set number
set ruler
set showmatch
set smartcase
set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set undofile
set clipboard=unnamed
set shortmess+=c
set gdefault
set foldlevelstart=20
set foldmethod=indent

autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
autocmd QuickFixCmdPost *grep* cwindow

" trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd FileType javascript autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType ruby autocmd BufWritePre <buffer> :%s/\s\+$//e

function! ClearTerminalTransform(cmd) abort
  return 'clear;'.a:cmd
endfunction

colorscheme Tomorrow-Night

imap <C-L> <SPACE>=><SPACE>

nnoremap <silent> <C-J> <C-W><C-J>
nnoremap <silent> <C-K> <C-W><C-K>
nnoremap <silent> <C-L> <C-W><C-L>
nnoremap <silent> <C-H> <C-W><C-H>
nmap <silent> <LocalLeader>nf :NERDTreeFind<CR> | :vertical resize 60<CR>
nmap <silent> <LocalLeader>nh :nohls<CR>
nmap <silent> <LocalLeader>nt :NERDTreeToggle<CR>

nmap <silent> <LocalLeader>rb :wa <bar> :TestFile -strategy=neovim<CR>
nmap <silent> <LocalLeader>rf :wa <bar> :TestNearest -strategy=neovim<CR>
nmap <silent> <LocalLeader>rl :wa <bar> :TestLast -strategy=neovim<CR>
nmap <silent> <LocalLeader>tt :TagbarToggle<CR>
nmap <silent> <LocalLeader>tf :TagbarOpen fj<CR>
nmap <silent> <LocalLeader>tc :TagbarClose<CR>
nmap <silent> <LocalLeader>p :Files<CR>
nnoremap <LocalLeader>* :keepjumps normal! #*<CR>
nnoremap <LocalLeader># :keepjumps normal! *#<CR>

" remove whitespace
nnoremap <LocalLeader>W :%s/\s\+$//<cr>:let @/=''<CR>
"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

let g:exchange_no_mappings=1
nmap <silent> cx <Plug>(Exchange)
xmap <silent> X <Plug>(Exchange)
nmap <silent> cxc <Plug>(ExchangeClear)
nmap <silent> cxx <Plug>(ExchangeLine)

nmap <silent> [q :cprevious<CR>
nmap <silent> ]q :cnext<CR>
nmap <silent> [Q :cfirst<CR>
nmap <silent> ]Q :clast<CR>
nmap <LocalLeader>f :Ggrep<Space>
nnoremap <C-[> :bprev<CR>
nnoremap <C-]> :bnext<CR>

inoremap kj <Esc>
tmap <C-o> <C-\><C-n>

let g:neoterm_default_mod = 'rightbelow'
let g:neoterm_size = '20'
let g:test#custom_transformations = {'clear': function('ClearTerminalTransform')}
let g:test#transformation = 'clear'

" Allows Ctrl-P to find hidden files like .env
let g:ctrlp_show_hidden = 1

function! YarnStrategy(cmd)
  echo 'It works! Command for running tests: ' . a:cmd
endfunction

" Allows mocha tests for RN to run in nvim
let test#javascript#mocha#executable = 'yarn test:single'
let test#javascript#jest#options = '--runInBand'

" File and folder CtrlP exclusions. See https://github.com/kien/ctrlp.vim
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|node_modules$\|Pods$\|build$',
  \ }

let g:wordmotion_prefix = '<LocalLeader>'
let g:wordmotion_mappings = {
\ 'b' : '<LocalLeader>bb',
\ }

" Sort tags in order of appearance by default
let g:tagbar_sort = 0
" let g:deoplete#enable_at_startup = 1

" ###### ALE ######
let g:ale_python_auto_pipenv = 1

" when to lint
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_delay = 1000

" add sign column emoticons
let g:ale_sign_error = 'e'
let g:ale_sign_warning = 'w'

" message format
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" always show the sign column
let g:ale_sign_column_always = 1
let g:ale_set_higlights = 1

" ale fixers
let g:ale_fix_on_save = 1
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'vue': ['eslint']}
let g:ale_fixers = {
      \  '*': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \  ],
      \  'javascript': [
      \   'eslint',
      \  ],
      \  'vue': [
      \   'eslint',
      \  ],
      \  'ruby': [
      \   'rubocop',
      \  ],
      \  'Fastfile': [
      \   'rubocop',
      \  ],
      \}

let g:ale_ruby_rubocop_executable = 'bundle'

" Allow switching to buffer #<n> by typing <n>e
let g:buftabline_numbers = 2
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)

" reset sign column background colors
highlight link ALEError SignColumn
highlight link ALEWarning SignColumn
highlight link ALEErrorSign SignColumn
highlight link ALEWarningSign SignColumn

let NERDTreeShowHidden=1
let g:NERDTreeWinSize=60

" faster fzf fuzzy find respecting gitignore
let $FZF_DEFAULT_COMMAND = '(git ls-tree -r --name-only HEAD || find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//) 2> /dev/null'
let g:fzf_layout = { 'down': '~40%' }

nnoremap <leader>ls :OpenSpecInSplit<cr>

fun! OpenFilesInSplit(left, right)
  if a:left == a:right
    return
  endif

  only
  exec "edit " . a:left
  exec "vs " . a:right
  execute "normal! \<c-w>t"
endfun

fun! HandleOpenTestInSplit(file, first, extention_regex, extention_replace, path_regex, path_replace)
  let f1 = substitute(a:file, a:extention_regex, a:extention_replace, "")
  let f2 = substitute(f1, a:path_regex, a:path_replace, "")
  if a:first == 0
    call OpenFilesInSplit(a:file, f2)
  else
    call OpenFilesInSplit(f2, a:file)
  endif
  exec "w"
endfun

fun! OpenSpecInSplit()
  let file = expand('%:p')

  if match(file, "app/javascript/packs/claims_dashboard") >= 0
    call HandleOpenTestInSplit(file, 1, "\\.vue", "-test.js","/packs\\/", "/test/")
  elseif match(file, "app/javascript/test/claims_dashboard") >= 0
    call HandleOpenTestInSplit(file, 0, "\\-test.js", ".vue","test\\/", "packs/")
  elseif match(file, "app/javascript/packs/") >= 0
    call HandleOpenTestInSplit(file, 1, "\\.js", "-test.js","/packs\\/", "/test/")
  elseif match(file, "app/javascript/test/") >= 0
    call HandleOpenTestInSplit(file, 0, "\\-test.js", ".js","test\\/", "packs/")
  elseif match(file, "app/") >= 0
    call HandleOpenTestInSplit(file, 1, "\\.rb", "_spec.rb","app\\/", "spec/")
  elseif match(file, "spec/") >= 0
    call HandleOpenTestInSplit(file, 0, "\_spec", "","spec/", "app/")
  elseif match(file, "src") >= 0
    call HandleOpenTestInSplit(file, 1, "\\.js", "-test.js","src\\/", "test/")
  elseif match(file, "test") >= 0
    call HandleOpenTestInSplit(file, 0, "\\-test.js", ".js","test\\/", "src/")
  endif
endfun
com! OpenSpecInSplit :call OpenSpecInSplit()
