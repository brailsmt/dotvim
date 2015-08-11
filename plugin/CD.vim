function! CD()
	let cwd = substitute(expand('%:p:h'), ' ', '\\ ', 'g')
    execute ":cd " . cwd
endfunction
command! CD call CD ()
