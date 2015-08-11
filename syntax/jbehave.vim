" Vim syntax file
" Language:         JBehave Story Syntax
" Maintainer:       Michael Brailsford

" Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword gwt Given When Then Meta Narrative Scenario
syn match gwt "^\s*And"

hi link gwt Identifier
