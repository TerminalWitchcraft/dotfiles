if exists('g:GtkGuiLoaded')
  let g:GuiInternalClipboard = 1
  call rpcnotify(1, 'Gui', 'Font', 'Iosevka Light 10')
  call rpcnotify(1, 'Gui', 'FontFeatures', 'PURS, cv17')
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
  call rpcnotify(1, 'Gui', 'Option', 'Cmdline', 0)
endif
" hi NonText gui=NONE guifg=#657b83
