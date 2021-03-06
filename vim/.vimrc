" plugins
let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    let need_to_install_plugins = 1
endif

syntax on

" Editing behavior:
set showmode                    " always show editor mode
set noerrorbells
set autoindent
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab 
set smartindent
set nonu                        " donot show line numbers
set relativenumber              " set relative numbers
set nowrap                      " dont wrap lines
set noswapfile
set encoding=utf8
" set guifont=3720\ 11

set nobackup
set undodir=~/.vim/undodir
set undofile

set incsearch                   " show search matches as you type
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if seach pattern is all lowercase, case sensitive otherwise

set colorcolumn=80

set mouse=a                     " enable using the mouse if supports
set shortmess+=I                " hide launch screen
set clipboard=unnamed           " normal OS clipboard interaction 


call plug#begin('~/.vim/plugged')
Plug 'crusoexia/vim-dracula'
"Plug 'morhetz/gruvbox'
"Plug 'shinchu/lightline-gruvbox.vim'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'               " devicons for nerdtree
Plug 'itchyny/lightline.vim'                " a powerline alternative
Plug 'airblade/vim-gitgutter'               " git status   
Plug 'terryma/vim-multiple-cursors'         " multi-selection 
Plug 'ycm-core/YouCompleteMe'
Plug 'dense-analysis/ale'                   " check syntax
Plug 'frazrepo/vim-rainbow'                 " rainbow parentheses
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'christoomey/vim-tmux-navigator'       " tmux
Plug 'preservim/nerdcommenter'              " command 
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"for Markdown editing:
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
call plug#end()

"" gruvbox themes settings
"let g:gruvbox_italic = 1                    " enable italics 
"let g:gruvbox_bold = 1
"let g:gruvbox_contrast_dark = 'hard'
"let g:lightline = {}
"let g:lightline.colorscheme = 'gruvbox'
"let s:is_dark=(&background == 'dark')
"set bg=dark
"colorscheme gruvbox 

" Dracula color scheme for vim
" https://draculatheme.com/vim
" with modification from: crusoexia/vim-dracula
let g:dracula_italic = 1                    " enable italic

packadd! dracula
syntax enable
colorscheme dracula
filetype on
filetype plugin indent on

" for rainbow parentheses configuration 
let g:rainbow_active = 1 

" for c++ syntax highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1 
let g:cpp_experimental_simple_highlight = 1 
let g:cpp_concepts_highlight = 1

" for nerdtree configuration
autocmd vimenter * NERDTree                 " open a NERDTree automatically when vim starts up
let g:webdevicons_enable = 1                " loading the plugin
" close nerdtree if it's the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" modify lightline color scheme
"let g:lightline = {
      "\ 'colorscheme': 'wombat',
      "\ }
"set laststatus=2                            " always show status bar

" for vim-markdown configuration
let g:vim_markdown_folding_disabled = 1     " disable auto folding
let g:vim_markdown_override_foldtext = 0    " prevent foldtext from being set
let g:vim_markdown_math = 1                 " enable latex math $$

" for vim-pencil configuration
" set default format for `markdown` and `txt` files
augroup pencil
  autocmd!
  autocmd FileType markdown call pencil#init({'wrap': 'soft', 'autoformat': 1})
  autocmd FileType text     call pencil#init({'wrap': 'soft', 'autoformat': 1})
augroup END 

" Limelight configuration: enable when in Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" nerdcommenter configuration 

