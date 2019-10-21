call plug#begin('~/.config/nvim/plugged')
  Plug 'ap/vim-buftabline'
  Plug 'chaoren/vim-wordmotion', {'commit': '23fc891'}
  Plug 'christoomey/vim-sort-motion'
  Plug 'ctrlpvim/ctrlp.vim', {'tag': '1.79'}
  Plug 'farmergreg/vim-lastplace', {'tag': 'v3.1.0'}
  Plug 'janko-m/vim-test'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'jtratner/vim-flavored-markdown', {'commit': '4a70aa2'}
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'kassio/neoterm'
  Plug 'lifepillar/vim-mucomplete'
  Plug 'majutsushi/tagbar', {'commit': 'bef1fa4'}
  Plug 'michaeljsmith/vim-indent-object', {'tag': '1.1.2'}
  Plug 'milch/vim-fastlane'
  Plug 'mileszs/ack.vim', {'tag': '1.0.9'}
  Plug 'pangloss/vim-javascript', {'commit': 'a87c9443'}
  Plug 'leafOfTree/vim-vue-plugin'
  Plug 'scrooloose/nerdtree', {'tag': '5.0.0'}
  Plug 'tommcdo/vim-exchange', {'commit': '05d82b8'}
  Plug 'tomtom/tcomment_vim', {'tag': '3.08'}
  Plug 'tpope/vim-endwise', {'commit': '0067ced'}
  Plug 'tpope/vim-fugitive', {'tag': 'v2.2'}
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline', {'tag': 'v0.8'}
  Plug 'vim-airline/vim-airline-themes', {'commit': '13bad30'}
  Plug 'vim-scripts/argtextobj.vim', {'tag': '1.1.1'}
  Plug 'w0rp/ale'
call plug#end()

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
set completeopt+=menuone
set shortmess+=c
set completeopt+=noselect
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

nmap <silent> <LocalLeader>ff :CtrlP<CR>
nmap <silent> <LocalLeader>gw :Ggrep <cword><CR>
nmap <silent> <LocalLeader>na :ALEToggle<CR>
nmap <silent> <LocalLeader>nf :NERDTreeFind<CR> | :vertical resize 60<CR>
nmap <silent> <LocalLeader>nh :nohls<CR>
nmap <silent> <LocalLeader>nt :NERDTreeToggle<CR>
nmap <silent> <LocalLeader>n<SPACE> :highlight clear ExtraWhitespace<CR>
nmap <silent> <LocalLeader><SPACE> :highlight ExtraWhitespace ctermbg=red guibg=red<CR>
nmap <silent> <LocalLeader>rb :wa <bar> :TestFile -strategy=neoterm<CR>
nmap <silent> <LocalLeader>rf :wa <bar> :TestNearest -strategy=neoterm<CR>
nmap <silent> <LocalLeader>rl :wa <bar> :TestLast -strategy=neoterm<CR>
nmap <silent> <LocalLeader>tt :TagbarToggle<CR>
nmap <silent> <LocalLeader>tf :TagbarOpen fj<CR>
nmap <silent> <LocalLeader>tc :TagbarClose<CR>
nmap <silent> <LocalLeader>p :Files<CR>
nnoremap <LocalLeader>* :keepjumps normal! #*<CR>
nnoremap <LocalLeader># :keepjumps normal! *#<CR>

" remove whitespace
nnoremap <LocalLeader>W :%s/\s\+$//<cr>:let @/=''<CR>

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
tnoremap <Esc> <C-\><C-n>

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

let g:mucomplete#enable_auto_at_startup = 1

" ###### ALE ######

" when to lint
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 1

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

fun! HandleOpenTestInSplit(file, extention_regex, extention_replace, path_regex, path_replace)
  let f1 = substitute(a:file, a:extention_regex, a:extention_replace, "")
  let f2 = substitute(f1, a:path_regex, a:path_replace, "")
  call OpenFilesInSplit(f2, a:file)
  exec "w"
endfun

fun! OpenSpecInSplit()
  let file = expand('%:p')

  if match(file, "app/javascript/packs/claims_dashboard") >= 0
    call HandleOpenTestInSplit(file,"\\.vue", "-test.js","/packs\\/", "/test/")
  elseif match(file, "app/javascript/test/claims_dashboard") >= 0
    call HandleOpenTestInSplit(file,"\\-test.js", ".vue","test\\/", "packs/")
  elseif match(file, "app/") >= 0
    call HandleOpenTestInSplit(file,"\\.rb", "_spec.rb","app\\/", "spec/")
  elseif match(file, "spec/") >= 0
    call HandleOpenTestInSplit(file,"\_spec", "","spec/", "app/")
  elseif match(file, "src") >= 0
    call HandleOpenTestInSplit(file,"\\.js", "-test.js","src\\/", "test/")
  elseif match(file, "test") >= 0
    call HandleOpenTestInSplit(file,"\\-test.js", ".js","test\\/", "src/")
  endif
endfun
com! OpenSpecInSplit :call OpenSpecInSplit()
