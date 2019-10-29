set shell=bash

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'luochen1990/rainbow'

call plug#end()

syntax on

filetype plugin on
filetype indent on

set termguicolors
let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme gruvbox

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:rainbow_active = 1

set autoread
set cc=80
set expandtab
set shiftwidth=2
set tabstop=2
set number
set history=1000
set showbreak=↪\
set listchars=tab:\ \ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨," eol:↲,nbsp:·,
set list
set hidden
set completeopt=menu,menuone,preview,noselect,noinsert
set mouse=
set encoding=utf8
set ruler
set hid
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile
set lbr
set tw=160
set ai
set si
set wrap
set updatetime=100

nmap <BS> -
noremap <C-S> :Ag<CR>
noremap <C-f> :FZF<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
noremap <Leader>Q :q!<CR>
noremap <Leader>gs :GFiles?<CR>
noremap <Leader>gl :Commits<CR>
noremap <Leader>gch :Gread<CR>
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gco :Gcommit<CR>
noremap <Leader>df :Gdiff<CR>
noremap <Leader>b :History<CR>
noremap <Leader>t :tabnew<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <Leader>cf  <Plug>(coc-fix-current)
noremap <Leader>f :CocFix<CR>
nmap <Leader>r :e<CR>
nmap 1 1gt
nmap 2 2gt
nmap 3 3gt
noremap <TAB> :tabNext<CR>

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
au BufEnter * set fo-=c fo-=r fo-=o
