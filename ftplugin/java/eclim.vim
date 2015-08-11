" Some commonly used eclim mappings to make it more convenient to use eclim.

" Search for the definition of the word under the cursor using eclim's :JavaSearch
nmap <leader>js :JavaSearch -t all <C-R>=expand("<cword>")<cr><cr>
"nmap <c-]> :JavaSearch -t all <C-R>=expand("<cword>")<cr><cr>
nmap <leader>jsc :JavaSearchContext<cr>

nmap <leader>jst :JavaSearch -t type <C-R>=expand("<cword>")<cr><cr>

" Search for the definition of the method under the cursor using eclim's :JavaSearch
nmap <leader>jsm :JavaSearch -t method <C-R>=expand("<cword>")<cr><cr>

" Search for references to the word under the cursor using eclim's :JavaSearch -x references
nmap <leader>jsr :JavaSearch -x references <C-R>=expand("<cword>")<cr><cr>

" Insert import statements with eclim's :JavaImport
nmap <leader>ji :JavaImport<cr>

" Insert and sort import statements with eclim's :JavaImportOrganize
nmap <leader>jio :JavaImportOrganize<cr>

" Validate the syntax of the current file using eclims' :Validate
nmap <leader>jv :Validate<cr>

" Display correction suggestions using eclim's :JavaCorrect
nmap <leader>jc :JavaCorrect<cr>

" Lookup javadoc on the word/object under the cursor
nmap <s-k> :JavaDocPreview<cr>

" Run a JUnit test
nmap <leader>jur :JUnit<cr>
