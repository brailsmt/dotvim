" Vim syntax file
" Language:         BNF
" Maintainer:       Michael Brailsford
" Last Change:      March 22, 2002

" Quit when a syntax file was already loaded	{{{
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif
"}}}

syn match bnfNonTerminal "<\a\w*>" contained
syn region bnfProduction start="^\a" end="::="me=e-3 contained
syn match bnfOr "|" contained
syn match bnfSeperator "::=" contained
syn match bnfComment "#.*$" contained
syn match bnfQuoted #".*"# contains=bnfNonTerminal,bnfProduction,bnfOr,bnfSeperator,bnfLiteral,bnfTerminalRangeDelim,bnfTerminalRange
syn match bnfQuoted #'.*'# contains=bnfNonTerminal,bnfProduction,bnfOr,bnfSeperator,bnfLiteral,bnfTerminalRangeDelim,bnfTerminalRange
"syn match bnfLiteral #"[ \w]*"# contained
syn match bnfTerminal "^.*$" contains=bnfNonTerminal,bnfProduction,bnfOr,bnfSeperator,bnfComment,bnfLiteral,bnfTerminalRangeDelim,bnfTerminalRange,bnfQuoted
syn region bnfTerminalRange matchgroup=bnfTerminalRangeDelim start=#\[# end=#\]# contains=bnfNonTerminal

hi link bnfNonTerminal	Type
hi link bnfProduction 	Constant
hi link bnfSeperator 	PreProc
hi link bnfComment 		Comment
hi link bnfTerminalRange bnfTerminal
hi link bnfQuoted bnfTerminal
"hi link bnfLiteral 	 	String
hi link bnfOr PreProc
hi bnfOr gui=bold
hi link bnfTerminalRangeDelim statement
hi bnfTerminal 	guifg=cyan ctermfg=cyan
