
" slash-ESC to clear search
nnoremap /<esc> :let @/ = ""<return>

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

" Looks good in both dark and light terminal colors
set bg=light

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

:tnoremap <A-[> <C-\><C-N>gT
:inoremap <A-[> <C-\><C-N>gT
:nnoremap <A-[> gT
:tnoremap <A-]> <C-\><C-N>gt
:inoremap <A-]> <C-\><C-N>gt
:nnoremap <A-]> gt

function! Asplit()
	if winwidth(0) > (winheight(0) * 2)
		:vsplit
	else
		:split
	endif
endfunction
command! Asplit call Asplit()

" New splits open to the right and below
" (the default is left and above, wtf would you want that!?)
set splitright
set splitbelow

"" hit backslash t to open a terminal in a split
":nnoremap <leader>t :vsplit<cr>:term<cr>i
"" hit backslash w to open a terminal in a new window
":nnoremap <leader>w :tabedit<cr>:term<cr>i
"" hit backslash twice to run previous command in the last opened terminal

:nnoremap <A-s> :Asplit<cr>
:nnoremap <A-t> :Asplit<cr>:term<cr>i
:nnoremap <A-w> :tabedit<cr>:term<cr>i

:nnoremap <A-s> <C-\><C-N>:Asplit<cr>
:tnoremap <A-t> <C-\><C-N>:vsplit<cr>:term<cr>i
:tnoremap <A-w> <C-\><C-N>:tabedit<cr>:term<cr>i

:inoremap <A-s> <C-\><C-N>:Asplit<cr>
:inoremap <A-t> <C-\><C-N>:vsplit<cr>:term<cr>i
:inoremap <A-w> <C-\><C-N>:tabedit<cr>:term<cr>i



" hit backslash twice to run previous command in the last opened terminal
:nnoremap <leader><leader> :TermSendUpEnter<cr>
" hit backslash x to send ctrl-c to the last opened terminal
:nnoremap <leader>x :TermSendCtrlC<cr>
" hit backslash X to send ctrl-d to the last opened terminal
:nnoremap <leader>X :TermSendCtrlD<cr>
" Press space in normal mode to open a filepicker (requires fzf)
:nnoremap <space> :FzfFilePicker<cr>

" Press <leader>space in normal mode to open a filepicker for vimwiki
" (requires fzf)
:nnoremap <leader><space> :FilepickerVimwiki<cr>i


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
	let l:file = fzf#run({
				\ 'source': g:findfiles,
				\ 'sink': 'edit',
				\ 'options': '--preview "cat {}"'
				\ })

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
let g:wiki_root = '~/wiki/notes'

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


