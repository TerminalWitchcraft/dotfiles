
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'tmhedberg/SimpylFold'
" Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8', {'for': 'python'}
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'ervandew/supertab'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'
Plug 'lervag/vimtex'
Plug 'shougo/neocomplete.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
" for asynchronous syntax checks 
Plug 'maralla/validator.vim'
" Track the engine.
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Snippets are separated from the engine. Add this if you want them:

Plug 'nathanaelkane/vim-indent-guides', {'for': 'python'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'tpope/vim-surround'
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'majutsushi/tagbar', {'for': ['python', 'cpp']}
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
"Plugin 'vim-scripts/indentpython.vim'
" Adg plugins to &runtimepath
call plug#end()

set nu
set rnu
set laststatus=2
set t_Co=256
let mapleader=" "

"File encoding
set encoding=utf-8

"For python specific changes
let python_highlight_all=1

"Python PEP8 standards
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=blue guibg=darkred

"For extra whitespaces
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Enable folding
set foldmethod=indent
set foldlevel=99

"set undo files
set undofile

"show typed commands
set showcmd
"directory for swap and other files"
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//

"For mapping jk to eac
inoremap jk <esc>

nmap <leader>y "*y
nmap <leader>p "*p
vmap <leader>y "*y
vmap <leader>p "*p

nmap <leader>Y "+y
nmap <leader>P "+p
vmap <leader>Y "+y
vmap <leader>P "+p


""split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"thoughtbot youtube video
let g:netrw_banner = 0 "Diasable annoying banner"
let g:netrw_browse_split = 4 "Open in prior window"
let g:netrw_altv = 1 "open splits to the right"
let g:netrw_lifestyle=3 "tree view"
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

colorscheme solarized

"Run python/C/C++ scrits within vim with F9
filetype on
autocmd FileType python nnoremap <buffer> <F9> :exec '!clear; python' shellescape(@%, 1)<cr>
autocmd filetype c nnoremap <F9> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F9> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>



" set guifont
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
  set lines=10 columns=60
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
else
  " This is console Vim.
endif


" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'"

"Settings for syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
""let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


"Supertab reverse problem
let g:SuperTabDefaultCompletionType = "<c-n>"


" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" for vim validator
let g:validator_permament_sign = 1
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" vim easymotion

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" Gif config

" Require tpope/vim-repeat to enable dot repeat support
" Jump to anywhere with only `s{char}{target}`
" `s<CR>` repeat last find motion.
nmap s <Plug>(easymotion-s)
" Bidirectional & within line 't' motion
omap t <Plug>(easymotion-bd-tl)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

" for tagbar toggle
nmap <F8> :TagbarToggle<CR>
" autocmd FileType * nested :call tagbar#autoopen(0)
let g:tagbar_width = 30

" for nerdtree
map <C-n> :NERDTreeToggle<CR>
