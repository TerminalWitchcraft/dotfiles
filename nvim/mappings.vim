inoremap jk <esc>
let mapleader=" "

" nmap <leader>y "*y
" nmap <leader>p "*p
" vmap <leader>y "*y
" vmap <leader>p "*p
" 
" nmap <leader>Y "+y
" nmap <leader>P "+p
" vmap <leader>Y "+y
" vmap <leader>P "+p


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" For terminal use
tnoremap <C-j><C-k> <C-\><C-N>

tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
" inoremap <C-h> <C-\><C-N><C-w>h
" inoremap <C-j> <C-\><C-N><C-w>j
" inoremap <C-k> <C-\><C-N><C-w>k
" inoremap <C-l> <C-\><C-N><C-w>l
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l



" Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)


" Vim Sneak
nmap <Leader>s <Plug>Sneak_s
nmap <Leader>S <Plug>Sneak_S
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T


"  Ctrlp vim
"nmap <Leader>f :CtrlP<CR>
"nmap <Leader>b :CtrlPBuffer<CR>
"nmap <Leader>t :CtrlPBufTag<CR>
"nmap <Leader>T :CtrlPBufTagAll<CR>
"nmap <Leader>m :CtrlPMRU<CR>
"nmap <Leader>c :CtrlPChange<CR>
"nmap <Leader>C :CtrlPChangeAll<CR>
"nmap <Leader>u :CtrlPUndo<CR>
"nmap <Leader>l :CtrlPLine<CR>
"nmap <Leader>g :Grepper -buffer <cr>
"nmap <Leader>G :Grepper <cr>

" Denite
"nmap <Leader>a :Denite -buffer-name=colorscheme -resume colorscheme<CR>
"nmap <Leader>f :Denite -buffer-name=file_rec -resume -refresh file_rec<CR>
"nmap <Leader>F :Denite -buffer-name=file -resume -refresh file<CR>
"nmap <Leader>d :Denite -buffer-name=directory_rec -resume -refresh directory_rec<CR>
"nmap <Leader>b :Denite buffer<CR>
"nmap <Leader>t :Denite outline<CR>
"nmap <Leader>T :DeniteProjectDir outline<CR>
"nmap <Leader>m :Denite file_mru<CR>
"nmap <Leader>M :Denite directory_mru<CR>
"nmap <Leader>c :Denite command_history<CR>
"nmap <Leader>C :Denite change<CR>
"nmap <Leader>h :Denite command<CR>
"nmap <Leader>o :Denite -mode=normal menu <CR>
""nmap <Leader>u :CtrlPUndo<CR>
"nmap <Leader>l :Denite line<CR>
"nmap <Leader>g :Denite grep<cr>
"nmap <Leader>G :DeniteProjectDir grep<cr>


" Denite
nmap <Leader>a :Colors<CR>
nmap <Leader>f :FZF<CR>
nmap <Leader>F :FZF ~<CR>
"nmap <Leader>d :Denite -buffer-name=directory_rec -resume -refresh directory_rec<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>
nmap <Leader>m :History<CR>
nmap <Leader>M :History:<CR>
nmap <Leader>c :Commands<CR>
"nmap <Leader>C :Denite change<CR>
nmap <Leader>h :Helptags<CR>
"nmap <Leader>o :Denite -mode=normal menu <CR>
"nmap <Leader>u :CtrlPUndo<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>g :Rg<cr>
"nmap <Leader>G :DeniteProjectDir grep<cr>

"Neomake
nnoremap <F9> :Neomake<CR>

"Ipython
autocmd FileType python map <buffer> <Leader>r <Plug>(IPy-RunCell)
autocmd FileType python map <buffer> <Leader>R <Plug>(IPy-Run)
autocmd FileType python map <buffer> <Leader>q <Plug>(IPy-Terminate)
