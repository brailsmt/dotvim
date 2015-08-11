"This does not quite fit the language.vim naming convention, but it is used for syntax highlighting
"of the line that is displayed for folded text.  
"NOTE:  This file is specific to my prefered way of handling folds
"Author:	Michael Brailsford
"$Revision&
"$Date&

hi foldcolumn guifg=darkblue guibg=lightblue
syn match foldNumberOfFoldedLines contained '\[[^:]'
"syn Folded contains=foldNumberOfFoldedLines
