if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/hotshot/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/hotshot/.local/share/dein')
  call dein#begin('/home/hotshot/.local/share/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/hotshot/.local/share/dein/repos/github.com/Shougo/dein.vim')

  " Always loaded
  " For UI
  "call dein#add('mhartington/oceanic-next')
  call dein#add('morhetz/gruvbox')
  "call dein#add('rakr/vim-one')
  call dein#add('vim-airline/vim-airline')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('gcmt/taboo.vim')

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  "call dein#add('Shougo/deol.nvim')
  call dein#add('jiangmiao/auto-pairs')
  "call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('haya14busa/incsearch.vim')
  call dein#add('justinmk/vim-sneak')
  call dein#add('justinmk/vim-dirvish')
  call dein#add('tpope/vim-surround')
  "call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('neomake/neomake')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('fmoralesc/vim-pad')
  call dein#add('roxma/nvim-completion-manager')
  call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })
  "call dein#add('Shougo/denite.nvim')
  "call dein#add('nixprime/cpsm', {'build': 'PY3=ON ./install.sh'})
  "call dein#add('BurningEther/iron.nvim')
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) 
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  " Optional
  call dein#add('bfredl/nvim-ipy', {'on_ft':'python'})
  call dein#add('haya14busa/dein-command.vim', {'on_cmd': 'Dein'})
  call dein#add('tpope/vim-fugitive', {'on_cmd': 'Gstatus', 'augroup': 'fugitive', 'on_source': 'gitv'})
  call dein#add('airblade/vim-gitgutter', {'depends': 'fugitive', 'on_source': 'fugitive'})
  call dein#add('gregsexton/gitv', {'on_cmd': 'Gitv', 'depends': 'fugitive'})
  "call dein#add('zchee/deoplete-jedi', {'on_ft': 'python'})
  "call dein#add('sebastianmarkow/deoplete-rust', {'on_ft': 'rust'})
  " call dein#add('mattn/webapi-vim', {'on_ft': 'rust'})
  " call dein#add('rust-lang/rust.vim', {'on_ft': 'rust'})
  " call dein#add('racer-rust/vim-racer',{'on_ft': 'rust'} )
  " call dein#add('roxma/nvim-cm-racer',{'on_ft': 'rust'} )
  "call dein#add('mhinz/vim-grepper', {'on_cmd': ['Grepper', '<plug>(GrepperOperator)']})

  " For text writing and notes!
  call dein#add('vim-pandoc/vim-pandoc', {'name': 'vim_pandoc', 'on_source': 'pandoc-after'})
  call dein#add('dhruvasagar/vim-table-mode', {'on_cmd': 'TableModeToggle'})
  call dein#add('lervag/vimtex', {'on_ft': ['plaintex', 'tex']})
  call dein#add('vim-pandoc/vim-pandoc-syntax', {'depends':'vim_pandoc'})
  call dein#add('vim-pandoc/vim-pandoc-after', {'depends': 'vim_pandoc'})
  call dein#add('junegunn/goyo.vim', {'on_cmd': 'Goyo'})
  call dein#add('ron89/thesaurus_query.vim',{'on_ft': ['pandoc', 'text']})
  call dein#add('rhysd/vim-grammarous',{'on_ft':['pandoc', 'text']})
  call dein#add('junegunn/limelight.vim', {'on_cmd': 'Limelight'})
  " You can specify revision/branch/tag.

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
" if dein#check_install()
"   call dein#install()
" endif

"-------------------Load files-----------------
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/general.vim
