
" slash-ESC to clear search
nnoremap /<esc> :let @/ = ""<return>

" Move up/down display lines, not physical lines
nnoremap j gj
nnoremap k gk

" Default spellcheck language: Br*tish english
set spelllang=en_gb
" Use :setlocal spell to activate for a buffer

" Start scrolling when the cursor is 10 or fewer
" lines away from top or bottom of screen
set scrolloff=10

" Use truecolor instead of limited color pallette
set notermguicolors

" Display a vertical column at 80 columns to remind u to not write long lines
set colorcolumn=80
" Set a color for colorcolumn
" (fallback to color 5 (purple) if truecolor is disabled
"hi ColorColumn ctermbg=5 guibg=#333344

" Different terminals use different value
" (ctermfg vs ctermbg) i think???
" maybe even different version of same terminal???
hi ColorColumn ctermfg=Gray ctermbg=Gray

set bg=dark

" Force terminal to run shell in login mode
set shell=$SHELL\ -l

" use X11 clipboard
set clipboard=unnamedplus

" alt-hjkl to move around splits in any mode
" (you can open new splits with ctrl-w s and ctrl-w v
" these are default keybinds)
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

" square brackets to switch tabs
:tnoremap <A-[> <C-\><C-N>gT
:inoremap <A-[> <C-\><C-N>gT
:nnoremap <A-[> gT
:tnoremap <A-]> <C-\><C-N>gt
:inoremap <A-]> <C-\><C-N>gt
:nnoremap <A-]> gt

" alt-m to open this buffer in new tab
:tnoremap <A-m> <C-\><C-N><C-w>s<C-w>T
:inoremap <A-m> <C-\><C-N><C-w>s<C-w>T
:nnoremap <A-m> <C-w>s<C-w>T

":tnoremap <Esc><Esc> <C-\><C-n>
:tnoremap <A-Esc> <C-\><C-n>
":inoremap <Esc><Esc> <C-\><C-n>
:inoremap <A-Esc> <C-\><C-n>
":nnoremap <Esc><Esc> <C-\><C-n>
:nnoremap <A-Esc> <C-\><C-n>

function! Asplit()
	if winwidth(0) > (winheight(0) * 2)
		:vsplit
	else
		:split
	endif
endfunction
function! NAsplit()
	if winwidth(0) > (winheight(0) * 2)
		:split
	else
		:vsplit
	endif
endfunction
command! Asplit call Asplit()
command! NAsplit call NAsplit()

" New splits open to the right and below
" (the default is left and above, wtf would you want that!?)
set splitright
set splitbelow

:nnoremap <A-s> :Asplit<cr>
:nnoremap <A-v> :NAsplit<cr>
:nnoremap <A-t> :Asplit<cr>:term<cr>i
:nnoremap <A-w> :tabedit<cr>:term<cr>i

:tnoremap <A-s> <C-\><C-N>:Asplit<cr>
:tnoremap <A-v> <C-\><C-N>:NAsplit<cr>
:tnoremap <A-t> <C-\><C-N>:Asplit<cr>:term<cr>i
:tnoremap <A-w> <C-\><C-N>:tabedit<cr>:term<cr>i

:inoremap <A-s> <C-\><C-N>:Asplit<cr>
:inoremap <A-v> <C-\><C-N>:NAsplit<cr>
:inoremap <A-t> <C-\><C-N>:Asplit<cr>:term<cr>i
:inoremap <A-w> <C-\><C-N>:tabedit<cr>:term<cr>i

" Press space in normal mode to open a filepicker (requires fzf)
:nnoremap <space> :FzfFilePicker<cr>


" remember the chan id (buffer id) of the last terminal buffer
augroup Terminal
	au!
	au TermOpen * let g:last_term_id = b:terminal_job_id
augroup END


" These functions send different keystrokes
" to the last opened terminal.
" If you want to find out the escape sequence for weird characters
" like ctrl-c, the protocol is like this:
"
" 1. Run `bash` (busybox ash will not work for this)
" 2. Type `echo -n "" | xxd` but don't press enter
" 3. Put your cursor in-between the quotes
" 4. Press and release Ctrl-V to tell bash to not handle the next key sequence
" 5. Press and release they key combination you're interested in
" 6. Press enter
" 7. Look at the hexdump output and construct the escape sequences accordingly
"
function! TermSendUpEnter()
	call chansend(g:last_term_id, "\x1b\x4f\x41\<cr>")
endfunction
command! TermSendUpEnter call TermSendUpEnter()

function! TermSendCtrlC()
	call chansend(g:last_term_id, "\x03")
endfunction
command! TermSendCtrlC call TermSendCtrlC()

function! TermSendCtrlD()
	call chansend(g:last_term_id, "\x04")
endfunction
command! TermSendCtrlD call TermSendCtrlD()

let g:findfiles='find ./
\	-name ".vscode" -prune -o
\	-name ".cargo" -prune -o
\	-path "**/.git/objects" -prune -o
\	-name "_minted*" -prune -o
\	-name "__pycache__" -prune -o
\	-name "__MACOSX" -prune -o
\	-name "venv*" -prune -o
\	-name "dist" -prune -o
\	-name "build" -prune -o
\	-name ".Trash*" -prune -o
\	-name "*RECYCLE.BIN*" -prune -o
\	-name "System Volume Information" -prune -o
\	-name "*.egg-info" -prune -o
\	-name "*.*cache" -prune -o
\	-not -name "*.obsession~"
\	-not -name "*.png"
\	-not -name "*.ppm"
\	-not -name "*.xcf"
\	-not -name "*.jpg"
\	-not -name "*.jpeg"
\	-not -name "*.webp"
\	-not -name "*.avif"
\	-not -name "*.jxl"
\	-not -name "*.ogg"
\	-not -name "*.zip"
\	-not -name "*.pyo"
\	-not -name "*.pyc"
\	-not -name "*.pyd"
\	-not -name "*.sw*"
\	-not -name "*.rdb"
\	-not -name "*.cf"
\	-not -name "*.o"
\	-not -name "*.vcd"
\	-not -name "*.aux"
\	-not -name "*.bbl"
\	-not -name "*.blg"
\	-not -name "*.fdb_latexmk"
\	-not -name "*.fls"
\	-not -name "*.run.xml"
\	-not -name "*.gz"
\	-not -name "*.bcf"
\	-not -name "*.out"
\	-not -name ".DS_Store"
\	-print
\ '


function! FzfFilePicker()
	" Run fzf to select a file
	let l:file = fzf#run(fzf#wrap({
				\ 'source': g:findfiles,
				\ 'sink': 'edit',
				\ 'options': '--preview "cat {}"'
				\ }))

	" Check if a file was selected
	if !empty(l:file)
		execute 'edit' l:file
	endif
endfunction

command! FzfFilePicker call FzfFilePicker()

""nnoremap <Leader>f :call FzfFilePicker()<CR>

"function! FilepickerVimwiki()
"	term choice=$(cd ~/vimwiki && find . -type f | fzf | sed 's|^./||;s|\.wiki$||' ); [ -n "$choice" ] && nvim --server "$NVIM" --remote-send "<C-\><C-n>\ww<Esc>:VimwikiGoto $choice<cr>"
"endfunction
"command! FilepickerVimwiki call FilepickerVimwiki()

"let g:vimwiki_list = [{'diary_frequency': 'weekly',}]


" MUST BE PRESENT, NOT AUTOCREATED
"
function! WikiRoot()
	let l:local = finddir('wiki', ';./')
	return !empty(l:local) ? l:local : '~/wiki/notes'

	"let l:local = findfile('.wiki.vim', ';./')
	"return !empty(l:local) ? './' : '~/wiki/notes'
endfunction

let g:wiki_root = 'WikiRoot'
"let g:wiki_root = '~/wiki/notes'

let g:wiki_journal = {'frequency': 'weekly', 'date_format': {'weekly': '%Y-%m-%d'}, 'root': '~/wiki/journal'}

let g:wiki_select_method = {
			\ 'pages': function('wiki#fzf#pages'),
			\ 'tags': function('wiki#fzf#tags'),
			\ 'toc': function('wiki#fzf#toc'),
			\ 'links': function('wiki#fzf#links'),
			\}

nnoremap <F4><space> <C-\><C-N>:WikiPages<CR>
nnoremap <F4>j <C-\><C-N>:WikiJournal<CR>


" Start server and export socket path to `$NVIM`.
" Shouldn't be required, nvim usually does this automatically
" let $NVIM = serverstart()


"function! BreakHere()
"    s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
"    call histdel("/", -1)
"endfunction
"
"nnoremap g <C-q> :<C-u>call BreakHere()<CR>

"vnoremap g <C-q> :s/\. /.\r/g | s/, /,\r/g<CR>
"vnoremap g <C-q> :s/\. /.\r/g<CR>

" Edit files (e.g. git commit message) directly in running nvim
" instead of spawning nested nvim
" make sure shell rc file doesn't override this
"let $EDITOR='nvim --server "$NVIM" --remote-tab-silent'

let g:typst_cmd = '/bin/false'

" Disable git pager since nvim itself makes for a darn good pager
"let $GIT_PAGER = 'head -n 20'

autocmd FileType html setlocal noexpandtab tabstop=2 shiftwidth=2 softtabstop=2

""""""""""""""""""""""""""""""""""""""""

function! UpEnter()
    " Get the current tab page number
    let current_tab = tabpagenr()

    " Iterate through all windows in the current tab
    for winnr in range(1, winnr('$'))
        " Check if the window is a terminal buffer
        "if &buftype[winnr] == 'terminal'
		if getwinvar(winnr, '&buftype', 'ERROR') ==# 'terminal'
            " Switch to the terminal window
            execute winnr . 'wincmd w'

            " Send <Up Arrow> and <Return> keys to the terminal
            "normal! \<Up>\<CR>
			"call nvim_feedkeys(nvim_replace_termcodes("i<Up><Return><C-\\><C-n><c-w><c-p>", 1, 0, 1), 't', 1)
			call nvim_feedkeys(nvim_replace_termcodes("i", 1, 0, 1), 't', 1)
			call sleep(10)
			call nvim_feedkeys(nvim_replace_termcodes("<Up>", 1, 0, 1), 't', 1)
			call sleep(10)
			call nvim_feedkeys(nvim_replace_termcodes("<Return>", 1, 0, 1), 't', 1)
			call sleep(10)
			call nvim_feedkeys(nvim_replace_termcodes("<C-\\><C-n><c-w><c-p>", 1, 0, 1), 't', 1)
			"execute 'wincmd w'
            return
        endif
    endfor

    " If no terminal window found, display an error message
    echo "No terminal window found in the current tab."
endfunction

nnoremap <Leader><Leader> <esc>:call UpEnter()<CR>

function! PasteRegister5ToTerminal()
  " Save current window
  let l:cur_win = win_getid()

  " Loop through windows in the tab
  for l:win in range(1, winnr('$'))
    if getbufvar(winbufnr(l:win), '&buftype') ==# 'terminal'
      " Switch to the terminal window
      exec l:win . 'wincmd w'

      " Send the contents of register 5 as terminal input
      call chansend(b:terminal_job_id, getreg('5') . "\n")

      " Go back to original window
      call win_gotoid(l:cur_win)
      return
    endif
  endfor

  echo "No terminal buffer found in current tab."
endfunction

" Optional: map it to a key (e.g. <Leader>p)
"nnoremap <Leader><Leader> "5yy<esc>:CleanReg5<CR>:call PasteRegister5ToTerminal()<CR>

function! StripIndentFromRegister5()
  " Get the contents of register 5 as a string
  let l:reg = getreg('5')

  " Split into lines
  let l:lines = split(l:reg, "\n")

  " Remove leading whitespace from each line
  for i in range(len(l:lines))
    let l:lines[i] = substitute(l:lines[i], '^\s\+', '', '')
  endfor

  " Join lines back into a string
  let l:new_reg = join(l:lines, "\n")

  " Put the cleaned string back into register 5
  call setreg('5', l:new_reg)
endfunction

" Optional: map to a command
command! CleanReg5 call StripIndentFromRegister5()

" alt-e for netrw

nnoremap <A-e> :Explore<CR>
inoremap <A-e> <C-\><C-N>:Explore<CR>
tnoremap <A-e> <C-\><C-N>:Explore<CR>

command! -nargs=0 -bar Autosave autocmd TextChanged,TextChangedI <buffer> silent write

for f in split(glob('~/.config/nvim/init.vim.d/*.vim'), '\n')
    exe 'source' f
endfor

