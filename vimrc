
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'mattn/emmet-vim'
Plug 'valloric/youcompleteme'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'mxw/vim-jsx'

" Color themes
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'yorickpeterse/happy_hacking.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

let g:ctrlp_working_path_mode = 'ar'
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|node_modules)$'
let g:javascript_plugin_jsdoc = 1

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

set autoread
set termguicolors
syntax enable
" set cursorline
set t_Co=256
set relativenumber
set number
set background=dark
colorscheme PaperColor
" let g:airline_theme = 'one'
" let g:deoplete#enable_at_startup = 1
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set copyindent
set guifont=Fira\ Code:h12

set hlsearch
set incsearch
set ignorecase
set smartcase


map <C-d> :NERDTreeToggle<CR>
map <C-h> :call WinCmd('h')<CR>
map <C-j> :call WinCmd('j')<CR>
map <C-k> :call WinCmd('k')<CR>
map <C-l> :call WinCmd('l')<CR>
map <C-n> :tabnew<CR>
map <C-w> :tabclose<CR>
map <C-u> :call TabMove('u')<CR>
map <C-i> :call TabMove('i')<CR>
noremap <C-s-up> ddkP
noremap <C-s-down> ddp

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

function! WinCmd(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if(match (a:key, '[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

function! TabMove(key)
  let t:curtab = tabpagenr()
  let t:diff = 0
  if (a:key == 'u')
    let t:diff = -1
  elseif (a:key == 'i')
    let t:diff = 1
  endif
  let t:nexttab = t:curtab + t:diff
  echo t:diff
  if (t:nexttab != 0) 
    exec "tabn ".t:nexttab
  endif
endfunction

