set shell=/bin/bash

" Vim Plug
call plug#begin('~/.vim/plugged')

Plug 'rust-lang/rust.vim'
Plug 'lilydjwg/colorizer'

call plug#end()

" General configuration
filetype plugin indent on
syntax on
set ts=4 sw=4
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
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha
autocmd FileType html inoremap < <><Esc>ha

" Shortcuts
inoremap <C-@> <Esc>/<++><CR>"_c4l
autocmd FileType rust inoremap <C-f> fn<Space><++>(<++>)<Space>{<CR><++><CR>}<Esc>kkwc4l

" Keybinds to Compile and Run
autocmd FileType rust nmap <F6> :w<CR>:!clear<Space>&&<Space>cargo<Space>run<CR>
