filetype plugin indent on
set encoding=utf-8
set nocompatible
syntax enable
set noswapfile
set number relativenumber
set wrap linebreak nolist
set textwidth=160
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set laststatus=2
set tabstop=4
set shiftwidth=2
set expandtab
set cmdheight=2
set shortmess+=c
set signcolumn=yes
set ignorecase
set smartcase
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set ai
set si
set wrap
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set ffs=unix,dos,mac

" if has("gui_running")
    " set guioptions-=T
    " set guioptions-=e
    " set t_Co=256
    " set guitablabel=%M\ %t
" endif

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim \
  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'NLKNguyen/papercolor-theme'
Plug 'scrooloose/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'morhetz/gruvbox'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'mhartington/oceanic-next'
" Plug 'airblade/vim-gitgutter'
" Plug 'tsony-tsonev/nerdtree-git-plugin'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'ryanoasis/vim-devicons'
" Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
" Plug 'christoomey/vim-tmux-navigator'

call plug#end()

let mapleader=" "

let g:NERDSpaceDelims = 2

" gitgutter
" nmap ]h <Plug>(GitGutterNextHunk)
" nmap [h <Plug>(GitGutterPrevHunk)
" function! GitStatus()
  " let [a,m,r] = GitGutterGetHunkSummary()
  " return printf('+%d ~%d -%d', a, m, r)
" endfunction
" set statusline+=%{GitStatus()}

" emmet
let g:user_emmet_leader_key=','

" Theme
set background=dark
" colorscheme test
" colorscheme gruvbox
" colorscheme PaperColor
colorscheme OceanicNext

" FZF
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>
nnoremap <silent> <leader>e :History<CR>

" Navigation

nnoremap J 10j
nnoremap K 10k

nnoremap fd <Esc>
vnoremap fd <Esc>gV
onoremap fd <Esc>
cnoremap fd <C-C><Esc>
inoremap fd <Esc>`^

nnoremap <Esc> <NOP>
vnoremap <Esc> <NOP>
onoremap <Esc> <NOP>
cnoremap <Esc> <NOP>
inoremap <Esc> <NOP>

nnoremap <C-[> <NOP>
vnoremap <C-[> <NOP>
onoremap <C-[> <NOP>
cnoremap <C-[> <NOP>
inoremap <C-[> <NOP>

" NerdTree
map <leader>n :NERDTreeToggle<CR>
map <leader>m :NERDTreeFind<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" --COC--

" GoTo code navigation.

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use D to show documentation in preview window.
nnoremap <silent> D :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>p :Prettier<CR>

" coc-git
let g:lightline = {
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
  \   ],
  \   'right':[
  \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
  \     [ 'blame' ]
  \   ],
  \ },
  \ 'component_function': {
  \   'blame': 'LightlineGitBlame',
  \ }
\ }

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

set statusline=
set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}

nmap [h <Plug>(coc-git-prevchunk)
nmap ]h <Plug>(coc-git-nextchunk)
nmap gc <Plug>(coc-git-commit)
nmap gu :CocCommand git.chunkUndo<CR>

" --COC--

" Misc
" Show syntax highlighting groups for word under cursor
nmap <leader>P :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
