
"{{{
function! SearchOpen(fname) 
ruby <<END
    fname = VIM.evaluate("a:fname")
    glob = "**/#{fname}"
    files = Dir[glob]
    if files.size == 0
        while files.size == 0
            glob = "../" + glob
            files = Dir[glob]
        end
    end
    a = 0;
    opts = files.map { |file| "\"#{a; a+=1}) #{file}\"" }
    choice = VIM.evaluate("inputlist([\"Select the file to open:\", #{opts.join(", ")}])").to_i
    if choice > 0
        VIM.command(":e #{files[choice-1]}")
    end
END
endfunction
"}}}
"{{{
function! SearchOpenSplit(fname) 
ruby <<END
    fname = VIM.evaluate("a:fname")
    glob = "**/#{fname}"
    files = Dir[glob]
    if files.size == 0
        while files.size == 0
            glob = "../" + glob
            files = Dir[glob]
        end
    end
    a = 0;
    opts = files.map { |file| "\"#{a; a+=1}) #{file}\"" }
    choice = VIM.evaluate("inputlist([\"Select the file to open:\", #{opts.join(", ")}])").to_i
    if choice > 0
        VIM.command(":sp #{files[choice-1]}")
    end
END
endfunction
"}}}
"{{{
function! SearchMultOpen(fname) 
ruby <<END
    fname = VIM.evaluate("a:fname")
    fname.gsub!(/;/, '')
    glob = "src/**/#{fname}"
    files = Dir[glob]
    if files.size == 0
        glob = "../*/" + glob
        files = Dir[glob]
    end
    if files.size > 0
        a = 0;
        opts = files.map { |file| "   #{a+=1}) #{file}" }
        choice = VIM.evaluate("input(\"Select the file(s) to open:\n#{opts.join("\n")}\nEnter files to open (seperate multiple files with spaces or commas)\n[<enter> aborts]: \", \"\")")
        if choice != ""
            fnames = Array.new
            choice.split(/[\s,]/).each { |n|
                if n =~ /^\d/
                    fnames << files[n.to_i-1]
                end
            }
            if fnames.size > 0
                VIM.command("args #{fnames.join ' '}")
            else
                VIM::message("Invalid input")
            end
        end
    else
        VIM::message("No files matching #{glob}")
    end
END
endfunction
"}}}
"{{{
function! SearchMultOpenSplit(fname) 
ruby <<END
    fname = VIM.evaluate("a:fname")
    fname.gsub!(/;/, '')
    glob = "src/**/#{fname}"
    files = Dir[glob]
    if files.size == 0
        glob = "../*/" + glob
        files = Dir[glob]
    end
    if files.size > 0
        a = 0;
        opts = files.map { |file| "   #{a+=1}) #{file}" }
        choice = VIM.evaluate("input(\"Select the file(s) to open:\n#{opts.join("\n")}\nEnter files to open (seperate multiple files with spaces or commas)\n[<enter> aborts]: \", \"\")")
        if choice != ""
            fnames = Array.new
            choice.split(/[\s,]/).each { |n|
                if n =~ /^\d/
                    fnames << files[n.to_i-1]
                end
            }
            if fnames.size > 0
                VIM.command("sp")
                VIM.command("args #{fnames.join ' '}")
            else
                VIM::message("Invalid input")
            end
        end
    else
        VIM::message("No files matching #{glob}")
    end
END
endfunction
"}}}

"nmap <silent> gf :call SearchMultOpen("<c-r>=expand('<cword>')<cr>.java")<cr>
"nmap <silent> gff :call SearchMultOpen("<c-r>=expand('<cWORD>')<cr>.java")<cr>
"nmap <silent> gs :call SearchMultOpenSplit("<c-r>=expand('<cword>')<cr>.java")<cr>
"nmap <silent> gss :call SearchMultOpenSplit("<c-r>=expand('<cWORD>')<cr>.java")<cr>
