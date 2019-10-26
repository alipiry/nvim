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

call plug#end()

syntax enable

filetype plugin on
filetype indent on

set termguicolors
let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme gruvbox

let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 1

set autoread
set cc=80
set expandtab
set shiftwidth=2
set tabstop=2
set number
set history=1000
set showbreak=↪\
set listchars=nbsp:␣,trail:•,extends:⟩,precedes:⟨," eol:↲,nbsp:·,
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
set updatetime=300

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
autocmd BufWritePre *.go :CocCommand editor.action.organizeImport
au BufEnter * set fo-=c fo-=r fo-=o

nmap <BS> -
noremap <C-S> :Ag<CR>
noremap <C-f> :FZF<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
noremap <Leader>Q :q!<CR>
noremap <Leader>gs :GFiles?<CR>
noremap <Leader>gl :Commits<CR>
noremap <Leader>gch :Gread <CR>
noremap <Leader>ga :Gwrite <CR>
noremap <Leader>gco :Gcommit <CR>
noremap <Leader>df :Gdiff <CR>
noremap <Leader>b :History<CR>
noremap <Leader>t :tabnew <CR>
noremap <Leader>n :tabnext <CR>
nmap <silent> gd <Plug>(coc-definition)
map <Leader>1 :bnext<CR>
map <Leader>2 :bprevious<CR>
nmap <Leader>cf  <Plug>(coc-fix-current)
noremap <Leader>f :CocFix<CR>
nmap <Leader>r :e<CR>

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
