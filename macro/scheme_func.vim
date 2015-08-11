"Vim function macro file
"Language:  Scheme (MIT-Scheme)
"Maintainer:  Michael Brailsford <brailsmt@yahoo.com>

"Instructions:  To enable this function you must include the following line in
"your ~/.vimrc file:  "runtime scheme.vim".  You should place this file in
"your $HOME/.vim directory (or any other directory that the "runtime" command
"checks, ":he runtime" for more info.  Now when you have done this, simply begin editing
"your scheme script and when you want to run it type "\\s" from insert mode 
"or "\s" from normal mode.  If you really, really want to, you can type 
" ":call RunScheme()" from the command prompt.

function! RunScheme()
	!scheme < % 2>&1 | tee %.results
	ped %.results
endfunction

au bufreadpre,bufnewfile *.scm imap \\s <c-[>:call RunScheme()<cr>
au bufreadpre,bufnewfile *.scm map \s :call RunScheme()<cr>
