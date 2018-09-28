" vim: fdm=marker ts=4 sw=4

" Maven related vim scripts, shortcuts, functions, etc...
function! GetSurefireResultsFor(filename)
    let s:reportPath = glob('**/target/surefire-reports/*'.a:filename.'*.txt')
    return s:reportPath
endfun

function! GetTestOrFile(filename) 
    let s:targetfname = ''
    if a:filename =~ '.*Test\.java'
        let s:targetfname = glob('**/src/main/java/**/' . substitute(a:filename, 'Test\.java', '.java', ''))
    else
        let s:targetfname = glob('**/src/test/java/**/' . substitute(a:filename, '\.java', 'Test.java', ''))
    endif

    return s:targetfname
endfun

nmap <leader>a :exec('vsplit ' . GetTestOrFile(expand('%:t')))<cr>
nmap <leader>rs :exec('vsplit ' . GetSurefireResultsFor(expand('%:t:r')))<cr>
