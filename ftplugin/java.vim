
" Generate a java "getter" method from a line such as '<modifer> <type> variableName;'
"{{{
function! Java_GenerateAccessor() range
    let methodDefinitions = ''

    for linenr in range(a:firstline, a:lastline)
        let tokens = split(getline(linenr))
        let memberName = substitute(tokens[-1], ';.*$', '', '')
        let methodName = 'get' . toupper(memberName[0]) . strpart(memberName, 1)
        let methodDefinitions .= "\npublic " . join(tokens[1:-2]) . ' ' . methodName . '() { return ' . memberName . '; }'
    endfor

    execute a:lastline
    execute "norm o" . methodDefinitions
endfunction
"}}}
