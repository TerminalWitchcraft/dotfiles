set nocompatible

call plug#begin('~/.local/share/nvim/plugged')

"Plug 'joshdick/onedark.vim'
""Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'dracula/vim', { 'as': 'dracula' }
""Plug 'chriskempson/base16-vim'
Plug 'mike-hearn/base16-vim-lightline'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'taohexxx/lightline-buffer'
Plug 'takac/vim-hardtime'
Plug 'edkolev/tmuxline.vim'
Plug 'Yggdroot/indentLine'
Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'jsfaint/gen_tags.vim'

Plug 'neomake/neomake'
" Plug 'tpope/vim-dispatch'
" Plug 'w0rp/ale'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-github'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-racer', { 'for': 'rust' }
" Plug 'ncm2/ncm2-tern',  {'do': 'npm install', 'for': 'javascript' }
Plug 'ncm2/ncm2-jedi', {'for': 'python' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-fugitive'

Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'

" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
Plug 'pgdouyon/vim-evanesco'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()

set rnu
set showtabline=2
set clipboard+=unnamedplus
" set cursorline
set splitbelow
set shortmess+=c
set splitright
set confirm
set undofile
set ignorecase
set smartcase
set inccommand = "split"
set termguicolors
set laststatus=2
set nu
set noshowmode
set hidden
set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m
set completeopt=noinsert,menuone,noselect
set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
set tabstop=4
set expandtab
" set softtabstop=4
set shiftwidth=4
" colorscheme base16-eighties
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 16
let g:nord_cursor_line_number_background = 1
colorscheme dracula

let mapleader=" "
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

nnoremap <C-J> <C-W><C-W>
"nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W>W
"nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W>>
nnoremap <C-H> <C-W><
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

" For terminal use
tnoremap jk <C-\><C-N>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

nnoremap tj :tabprevious<CR>
nnoremap tk :tabnext<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<CR>

nmap <F9> :Neomake<CR>
nmap <Leader>a :History<CR>
nmap <Leader>f :FZF<CR>
nmap <Leader>F :FZF ~<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>t :BTags<CR>
" nmap <Leader>t :call LanguageClient_textDocument_documentSymbol()<CR>
nmap <Leader>T :Tags<CR>
nmap <Leader>m :Marks<CR>
nmap <Leader>M :History:<CR>
nmap <Leader>c :Commands<CR>
nmap <Leader>h :Helptags<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>g :Rg<cr>
" nmap <Leader>p :call LanguageClient#textDocument_

inoremap <c-c> <ESC>
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("<CR>", 'n') : "\<CR>")
" inoremap <expr> <C-k> (pumvisible() ? ncm2_ultisnips#expand_or('', 'n') : "\<C-k>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'
" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
" inoremap <silent> <expr> <C-k> ncm2_ultisnips#expand_or("/<CR>", 'n')
command! -nargs=* Term 10split | terminal <args>
command! -nargs=* Vterm vsplit | terminal <args>
autocmd CompleteDone * silent! pclose!

" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['~/.local/share/cargo/bin/rustup', 'run', 'stable', 'rls'],
"     \ 'python': ['/usr/bin/pyls'],
"     \ 'javascript': ['/usr/bin/javascript-typescript-stdio'],
"     \ }

" c-j c-k for moving in snippet
let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_layout = { 'window': '10split enew' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --max-filesize=2M --maxdepth=40 --threads 4 '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
let $FZF_DEFAULT_COMMAND = 'rg --files --no-messages --glob "!.git" --maxdepth=40'
let g:fzf_tags_command = 'ctags -x -R  --exclude="target/*" --exclude="*.json"'
command! -bang -nargs=* BTags :call fzf#vim#buffer_tags(<q-args>, {'options': ['--no-reverse', '--prompt', 'TAGS ❯❯❯ ']}, <bang>0)
command! -bang -nargs=* Tags :call fzf#vim#tags(<q-args>, {'options': ['--no-reverse', '--prompt', 'TAGS ❯❯❯ '], 'source': 'ctags -x -R  --exclude="target/*" --exclude="*.json"'}, <bang>0)


" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()

let g:lightline = {
          \ 'enable': {
            \ 'statusline': 1,
            \ 'tabline': 1
            \ },
	 \ 'colorscheme': 'Dracula',
         \ }

let g:lightline.active = {
   \ 'left': [ [ 'mode', 'paste' ],
   \           [ 'readonly', 'relativepath', 'modified'] ],
   \ 'right': [ [ 'neomake' ],
   \            [ 'lineinfo' ],
   \            [ 'percent' ],
   \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
let g:lightline.inactive = {
   \ 'left': [ [ 'filename' ] ],
   \ 'right': [ [ 'lineinfo' ],
   \            [ 'percent' ] ] }
let g:lightline.tabline = {
   \ 'left': [ [ 'bufferinfo' ], ['seperator'],
   \           ['bufferbefore', 'buffercurrent', 'bufferafter' ],],
   \ 'right': [ [ 'close' ] ] }

let g:lightline.tab = {
    \ 'active': [ 'tabnum', 'filename', 'modified' ],
    \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }

let g:lightline.component_expand = {
    \   'buffercurrent': 'lightline#buffer#buffercurrent',
    \   'bufferbefore': 'lightline#buffer#bufferbefore',
    \   'bufferafter': 'lightline#buffer#bufferafter',
    \   'neomake': 'LightlineNeomake',
    \ }
let g:lightline.component_type = {
    \   'buffercurrent': 'tabsel',
    \   'bufferbefore': 'raw',
    \   'bufferafter': 'raw',
    \   'neomake': 'error',
    \ }
let g:lightline.component_function = {
    \   'bufferinfo': 'lightline#buffer#bufferinfo',
    \   'filetype': 'MyFiletype',
    \   'fileformat': 'MyFileformat',
    \ }
let g:lightline.component = {
    \   'separator': '',
    \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction


let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '+'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '
let g:lightline_buffer_enable_devicons = 0
" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 0
" :help filename-modifiers
let g:lightline_buffer_fname_mod = ':t'
" hide buffer list
let g:lightline_buffer_excludes = ['vimfiler']
" max file name length
let g:lightline_buffer_maxflen = 30
" max file extension length
let g:lightline_buffer_maxfextlen = 3
" min file name length
let g:lightline_buffer_minflen = 16
" min file extension length
let g:lightline_buffer_minfextlen = 3
" reserve length for other component (e.g. info, close)
let g:lightline_buffer_reservelen = 20




let g:sneak#s_next = 1
let g:sneak#label = 1
let g:sneak#prompt = '>>>'
let g:sneak#use_ic_scs=1
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T


autocmd FileType rust let g:rust_fold=1
autocmd FileType javascript set tabstop=4
autocmd FileType javascript set softtabstop=4
autocmd FileType javascript set shiftwidth=4
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
	\,a:blinkwait700-blinkoff1000-blinkon1000-Cursor/lCursor
	\,sm:block-blinkwait175-blinkoff150-blinkon175

" let g:hardtime_default_on = 1

let g:gen_tags#ctags_auto_gen = 1
let g:tmuxline_powerline_separators = 0

" Vim indentline/
let g:indentLine_enabled = 1
let g:indentLine_fileType = ['c', 'cpp', 'rust', 'python']
" let g:indentLine_setColors = 0
" let g:indentLine_concealcursor = 'c'
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_char = '┆'
" let g:indentLine_bgcolor_term = 234
let g:indentLine_bgcolor_gui = '#282A36'
" let g:indentLine_color_term = 234
" let g:indentLine_color_gui = '#425550'

" Neomake
call neomake#configure#automake('w')
autocmd User NeomakeJobFinished echom printf('%s exited with %d', g:neomake_hook_context.jobinfo.maker.name, g:neomake_hook_context.jobinfo.exit_code)

" Vim pandoc
let g:pandoc#syntax#conceal#urls=1
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]

" Vimwiki
au FileType vimwiki set syntax=pandoc
au FileType vimwiki set filetype=pandoc
let g:vimwiki_list = [{'path': '~/Dropbox/wiki/', 'index': 'main', 'ext': '.md', 'syntax': 'markdown'}]

"Vimtex
let g:vimtex_compiler_engine = 'lualatex'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_view_method = 'zathura'
" let g:vimtex_compiler_latexmk = { 
"     \ 'backend': 'nvim'
"     \ }

let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-lualatex',
    \ 'pdflatex'         : '-pdf',
    \ 'dvipdfex'         : '-pdfdvi',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}
let g:vimtex_mappings_enabled = 0

"VIm Startify
let g:startify_bookmarks = [ {'c': '~/Dropbox/wiki/main.md'}]
let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
