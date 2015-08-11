"{{{
function! GetFirstLineWithChars()
	let numlines_folded = v:foldend - v:foldstart + 1
	let line_num = 0
	let charline = matchstr(getline(v:foldstart), '[<a-zA-Z0-9*][^{}]*')
	while strlen(charline) == 0
		let line_num = line_num + 1
		let charline = matchstr(getline(v:foldstart + line_num), '[<a-zA-Z0-9*][^{}]*')
	endw
	let return_str="[".numlines_folded."	lines	folded]:		".charline
	return return_str
endfunction
"}}}
