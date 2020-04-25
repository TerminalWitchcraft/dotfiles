set nocompatible

call plug#begin('~/.local/share/nvim/plugged')

Plug 'psliwka/vim-smoothie'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'chaoren/vim-wordmotion'

Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'takac/vim-hardtime'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Yggdroot/indentLine'
Plug 'ianding1/leetcode.vim'
" Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'
Plug 'TaDaa/vimade'
Plug 'mbbill/undotree'
Plug 'wakatime/vim-wakatime'
Plug 'mcchrish/nnn.vim'

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" TODO replace fzf with skim
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'

" TODO review lexima.vim for future change
Plug 'jiangmiao/auto-pairs'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

Plug 'liuchengxu/vista.vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-github'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/float-preview.nvim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" Plug 'ncm2/ncm2-racer', { 'for': 'rust' }
" Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
" Plug 'ncm2/ncm2-jedi', {'for': 'python' }
" Plug 'ncm2/ncm2-pyclang', {'for': ['c', 'cpp']}
" Plug 'ncm2/ncm2-go'
" Plug 'fatih/vim-go'
" Plug 'sebdah/vim-delve'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'chemzqm/vim-jsx-improve'
" Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-fugitive'
Plug 'bfredl/nvim-ipy', {'for': 'python'}
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
Plug 'alpertuna/vim-header'
Plug 'junegunn/goyo.vim'
" Plug 'pgdouyon/vim-evanesco'
" Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-unimpaired'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()

set rnu
set showtabline=2
" set clipboard+=unnamed
" set cursorline
set splitbelow
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
set nobackup
set nowritebackup
set cmdheight=1
set shortmess+=c
set signcolumn=yes
set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m
set completeopt=noinsert,menuone,noselect
set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
" set tabstop=4
" set expandtab
" set softtabstop=4
" set shiftwidth=4
" colorscheme base16-eighties
" let g:nord_italic = 1
" let g:nord_underline = 1
" let g:nord_italic_comments = 1
" let g:nord_comment_brightness = 16
" let g:nord_cursor_line_number_background = 1
colorscheme palenight

let mapleader=" "
nnoremap <silent> <esc> :nohlsearch<cr> <esc>
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
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
" tnoremap jk <C-\><C-N>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

nnoremap tj :tabprevious<CR>
nnoremap tk :tabnext<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<CR>

nmap <Leader>a :History<CR>
nmap <Leader>f :FZF<CR>
nmap <Leader>F :FZF ~<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>u :UndotreeToggle<CR>
nmap <Leader>U :UndotreeFocus<CR>
nmap <Leader>v :Vista!!<CR>
nmap <Leader>V :Vista focus<CR>
" nmap <Leader>t :BTags<CR>
nmap <Leader>t :call LanguageClient_textDocument_documentSymbol()<CR>
nmap <Leader>T :call LanguageClient_workspace_symbol()<CR>
nmap <Leader>m :Marks<CR>
nmap <Leader>M :History:<CR>
nmap <Leader>c :Commands<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>g :Rg<cr>
" nmap <Leader>p :call LanguageClient#textDocument_
" augroup mail_trailing_whitespace " {
"     autocmd!
"     autocmd FileType mail setlocal formatoptions+=w
" augroup END " }
inoremap <c-c> <ESC>
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("<CR>", 'n') : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif




nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'
" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
" inoremap <silent> <expr> <C-k> ncm2_ultisnips#expand_or("/<CR>", 'n')
command! -nargs=* Term 10split | terminal <args>
command! -nargs=* Vterm vsplit | terminal <args>
" autocmd CompleteDone * silent! pclose!
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2

let g:LanguageClient_virtualTextPrefix=" ┆ [LSP] => "
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rust-analyzer'],
    \ 'python': ['pyls'],
    \ 'go': ['gopls'],
    \ 'javascript': ['javascript-typescript-langserver'],
    \ }

" c-j c-k for moving in snippet
let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler
  \| autocmd BufLeave <buffer> set laststatus=2 ruler
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
  \   'rg --column --line-number --no-heading --color=always --max-filesize=2M --maxdepth=40 --threads 4 --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)
let $FZF_DEFAULT_COMMAND = 'rg --files --no-messages --glob "!.git" --maxdepth=40'
let g:fzf_tags_command = 'ctags -x -R  --exclude="target/*" --exclude="*.json"'
command! -bang -nargs=* BTags :call fzf#vim#buffer_tags(<q-args>, {'options': ['--no-reverse', '--prompt', 'TAGS ❯❯❯ ']}, <bang>0)
command! -bang -nargs=* Tags :call fzf#vim#tags(<q-args>, {'options': ['--no-reverse', '--prompt', 'TAGS ❯❯❯ '], 'source': 'ctags -x -R  --exclude="target/*" --exclude="*.json"'}, <bang>0)


" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
function LightlineNeomake()
    return '%{neomake#statusline#LoclistStatus()}'
endfunction

let g:lightline = {
          \ 'enable': {
            \ 'statusline': 1,
            \ 'tabline': 1
            \ },
	 \ 'colorscheme': 'palenight',
         \ }

let g:lightline.active = {
   \ 'left': [ [ 'mode', 'paste' ],
   \           [ 'gitbranch', 'readonly', 'absolutepath', 'modified', 'method'] ],
   \ 'right': [ [ 'lineinfo' ],
   \            [ 'percent' ],
   \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
let g:lightline.inactive = {
   \ 'left': [ [ 'filename' ] ],
   \ 'right': [ [ 'lineinfo' ],
   \            [ 'percent' ] ] }
let g:lightline.tabline = {
   \ 'left': [ [ 'buffers' ] ] }

let g:lightline.tab = {
    \ 'active': [ 'tabnum', 'filename', 'modified' ],
    \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }

let g:lightline.component_expand = {
    \ 'buffers': 'lightline#bufferline#buffers',
    \ }
let g:lightline.component_type = {
    \   'buffers': 'tabsel',
    \ }
let g:lightline.component_function = {
    \   'bufferinfo': 'lightline#buffer#bufferinfo',
    \   'filetype': 'MyFiletype',
    \   'fileformat': 'MyFileformat',
    \   'gitbranch': 'fugitive#head',
    \   'method': 'NearestMethodOrFunction',
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

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
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




" sneak.vim
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
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
	\,a:blinkwait700-blinkoff1000-blinkon1000-Cursor/lCursor
	\,sm:block-blinkwait175-blinkoff150-blinkon175

" let g:hardtime_default_on = 1

let g:gen_tags#ctags_auto_gen = 1
let g:tmuxline_powerline_separators = 0

" Vim indentline/
let g:indentLine_enabled = 1
let g:indentLine_fileType = ['c', 'cpp', 'rust', 'python', 'javascript']
" let g:indentLine_setColors = 0
" let g:indentLine_concealcursor = 'c'
let g:indentLine_leadingSpaceChar = ' '
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_char = '┆'
" let g:indentLine_bgcolor_term = 234
let g:indentLine_bgcolor_gui = '#2e3440'
" let g:indentLine_color_term = 234
" let g:indentLine_color_gui = '#425550'


" Vim pandoc
let g:pandoc#syntax#conceal#urls=1
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]

" Vimwiki
" au FileType vimwiki set syntax=pandoc
" au FileType vimwiki set filetype=pandoc
" let g:vimwiki_list = [{'path': '~/Dropbox/wiki/', 'index': 'main', 'ext': '.md', 'syntax': 'markdown'}]
" nmap <Leader>wq <Plug>VimwikiVSplitLink
" nmap <Leader>we <Plug>VimwikiSplitLink

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
let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim'}, {'m': '~/Dropbox/wiki/main.md'}]
let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
" let g:startify_session_before_save = [
" 	\ 'TagbarClose',
" 	\ ]

"Vim Header
let g:header_field_author = 'Hitesh Paul'
let g:header_field_author_email = 'git@hiteshpaul.com'
let g:header_auto_add_header = 0
let g:header_field_timestamp_format = '%d.%m.%Y'

"Vim C/C++
let g:ncm2_pyclang#library_path = '/usr/lib'


"Nvimipy
let g:nvim_ipy_perform_mappings = 0
autocmd filetype python map <silent> <Leader>kr <Plug>(IPy-RunCell)
autocmd filetype python map <silent> <Leader>kc <Plug>(IPy-Run)
autocmd filetype python map <silent> <Leader>kq <Plug>(IPy-Terminate)
autocmd filetype python map <silent> <Leader>kg <Plug>(IPy-Interrupt)





" Leetcode
let g:leetcode_browser='firefox'
let g:leetcode_solution_filetype='python3'


"Vimade
let g:vimade = {}
let g:vimade.fadelevel = 0.7
let g:vimade.enablesigns = 1

"Undotree
let g:undotree_WindowLayout=2

"Vista.vim
let g:vista_default_executive = 'lcn'
let g:vista_fzf_preview = ['right:50%']
let g:vista_echo_cursor_strategy = "both"
let g:vista_highlight_whole_line=1

"nnn.vim
let g:nnn#command = 'nnn -d -H -R'
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

"Vim wordmotion
let g:wordmotion_prefix = '<Bslash>'

