"au bufwritepost *.hs Accio hdevtools
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1

autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

nmap <silent> <leader>ht :GhcModType<cr>
nmap <silent> <leader>hi :GhcModTypeInsert<cr>
