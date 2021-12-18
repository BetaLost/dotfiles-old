" Vim Plug
call plug#begin('~/.vim/plugged')

Plug 'rust-lang/rust.vim'
Plug 'lilydjwg/colorizer'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'bfrg/vim-cpp-modern'

call plug#end()

" General configuration
filetype indent on
syntax on
set ts=4 sw=4
set signcolumn=no
set pastetoggle=<F2>
set number
set ttimeoutlen=0

" Dracula Color Scheme
colorscheme dracula
hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none

" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" CoC
let g:coc_global_extensions=["coc-rust-analyzer", "coc-clangd", "coc-pyright"]
inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"

" Vim-Airline
let g:airline_powerline_fonts = 1

" Shortcuts
inoremap <C-@> <Esc>/<++><CR>"_c4l
autocmd FileType rust inoremap <C-f> fn<Space><++>(<++>)<Space>{<CR><++><CR>}<Esc>kkwc4l

" Keybinds to Compile and Run
autocmd FileType rust nmap <F6> :w<CR>:!clear<Space>&&<Space>cargo<Space>run<CR>
