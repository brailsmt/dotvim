"  This is a ruby plugin to make it so that I can enjoy my ts=4 and sw=4 and
"  still keep things the standard ts=2 and sw=2 for ruby source.
"  Maintainer:  Michael Brailsford  <brailsmt@yahoo.com>
"  Copyright:   2002 (c) Michael Brailsford

au! BufReadPost *.rb call Ruby_Open()
au! BufWritePre *.rb call Ruby_Save()
au! BufWritePost *.rb call Ruby_Open()

function! Ruby_Open()
	set ts=4
	set sw=4
endfunction

function! Ruby_Save()
	set ts=2
	set sw=2
endfunction
