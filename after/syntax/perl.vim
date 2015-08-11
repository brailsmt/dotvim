syn match rubyClassVar #@@\h\w*#
syn match rubyExprSubst "\\\\\|\(\(\\M-\\C-\|\\c\|\\C-\|\\M-\)\w\)\|\(\\\o\{3}\|\\x\x\{2}\|\\w\)" contained

hi link rubyClassVar Special

let b:commentchars="#"
