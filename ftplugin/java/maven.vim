
"{{{
function! MvnDo(...)
ruby <<END
	nargs = VIM.evaluate("a:0").to_i
    cmd = nil

    if(nargs > 1)
        cmd = ""
        1.upto(nargs) { |n|
            cmd += VIM.evaluate("a:#{n}") + " "
        }
    elsif(nargs == 1)
        cmd = VIM.evaluate "a:1"
    end

    case cmd
    when nil, "compile"
        VIM.command ":make compile"
    when "mkprj"
        VIM.command ":make clean eclipse:clean eclipse:eclipse"
    when "mkdeps"
        VIM.command ":make eclipse:eclipse -DdownloadSources=true -U"
    when "mksite"
        VIM.command ":make clean site"
    else
        VIM.command ":make #{cmd}"
    end
END
endfunction
"}}}

"command! -nargs=* Mvn :call MvnDo<args>
command! MvnCompile              :call MvnDo("compile")
command! MvnCleanCompile         :call MvnDo("clean compile")
command! MvnPackage              :call MvnDo("package")
command! MvnCleanPackage         :call MvnDo("clean package")
command! MvnEclipse              :call MvnDo("eclipe:clean eclipse:eclipse")
command! MvnSite                 :call MvnDo("clean site")
command! MvnWar                  :call MvnDo("war:war")
command! MvnWarUndeployDeploy    :call MvnDo("tomcat:undeploy war:war tomcat:deploy")
command! MvnRedeploy             :call MvnDo("war:war tomcat:redeploy")
command! MvnTest                 :call MvnDo("test")
command! MvnTestThis             :call MvnDo("test -Dtest=".expand("%:t:r"))
"command! MvnDownloadDependencies :call MvnDo("mkdeps")
"command! MvnCheckRelease         :call MvnDo("ckrel")

" Parse maven surefire output and generate quickfix jump points
"ruby <<END
"require "rexml/document"
"
" c = $curbuf
"    c.append 0, "// $Id$" if c[1].scan(/\$Id:?.*$/).empty?
"END

