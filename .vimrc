set shell=/bin/bash

" Vim Plug
call plug#begin('~/.vim/plugged')

Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fannheyward/coc-rust-analyzer'
Plug 'lilydjwg/colorizer'

call plug#end()

" General configuration
filetype plugin indent on
syntax on
set tabstop=4
set signcolumn=no

" Sublime Monokai Theme
colorscheme sublimemonokai
hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none

" Auto-close matching symbols
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap < <><Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

" CoC.nvim Tab to Auto-Complete
inoremap <silent><expr> <cr> "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"

" Shortcuts
inoremap <C-@> <Esc>/<++><CR>"_c4l
autocmd FileType rust inoremap <C-f> fn<Space><++>(<++>)<Space>{<CR><++><CR>}<Esc>kkwc4l

" Keybinds to Compile and Run
autocmd FileType rust nmap <F6> :w<CR>:!clear<Space>&&<Space>cargo<Space>run<CR>

