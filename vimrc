filetype plugin indent on
set encoding=utf-8
set nocompatible
syntax enable
set noswapfile
let mapleader=" "
set number relativenumber
set wrap linebreak nolist
set textwidth=160
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
" set signcolumn=yes
set guifont=Fura\ Code\ Light\ Nerd\ Font\ Complete:h16

" cursor
let &t_SI.="\e[5 q"
let &t_SR.="\e[3 q" 
let &t_EI.="\e[1 q"

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'NLKNguyen/papercolor-theme'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
call plug#end()

colorscheme papercolor

" COC
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
" Use `[g` and `]g` to navigate diagnostics
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap ESC
inoremap jj <Esc>
inoremap <Esc> <NOP>

" Reload vim
nnoremap <leader>sv :source ~/.vimrc<CR>

" Buffers
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" Find
nnoremap <leader>f :FZF<CR>

" NERDTree
map <leader>m :NERDTreeFind<CR>
map <leader>n :NERDTreeToggle<CR>

" vim-airline
let g:airline_powerline_fonts = 1 
let g:airline#extensions#keymap#enabled = 0
let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
let g:Powerline_symbols='unicode'
let g:airline#extensions#xkblayout#enabled = 0 

" typescript
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

