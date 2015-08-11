

"if exists('*SearchOpen')
"	finish
"endif
""{{{
"function! SearchOpen(fname) 
"ruby <<END
"    fname = VIM.evaluate("a:fname")
"    glob = "src/**/#{fname}"
"	if not File.exists?('src')
"		glob = "*/"+glob
"	end
"    files = Dir[glob]
"    if files.size == 0 and not File.exists?('src')
"		glob = "../" + glob
"		files = Dir[glob]
"    end
"    a = 0;
"    opts = files.map { |file| "\"#{a; a+=1}) #{file}\"" }
"    choice = VIM.evaluate("inputlist([\"Select the file to open:\", #{opts.join(", ")}])").to_i
"    if choice > 0
"        VIM.command(":e #{files[choice-1]}")
"    end
"END
"endfunction
""}}}
""{{{
"function! SearchOpenSplit(fname) 
"ruby <<END
"    fname = VIM.evaluate("a:fname")
"    glob = "src/**/#{fname}"
"	if not File.exists?('src')
"		glob = "*/"+glob
"	end
"    files = Dir[glob]
"    if files.size == 0 and not File.exists?('src')
"		glob = "../" + glob
"		files = Dir[glob]
"    end
"    a = 0;
"    opts = files.map { |file| "\"#{a; a+=1}) #{file}\"" }
"    choice = VIM.evaluate("inputlist([\"Select the file to open:\", #{opts.join(", ")}])").to_i
"    if choice > 0
"        VIM.command(":sp #{files[choice-1]}")
"    end
"END
"endfunction
""}}}
""{{{
"function! SearchMultOpen(fname) 
"ruby <<END
"    fname = VIM.evaluate("a:fname")
"    glob = "src/**/#{fname}"
"	if not File.exists?('src')
"		glob = "*/"+glob
"	end
"    files = Dir[glob]
"    if files.size == 0 and not File.exists?('src')
"		glob = "../" + glob
"		files = Dir[glob]
"    end
"
"    if files.size > 0
"        a = 0;
"        opts = files.map { |file| "   #{a+=1}) #{file}" }
"        choice = VIM.evaluate("input(\"Select the file(s) to open:\n#{opts.join("\n")}\nEnter files to open (seperate multiple files with spaces or commas)\n[<enter> aborts]: \", \"\")")
"        if choice != ""
"            fnames = Array.new
"            choice.split(/[\s,]/).each { |n|
"                if n =~ /^\d/
"                    fnames << files[n.to_i-1]
"                end
"            }
"            if fnames.size > 0
"                VIM.command("args #{fnames.join ' '}")
"            else
"                VIM::message("Invalid input")
"            end
"        end
"    else
"        VIM::message("No files matching #{glob}")
"    end
"END
"endfunction
""}}}
""{{{
"function! SearchMultOpenSplit(fname) 
"ruby <<END
"    fname = VIM.evaluate("a:fname")
"    glob = "src/**/#{fname}"
"	if not File.exists?('src')
"		glob = "*/"+glob
"	end
"    files = Dir[glob]
"    if files.size == 0 and not File.exists?('src')
"		glob = "../" + glob
"		files = Dir[glob]
"    end
"    if files.size > 0
"        a = 0;
"        opts = files.map { |file| "   #{a+=1}) #{file}" }
"        choice = VIM.evaluate("input(\"Select the file(s) to open:\n#{opts.join("\n")}\nEnter files to open (seperate multiple files with spaces or commas)\n[<enter> aborts]: \", \"\")")
"        if choice != ""
"            fnames = Array.new
"            choice.split(/[\s,]/).each { |n|
"                if n =~ /^\d/
"                    fnames << files[n.to_i-1]
"                end
"            }
"            if fnames.size > 0
"                VIM.command("sp")
"                VIM.command("args #{fnames.join ' '}")
"            else
"                VIM::message("Invalid input")
"            end
"        end
"    else
"        VIM::message("No files matching #{glob}")
"    end
"END
"endfunction
""}}}
"nmap <silent> gf  :call SearchMultOpen("<c-r>=expand('<cword>')<cr>.java")<cr>
"nmap <silent> gff :call SearchMultOpen("<c-r>=expand('<cWORD>')<cr>.java")<cr>
"nmap <silent> gs  :call SearchMultOpenSplit("<c-r>=expand('<cword>')<cr>.java")<cr>
"nmap <silent> gss :call SearchMultOpenSplit("<c-r>=expand('<cWORD>')<cr>.java")<cr>


""{{{
"function! FindFiles(fname)
"	let _files = []
"	if glob('src') == ''
"		let _files += split(glob("*/src/**/".a:fname), "\n")
"	else
"		let _files += split(glob("src/**/".a:fname), "\n")
"	endif
"
"	if len(_files) == 0
"		let _files = split(glob("../*/src/**/".a:fname), "\n")
"	endif
"
"	if len(_files) == 0
"		return []
"	endif
"
"	let idx = 0
"	for _file in _files
"		let _files[idx] = " " . (idx+1) . ") " . _file
"		let idx += 1
"	endfor
"
"	return _files
"endfunction
""}}}
""{{{
"function! ChooseSingleFile(fname)
"	let choices   = ["Select the file to open:"]
"	let choices   = choices + FindFiles(a:fname)
"	if len(choices) > 0
"		let chosenidx = inputlist(choices)
"
"		if chosenidx != 0
"			let file2edit = split(choices[chosenidx], '\s*\d*)\s*')[0]
"			return file2edit
"		else
"			return 'null'
"		endif
"	else
"		return 'null'
"	endif
"endfunction
""}}}
""{{{
"function! ChooseMultipleFiles(fname)
"	let prompt = "Select the file(s) to open:\n"
"	let choices = FindFiles(a:fname)
"	if len(choices) > 0
"
"		let prompt .= join(choices, "\n")
"		let prompt .= "\nEnter files to open (seperate multiple files with spaces or commas)\n[<enter> aborts]: "
"
"		let chosenStr = input(prompt)
"
"		if chosenStr != ''
"			let files2edit = []
"			for l:n in split(chosenStr, '\s\s*')
"				let l:n = substitute(l:n, ")\s*", '', '')
"				let files2edit = add(files2edit, substitute(choices[l:n-1], '\s*\d*)\s*', '', ''))
"			endfor
"			return join(files2edit, ' ')
"		else
"			return 'null'
"		endif
"	else
"		return 'null'
"	endif
"endfunction
""}}}
"
""{{{
"function! SearchEdit(fname)
"	let path = ChooseSingleFile(a:fname)
"	if path != 'null'
"		execute 'e '.path
"	endif
"endfunction
""}}}
""{{{
"function! SearchSplit(fname)
"	let path = ChooseSingleFile(a:fname)
"	if path != 'null'
"		execute 'sp '.path
"	endif
"endfunction
""}}}
""{{{
"function! SearchOpenMultiple(fname)
"	let paths = ChooseMultipleFiles(a:fname)
"	if paths != 'null'
"		execute 'args '.paths
"	endif
"endfunction
""}}}
""{{{
"function! SearchSplitMultiple(fname)
"	let paths = ChooseMultipleFiles(a:fname)
"	if paths != 'null'
"		execute 'sp'
"		execute 'args '.paths
"	endif
"endfunction
""}}}
"
"nmap <silent> gf  :call SearchOpenMultiple("<c-r>=expand('<cword>')<cr>.java")<cr>
"nmap <silent> gff :call SearchOpenMultiple("<c-r>=expand('<cWORD>')<cr>.java")<cr>
"nmap <silent> gs  :call SearchSplitMultiple("<c-r>=expand('<cword>')<cr>.java")<cr>
"nmap <silent> gss :call SearchSplitMultiple("<c-r>=expand('<cWORD>')<cr>.java")<cr>

" vim: fdm=marker
