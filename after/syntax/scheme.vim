
let b:commentchars=";"
set ai

syn region schemeMultiLineComment start=$#|$ end=$|#$

hi link schemeMultiLineComment comment

abbr lam lambda
abbr def define
