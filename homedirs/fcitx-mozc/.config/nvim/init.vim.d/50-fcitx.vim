function! FcitxThingy()
	let g:fcitx5state=system("fcitx5-remote")
	" Disable the input method when exiting insert mode and save the state
	autocmd InsertLeave * :silent let fcitx5state=system("fcitx5-remote")[0] | silent !fcitx5-remote -c
	" 2 means that the input method was opened in the previous state, and the input method is started when entering the insert mode
	autocmd InsertEnter * :silent if fcitx5state == 2 | call system("fcitx5-remote -o") | endif
endfunction
command! -nargs=0 -bar FcitxThingy call FcitxThingy()
