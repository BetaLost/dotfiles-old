set shell=/bin/bash

call plug#begin('~/.vim/plugged')

Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fannheyward/coc-rust-analyzer'
Plug 'lilydjwg/colorizer'

call plug#end()

filetype plugin indent on
syntax on
set tabstop=4

colorscheme sublimemonokai
let g:sublimemonokai_term_italic = 1
hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none

inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

inoremap <silent><expr> <cr> "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"

inoremap <C-@> <Esc>/<++><CR>"_c4l
autocmd FileType rust inoremap <C-f> fn<Space><++>(<++>)<Space>{<CR><++><CR>}<Esc>kkwc4l

set signcolumn=no
