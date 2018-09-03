syntax enable
set nu
set rnu
set laststatus=2
set undofile
set smartcase
set incsearch
set showcmd
set autoread
set fileformat=unix
set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m
"set noequalalways
set encoding=utf-8
set termguicolors
set clipboard+=unnamedplus
"set completeopt-=preview
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set inccommand="split"
set splitbelow
set splitright
set confirm
set conceallevel=2
set noshowmode
set hidden
"set guicursor="n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

"au ColorScheme * hi Normal ctermbg=none guibg=none

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
	\,a:blinkwait700-blinkoff1000-blinkon1000-Cursor/lCursor
	\,sm:block-blinkwait175-blinkoff150-blinkon175
"set cursorline
"set guicursor="n-v-c-sm:block-blinkwait300-blinkon200-blinkoff150,i-ci-ve:ver25,r-cr-o:hor20"
colorscheme one
set background=dark
set nowrap

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
command! -bang -nargs=* -complete=file Make Neomake! <args>
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo
au BufNewFile,BufRead *.md
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4
au FileType vimwiki set syntax=pandoc
autocmd FileType rust setlocal commentstring=//\ %s

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" For vim split terminals
command! -nargs=* Term 10split | terminal <args>
command! -nargs=* Vterm vsplit | terminal <args>
autocmd CompleteDone * silent! pclose!

" From completion engine
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END


" for cursor
au VimLeave * set guicursor=a:block-blinkon200

"autocmd InsertLeave * silent! pclose!
"""Colors
""let g:terminal_color_0 = "#121c21"
""let g:terminal_color_8 = "#52606b"
""
""let g:terminal_color_1 = "#e44754"
""let g:terminal_color_9 = "#e44754"
""
""let g:terminal_color_2 = "#89bd82"
""let g:terminal_color_10 = "#89bd82"
""
""let g:terminal_color_3 = "#f7bd51"
""let g:terminal_color_11 = "#f7bd51"
""
""let g:terminal_color_4 = "#5486c0"
""let g:terminal_color_12 = "#5486c0"
""
""let g:terminal_color_5 = "#b77eb8"
""let g:terminal_color_13 = "#b77eb8"
""
""let g:terminal_color_6 = "#50a5a4"
""let g:terminal_color_14 = "#50a5a4"
""
""let g:terminal_color_7 = "#ffffff"
""let g:terminal_color_15 = "#ffffff"
