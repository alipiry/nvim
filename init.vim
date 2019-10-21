set shell=bash

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'

call plug#end()

source ~/.config/nvim/basic.vim

set noai

set history=1000

set number

set showbreak=↪\
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨," eol:↲,nbsp:·,
set list
set hidden

let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme gruvbox
set cc=80

set shiftwidth=2
set tabstop=2

let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 1

let g:sneak#use_ic_scs = 1

nmap gs  <plug>(GrepperOperator)

set mouse=a
set completeopt=menu,menuone,preview,noselect,noinsert

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

autocmd BufWritePre *.go :CocCommand editor.action.organizeImport

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

map <C-n> <Plug>NERDTreeTabsToggle<CR>
noremap <C-S> :Ag<CR>
noremap <C-f> :FZF<CR>
noremap <C-w><C-q> :q!<CR>
nmap <Leader>/ <Plug>CommentaryLine
noremap <Leader>gs :GFiles?<CR>
noremap <Leader>gl :Commits<CR>
noremap <Leader>gch :Gread <CR>
noremap <Leader>ga :Gwrite <CR>
noremap <Leader>gco :Gcommit <CR>
noremap <Leader>df :Gdiff <CR>
noremap <Leader>b :History<CR>
noremap <Leader>t :tabnew <CR>
noremap <Leader>n :tabnext <CR>
nmap <BS> -
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
