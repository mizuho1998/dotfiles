{ config, pkgs, ... }:

let
  plugins = pkgs.vimPlugins // pkgs.callPackage ./vim_plugins.nix {};
in {
  programs.vim = {
    enable = true;
    settings = {};
    extraConfig = ''
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

      if exists('&signcolumn')
        set signcolumn=yes
      else
        let g:gitgutter_sign_column_always = 1
      endif

      " Rainbow Parentheses
      let g:rbpt_max = 16
      au VimEnter * RainbowParenthesesToggle
      au Syntax * RainbowParenthesesLoadRound
      au Syntax * RainbowParenthesesLoadSquare
      au Syntax * RainbowParenthesesLoadBraces
      au Syntax * RainbowParenthesesLoadChevrons " <>


      " iceberg
      colorscheme iceberg
      set background=dark

      " ale
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


      " vim-lsp
      nmap gd :tab split<cr>:LspDefinition<cr>
      nmap gs :sp<cr>:LspDefinition<cr>
      nmap gv :vsp<cr>:LspDefinition<cr>
      nmap gp :LspPeekDefinition<cr>
      let g:lsp_diagnostics_enabled = 1
      let g:lsp_signs_enabled = 1         " enable signs
      let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
      let g:lsp_highlight_references_enabled = 1

      let g:netrw_banner = 0
      let g:netrw_liststyle = 3
      let g:netrw_altv = 1
      let g:netrw_winsize = 75

      set encoding=utf-8
      scriptencoding utf-8
      set nobackup
      set noswapfile
      set autoread
      """set clipboard=unnamed,autoselect
      set pastetoggle=<F3>

      set number
      set cursorline
      set ruler
      set virtualedit=onemore
      set visualbell
      set showmatch
      set laststatus=2
      set wildmode=list:longest
      nnoremap j gj
      nnoremap k gk
      syntax enable

      set list listchars=tab:\▸\_,trail:~,extends:»,precedes:«
      set tabstop=4
      set softtabstop=4
      set shiftwidth=4
      set expandtab
      let _curfile=expand("%:r")
      if _curfile == 'Makefile'
        set noexpandtab
      endif
      set smartindent
      set smarttab
      set autoindent

      set ignorecase
      set smartcase
      set incsearch
      set wrapscan
      set hlsearch
      nmap <Esc><Esc> :nohlsearch<CR><Esc>
      nnoremap <silent> <Space><Space> :let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>

      filetype on

      set backspace=indent,eol,start

      set wildmode=longest,full
      set wildmenu
      set wildmode=full

      ""set clipboard=unnamedplus
    '';
  };
}
