" compiler plugin to generate classpaths for javac

let current_compiler = "accio-javac"

" assumes a git project
function! s:get_project_root()
    return fnamemodify(fugitive#extract_git_dir(expand("%:p")), ":h:~")
endfunction

" assumes a mvn project
function! s:get_classpath()
    return join(split(globpath('.', 'target/*classes'), '\n'), ':') . ':' . system('cat .classpath')
endfunction

" older Vim always used :setlocal
if exists(":CompilerSet") != 2 
    command -nargs=* CompilerSet setlocal <args>
endif

let $CLASSPATH=s:get_classpath()
CompilerSet makeprg=javac\ -d\ target/classes\ %
"CompilerSet errorformat=%E%f:%l:\ %m,%-Z%p^,%-C%.%#,%-G%.%#
"CompilerSet errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
"CompilerSet errorformat=%A%f:%l:\ %m,%+Z%p^,%+C%.%#,%-G%.%#
"CompilerSet errorformat=%A%f:%l:\ %trror,%+Z%p^,%+C%.%#,%-G%.%#
CompilerSet errorformat=%E%f:%l:\ error:%m,%-Z%p^,%+C%.%#,%+G
