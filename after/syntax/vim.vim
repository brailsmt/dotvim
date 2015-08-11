"This sets a few things that are vim script specific

set commentstring=\"%s
let b:commentchars="\""

syn region foldMarker start="\"s*{{{" end="\"s*}}}" keepend transparent fold
