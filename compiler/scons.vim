if(exists("current_compiler"))
	finish
endif
let current_compiler = "scons"

set errorformat=%Dscons:\ Entering\ directory\ `%f',
			\%f:%l:\ %m,
			\%f:%l:%m

set makeprg=scons\ -u
