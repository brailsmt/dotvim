" Description: c preprocessor commenting 
" Author: Michael Geddes <michaelrgeddes@optushome.com.au>
" Modified: May2001
" Version: 1.0

" Usage: Call CIfDef() after sourcing the c/cpp syntax file. 
" Call Define() to mark a preprocessor symbol as being defined.
" Call Undefine() to mark a preprocessor symbol as not being defined.  
" call Undefine('\k\+') will mark all words that aren't explicitly 'defined' as undefined.

let cpreproc_comment=0
function! CIfDef()
  " Redefine some standards
  syn region	cIDefine		start="^\s*#\s*\(define\|undef\)\>" skip="\\$" end="$" contained contains=ALLBUT,@cPreProcGroup keepend
  syn region	cPreProc	start="^\s*#\s*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)" skip="\\$" end="$" contained contains=ALLBUT,@cPreProcGroup keepend
  syn match	cInclude	"^\s*#\s*include\>\s*["<]" contained contains=cIncluded

  "Standards
  syn cluster cGoodIfExclude contains=cInParen,cUserLabel,cppMethodWrapped,cOutIf,cIncluded,cErrInParen,cErrInBracket,cCppOut2
  " Bad spaces additions
  syn cluster cGoodIfExclude add=cInitTabTab,cInitTabSpace,cErrInBracket
  " CGS Error &c additions
  syn cluster cGoodIfExclude add=CGS.*
  " Specific to this problem
  syn cluster cGoodIfExclude add=cInElse,cOutComment,cOutIf,cOutPreCondit,cErrInBracket
  syn cluster cGoodIfExclude add=doxygen.*
  syn cluster cGoodIfExclude add=fortify.*

  " Now add to all the c clusters
  syn cluster cParenGroup add=cOutComment,cOutIf,cInElse
  syn cluster cPreProcGroup add=cOutComment,cOutIf,cInElse
  syn cluster cMultiGroup add=cOutComment,cOutIf,cInElse
  syn cluster rcParenGroup add=cOutComment,cOutIf,cInElse
  syn cluster rcGroup add=cOutComment,cOutIf,cInElse

  " #if .. #endif  nesting
  syn region cInIf matchgroup=cPreCondit1 start="^\s*#\s*\(if\>\|ifdef\>\|ifndef\>\).*$" matchgroup=cPreCondit1 end="^\s*#\s*endif\>.*$" contained contains=ALLBUT,@cGoodIfExclude

  syn region cOutIf matchgroup=cPreCondit2 start="^\s*#\s*\(if\>\|ifdef\>\|ifndef\>\).*$" matchgroup=cPreCondit2 end="^\s*#\s*endif\>.*$" contained contains=cOutIf,cOutComment,cOutPreCondit

  " #else hilighting for nesting
  syn region cInPreCondit start="^\s*#\s*\(elif\>\|else\>\)" skip="\\$" end="$" contained contains=cComment,cSpaceError
  syn region cOutPreCondit start="^\s*#\s*\(elif\>\|else\>\)" skip="\\$" end="$" contained contains=cComment,cSpaceError

  " #if 0 matching 
  syn region cIfOut  matchgroup=cPreCondit4 start="^\s*#\s*if\s\+0\>" matchgroup=cPreCondit4 end="^\s*#\s*endif" contains=cOutIf,cInBadPreCondit,cComment,cInElse

  " #else handling .. switching to out group 
  syn region cOutElse matchgroup=cPreCondit3 start="^\s*#\s*else" end="^\s*#\s*endif"me=s-1 contained contains=cOutIf,cInBadPreCondit,cOutComment

  syn region cInElse matchgroup=cPreCondit6 start="^\s*#\s*else" end="^\s*#\s*endif"me=s-1 contained contains=ALLBUT,@cGoodIfExclude


  " comment hilighting
  syntax region cOutComment	start="/\*" end="\*/" contained contains=cCharacter,cNumber,cFloat,cSpaceError
  syntax match  cOutComment	"//.*" contained contains=cCharacter,cNumber,cSpaceError
  "	call Define('Good')

  hi cIfZero term=bold ctermfg=1 gui=italic guifg=DarkSeaGreen 
  hi link cIfOut cIfZero 
  hi link cOutIf cIfZero
  hi link cOutElse cIfOut
  hi link cIDefine cPreCondit
  hi link cPreCondit1 cPreCondit
  hi link cPreCondit2 cInBadPreCondit
  hi link cPreCondit3 cPreCondit
  hi link cPreCondit4 cPreCondit
  hi link cPreCondit5 cPreCondit
  hi link cPreCondit6 cPreCondit
  hi link cOutComment cInBadPreCondit
  hi link cInBadPreCondit cComment 
"  hi cIfIn guifg=Red

  " Start sync from scratch
  syn sync fromstart
if 0
  syn sync clear
  syn sync maxlines=50
  syn sync match cSyncIfZero groupthere cIfOut "^\s*#\s*if\s\+0\>" contains=cSyncIfOutRegion,cSyncOutIfRegion
  "syn sync match cSyncIfZero groupthere NONE "^\s*#\s*if\s\+1\>" contains=cSyncIfInRegion,cSyncInIfRegion

" syn sync region cSyncIfOutRegion start="^\s*#\s*if\s\+0\>" end="^\s*#\s*endif" contains=cSyncIfOutRegion
" syn sync region cSyncIfOutRegion start="^\s*#\s*if\s\+0\>" end="^\s*#\s*endif" contained contains=cSyncIfOutRegion
 " cOutIf,cInBadPreCondit,cComment,cInElse
"  syn sync region cSyncInIfRegion start="^\s*#\s*if" end="^\s*#\s*endif" contained contains=cSyncInIfRegion,cSyncIfOut
  syn sync region cSyncOutIfRegion start="^\s*#\s*if" end="^\s*#\s*endif" contained contains=cSyncOutIfRegion,cSyncIfOut

" syn sync region cSyncOutElse matchgroup=cPreCondit3 start="^\s*#\s*else" end="^\s*#\s*endif"me=s-1 contained contains=cSyncIfOutRegion,cSyncOutIfRegion,cSyncInElse
  "	cOutIf,cInBadPreCondit,cOutComment

" syn sync region cSyncInElse matchgroup=cPreCondit6 start="^\s*#\s*else" end="^\s*#\s*endif"me=s-1 contained contains=cSyncIfOutRegion,cSyncInIfRegion,cSyncInElse
  " ALLBUT,@cGoodIfExclude
endif

endfunction

fun! Define(define)
  exe 'syn region cIfOut  matchgroup=cPreCondit4 start="^\s*#\s*ifndef\s\+'.a:define.'\>" matchgroup=cPreCondit4 end="^\s*#\s*endif" contains=cOutIf,cInBadPreCondit,cOutComment,cInElse'
  exe 'syn region cIfIn matchgroup=cPreCondit5 start="^\s*#\s*ifdef\s\+'.a:define.'\>" matchgroup=cPreCondit5 end="^\s*#\s*endif" contains=ALLBUT,@cGoodIfExclude'

endfun
"if 0
"  exe 'syn sync region cSyncIfOutRegion  matchgroup=cPreCondit4 start="^\s*#\s*ifndef\s\+'.a:define.'\>" matchgroup=cPreCondit4 end="^\s*#\s*endif" contained contains=cOutIf,cInBadPreCondit,cOutComment,cInElse'
"  exe 'syn sync region cSyncIfInRegion matchgroup=cPreCondit5 start="^\s*#\s*ifdef\s\+'.a:define.'\>" matchgroup=cPreCondit5 end="^\s*#\s*endif" contained contains=cSyncIfInRegion,cSyncIfOutRegion,cSyncInIfRegion'
"  exe 'syn sync match cSyncIfInRegion groupthere cIfOut "^\s*#\s*ifdef\s\+'.a:define.'\>" contains=cSyncIfOutRegion,cSyncInIfRegion,cSyncOutElse'
"  exe 'syn sync match cSyncIfOutRegion groupthere cIfOut "^\s*#\s*ifndef\s\+'.a:define.'\>" contains=cSyncIfOutRegion,cSyncOutIfRegion,cSyncInElse'
"endfun
"endif

fun! Undefine(define)
  exe 'syn region cIfOut  matchgroup=cPreCondit4 start="^\s*#\s*ifdef\s\+'.a:define.'\>" matchgroup=cPreCondit4 end="^\s*#\s*endif" contains=cOutIf,cInBadPreCondit,cOutComment,cInElse'
  exe 'syn region cIfIn matchgroup=cPreCondit5 start="^\s*#\s*ifndef\s\+'.a:define.'\>" matchgroup=cPreCondit5 end="^\s*#\s*endif" contains=ALLBUT,@cGoodIfExclude'

endfun

"if 0
"  exe 'syn sync region cSyncIfOutRegion  matchgroup=cPreCondit4 start="^\s*#\s*ifdef\s\+'.a:define.'\>" matchgroup=cPreCondit4 end="^\s*#\s*endif" contained contains=cOutIf,cInBadPreCondit,cOutComment,cInElse'
"  exe 'syn sync region cSyncIfInRegion matchgroup=cPreCondit5 start="^\s*#\s*ifndef\s\+'.a:define.'\>" matchgroup=cPreCondit5 end="^\s*#\s*endif" contained contains=cSyncIfInRegion,cSyncIfOutRegion,cSyncInIfRegion'
"  exe 'syn sync match cSyncIfInRegion groupthere cIfOut "^\s*#\s*ifndef\s\+'.a:define.'\>" contains=cSyncIfOutRegion,cSyncInIfRegion,cSyncOutElse'
"  exe 'syn sync match cSyncIfOutRegion groupthere cIfOut "^\s*#\s*ifdef\s\+'.a:define.'\>" contains=cSyncIfOutRegion,cSyncOutIfRegion,cSyncInElse'
"endfun
"endif

" call Define('TEST')
