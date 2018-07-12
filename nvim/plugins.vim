" vim-one
"
let g:one_allow_italics = 1


"Dim 
let g:diminactive_use_colorcolumn = 1
let g:diminactive_use_syntax = 0
let g:diminactive_enable_focus = 1
let g:diminactive_buftype_blacklist = ['nofile', 'nowrite', 'acwrite', 'quickfix', 'help']
let g:diminactive_filetype_blacklist = ['startify', 'qf']

" Dein.vim
"let g:dein#enable_notification = 1
let g:dein#install_progress_type = "echo"

"LSP
"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
"    \ 'python': ['pyls'],
"    \ }


" Incsearch
let g:incsearch#auto_nohlsearch = 1

" Vim Sneak
let g:sneak#s_next = 1
let g:sneak#label = 1
let g:sneak#prompt = '>>>'

"  Ctrlp vim
"let g:ctrlp_map = '<C-p>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_show_hidden = 1
""let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
""let g:cpsm_highlight_mode = 'detailed'
"let g:ctrlp_working_path_mode = 'rwa'
"let g:ctrlp_bufpath_mod = ':p:~'
"let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_use_caching = 0
"let g:ctrlp_clear_cache_on_exit = 1
"let g:ctrlp_cache_dir = $XDG_CACHE_HOME.'/ctrlp'
"let g:ctrlp_arg_map = 1
"let g:ctrlp_types = ['fil', 'buf', 'mru', 'bft']
"let g:ctrlp_switch_buffer = "ET"

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_auto_close_preview = 1
let g:deoplete#sources#rust#racer_binary='/home/hotshot/.local/share/cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = '/home/hotshot/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:deoplete#sources#rust#show_duplicates=0
let g:deoplete#sources#rust#documentation_max_height=20
"if executable('rustc')
"    " if src installed via rustup, we can get it by running 
"    " rustc --print sysroot then appending the rest of the path
"    let rustc_root = systemlist('rustc --print sysroot')[0]
"    let rustc_src_dir = rustc_root . '/lib/rustlib/src/rust/src'
"    if isdirectory(rustc_src_dir)
"        let g:deoplete#sources#rust#rust_source_path = rustc_src_dir
"    endif
"endif
"
"  ervandew/supertab 
"let g:SuperTabDefaultCompletionType = "<c-n>"

" Jedi vim
let g:jedi#completions_enabled = 0
let g:jedi#documentation_command = "K"
let g:jedi#goto_definitions_command = "gd"
let g:jedi#show_call_signatures = "1"
"let g:jedi#auto_vim_configuration = 0


"Oceanic-next
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
" let g:gruvbox_italic = 1
" let g:gruvbox_italicize_strings = 1
" "let g:gruvbox_improved_strings = 1
" let g:gruvbox_improved_warnings = 1

" Airline
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers=1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
"let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
"let g:airline#extensions#tabline#show_tabs = 0
" Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'"
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#buffers_label = 'Buffers'
let g:airline#extensions#tabline#tabs_label = 'Tabs'
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_skip_empty_sections = 1
let g:airline_theme='one'


"Taboo
let g:taboo_tabline = 0
let g:taboo_tab_format = " %f "
let g:taboo_renamed_tab_format = " [%l]%f "
"let g:taboo_unnamed_tab_label = "[Default]"

" Grepper
"runtime plugin/grepper.vim
"let g:grepper = {}
"let g:grepper.dir = 'repo,cwd,file'
"let g:grepper.tools = ['rg','ag', 'grep', 'git']
"let g:grepper.rg = {
"	\ 'grepprg': ' --smartcase --vimgrep',
"	\ }
""let g:grepper.rg.grepprg .= ' --smartcase --vimgrep'
"let &statusline .= ' %{grepper#statusline()}'

"  Vinegar
"autocmd FileType netrw nmap <buffer> <esc> <C-^>
"let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
"let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
"let g:netrw_liststyle= 3

"Neomake
" call neomake#configure#automake('nw')
" let g:neomake_open_list = 0


"Ale
let g:ale_completion_enabled = 0
let g:ale_keep_list_window_open = 1
let g:ale_list_window_size = 5
let g:ale_open_list = 1
let g:ale_linters = {'rust': ['rls']}
let g:ale_rust_rls_toolchain = "stable"
let g:ale_set_quickfix = 1 
let g:ale_set_loclist = 0


" Enable snipMate compatibility feature.
"let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='~/.local/share/dein/repos/github.com/honza/vim-snippets/snippets/'


" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
"if has('conceal')
"  set conceallevel=2 concealcursor=niv
"endif


" Writing tools
" Vim Pandoc
let g:pandoc#spell#enabled = 0
let g:pandoc#filetypes#handled = ["markdown", "rst", "extra", "textile", "html", "latex" ]
let g:pandoc#modules#disabled = ["spell", "folding"]
"let g:pandoc#formatting#mode = "A"
let g:pandoc#formatting#smart_autoformat_on_cursormoved = 1
let g:pandoc#syntax#conceal#urls = 1
"Pandoc after
let g:pandoc#after#modules#enabled = ["tablemode", "neosnippets"]

"Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"Vim-pad
let g:pad#set_mappings = 0
let g:pad#dir = "/home/hotshot/Dropbox/notes"
let g:pad#default_format = "pandoc"
let g:pad#local_dir = ".notes"
let g:pad#default_file_extension = ".md"
let g:pad#ignored_extensions = ["pdf", "odt", "docx", "doc", "html"]
let g:pad#window_height = 10
let g:pad#search_backend = "rg"
"let g:pad#rename_files = 0
let g:pad#title_first_line = 1
let g:pad#open_in_split = 0

"Vimtex
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:vimtex_view_method = "zathura"
"let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
"let g:deoplete#omni#input_patterns.tex = 
"        \   '\\(?:'
"        \  .   '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
"        \  .  '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
"        \  .  '|hyperref\s*\[[^]]*'
"        \  .  '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
"        \  .  '|(?:include(?:only)?|input)\s*\{[^}]*'
"        \  .')'

" zenburnTemp
"let g:gfm_syntax_enable_always = 0
"let g:gfm_syntax_enable_filetypes = ['pandoc']
"let g:gfm_syntax_emoji_conceal = 1

" Vim table-mode
let g:table_mode_corner='|'

" Vim Ipython
let g:nvim_ipy_perform_mappings = 0
let g:ipy_set_ft=1
let g:ipy_highlight=1
let g:ipy_truncate_input=5
"let g:ipy_shortprompt =1

"Denite.vim
"call denite#custom#option('_', 'prompt', '❯❯❯')
"call denite#custom#option('_', 'highlight_mode_insert', 'CursorLine')
"call denite#custom#option('_', 'highlight_mode_normal', 'WildMenu')
"call denite#custom#option('_', 'highlight_matched_range', 'None')
"call denite#custom#option('_', 'highlight_matched_char', 'Exception')
"call denite#custom#option('_', 'highlight_preview_line', 'None')
"call denite#custom#option('_', 'winheight', 10)
"call denite#custom#option('_', 'path', "./")
""10call denite#custom#option('_', 'resume', 'true')
""call denite#custom#option('_', 'winminheight', 3)
"call denite#custom#option('_', 'reversed', 'true')
"call denite#custom#option('_', 'auto_resize', 'true')
"call denite#custom#option('_', 'auto_accel', 'true')
""call denite#custom#option('_', 'mode', 'normal')
"call denite#custom#map(
"      \ 'insert',
"      \ '<C-j>',
"      \ '<denite:move_to_next_line>',
"      \ 'noremap'
"      \)
"call denite#custom#map(
"      \ 'insert',
"      \ '<C-k>',
"      \ '<denite:move_to_previous_line>',
"      \ 'noremap'
"      \)
"call denite#custom#source(
"\ 'file_rec', 'matchers', ['matcher_cpsm'])
"call denite#custom#var('file_rec', 'command',
"\ ['rg', '--files', '--glob', '!.git', '--color=never', '--maxdepth=40', '--max-filesize=2M'])
"call denite#custom#var('grep', 'command', ['rg', '--threads', '4'])
"call denite#custom#var('grep', 'default_opts',
"		\ ['--vimgrep', '--no-heading', '--max-filesize=2M', '--maxdepth=40', '--color=never'])
"call denite#custom#var('grep', 'recursive_opts', [])
"call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
"call denite#custom#var('grep', 'separator', ['--'])
"call denite#custom#var('grep', 'final_opts', [])
"let s:menus = {}
"let s:menus.zsh = {
"	\ 'description': 'Edit your import zsh configuration'
"	\ }
"let s:menus.zsh.file_candidates = [
"	\ ['zshrc', '~/.config/zsh/.zshrc'],
"	\ ['zshenv', '~/.zshenv'],
"	\ ]
"
"let s:menus.my_commands = {
"	\ 'description': 'Example commands'
"	\ }
"let s:menus.my_commands.command_candidates = [
"	\ ['Split the window', 'vnew'],
"	\ ['Open zsh menu', 'Denite menu:zsh'],
"	\ ]
"call denite#custom#var('menu', 'menus', s:menus)


" fzf
let g:fzf_layout = { 'window': '10split enew' }
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


command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --max-filesize=2M --maxdepth=40 --threads 4 '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
let $FZF_DEFAULT_COMMAND = 'rg --files --no-messages --glob "!.git" --maxdepth=40'
let g:fzf_tags_command = 'ctags -R --exclude=target/* --exclude="*.json"'
command! -bang -nargs=* BTags :call fzf#vim#buffer_tags(<q-args>, {'options': ['--no-reverse', '--prompt', 'TAGS ❯❯❯ ']}, <bang>0)
command! -bang -nargs=* Tags :call fzf#vim#tags(<q-args>, {'options': ['--no-reverse', '--prompt', 'TAGS ❯❯❯ ']}, <bang>0)
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
"let g:fzf_history_dir = '~/.local/share/fzf-history'
