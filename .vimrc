if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif

call plug#begin('~/.vim/plugged')
Plug 'simeji/winresizer'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'honza/vim-snippets'
Plug 'cocopon/iceberg.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
" LSP
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'lighttiger2505/deoplete-vim-lsp'
call plug#end()


"
" gitgutter
"
" 目印行を常に表示する
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif


"
" Rainbow Parentheses
"
let g:rbpt_colorpairs = [
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['brown',       'RoyalBlue3'],
    \ ['red',         'firebrick3'],
    \ ['brown',       'firebrick3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkgreen',   'firebrick3'],
    \ ]
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons " <>


"
" iceberg
"
colorscheme iceberg
set background=dark


"
" ale
"
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'go': ['gofmt', 'goimports'],
\   'python': ['autopep8', 'isort'],
\   'yaml': ['prettier'],
\   'javascript': ['prettier', 'eslint'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\}

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0

let g:airline#extensions#ale#enabled = 0


"
" vim-lsp
"
nmap gd :tab split<cr>:LspDefinition<cr>
nmap gs :sp<cr>:LspDefinition<cr>
nmap gv :vsp<cr>:LspDefinition<cr>
nmap gp :LspPeekDefinition<cr>
let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
" let g:lsp_signs_error = {'text': '✗'}
" let g:lsp_signs_warning = {'text': '‼', 'icon': '/path/to/some/icon'} " icons require GUI
" let g:lsp_signs_hint = {'icon': '/path/to/some/other/icon'} " icons require GUI
let g:lsp_highlight_references_enabled = 1




let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 75


" 文字コードをUFT-8に設定
set encoding=utf-8
scriptencoding utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" クリップボードを共有
set clipboard=unnamed,autoselect
" クリップボードのペースト時に勝手にコメントやインデントされるのを防ぐ
" set paste
set pastetoggle=<F3>


" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
"set cursorcolumn
" カーソルが何行目の何列目に置かれているかを表示
set ruler
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトの有効化
syntax enable


" Tab系
" 不可視文字を可視化
set list listchars=tab:\▸\_,trail:~,extends:»,precedes:«
" 何個分のスペースで 1 つのタブとしてカウントするか
set tabstop=4
" 何個分のスペースを挿入するか
set softtabstop=4
" スペース何個分インデントさせるか
set shiftwidth=4
" Tab文字を半角スペースにする
" Makefile であれば tab をスペースに変換しない
set expandtab
let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif
set smartindent
set smarttab
set autoindent


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
nnoremap <silent> <Space><Space> :let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>


filetype on

set backspace=indent,eol,start

set wildmode=longest,full
set wildmenu
set wildmode=full

set clipboard=unnamedplus
