" Vim syntax file
" Language:     JFlex lexical specification
" Maintainer:   Michael Braislford <brailsmt@yahoo.com>
" $Date: 2002/11/25 20:25:54 $
" $Revision: 1.1 $

" Quit when a syntax file was already loaded	{{{
if exists("b:current_syntax")
  finish
endif
"}}}

" Include java syntax {{{
if version >= 600
  runtime! syntax/java.vim
  unlet b:current_syntax
else
  so <sfile>:p:h/java.vim
endif
"}}}

syntax sync fromstart "The highlighting will not work without this
set cin

"The syntax definitions		{{{
syn cluster	jflexRules contains=jflexRule,jflexComment,jflexActionCode,jflexRuleStates,jflexRegExp,semicolon,jflexStateDef
syn cluster	jflexOptions contains=jflexClassOption,jflexClassOptionParam,jflexClassOptionCode,jflexYYLexOptionParam,jflexYYLexOption,jflexEOFOption,jflexEOFOptionParam,jflexEOFOptionCode,jflexStandaloneOption,jflexCupOption,jflexCupOptionParam,jflexCodeGenOption,jflexCharSetOption,jflexCountOption,jflexObsoleteOption,jflexStateDecl,jflexMacro,jflexMacroRegExp,semicolon

"Define the BOF...%%, %%...%%, and %%...EOF blocks	{{{
syn region 	jflexStartSection transparent start=#\%^# end=#%%# nextgroup=jflexOptionSection contains=@javaTop
syn region 	jflexOptionSection transparent matchgroup=jflexSectionDivider start=#^%%# end=#^%%#me=e-2 contains=@javaTop,@jflexOptions,jflexRulesSection nextgroup=jflexRulesSection
syn region 	jflexRulesSection transparent matchgroup=jflexSectionDivider start=#^%%# end=#\%$# contained contains=@javaTop,semicolon
 "}}}

"Set the syntax for the Class level options	{{{
"The following have no options after them	
syn match 	jflexClassOption #^%final# contained 
syn match 	jflexClassOption #^%abstract# contained
syn match 	jflexClassOption #^%public# contained

"These all have sometype of option after them	
syn match	jflexClassOptionParam #^%implements# nextgroup=@javaClasses contained
syn match	jflexClassOptionParam #^%initthrow# nextgroup=@javaClasses contained
syn region	jflexClassOptionParam start=#^%initthrow{# end=#^%initthrow}# contains=@javaClasses contained
syn match	jflexClassOptionParam #^%class# contained
syn match	jflexClassOptionParam #^%extends# nextgroup=@javaClasses contained
syn match	jflexClassOptionParam #^%scanerror# nextgroup=@javaClasses contained
syn match	jflexClassOptionParam #^%buffer# nextgroup=@javaClasses contained
syn match	jflexClassOptionParam #^%include# contained
 
"These all contain user code	
syn region	jflexClassOptionCode transparent matchgroup=jflexCodeInclude start=#^%{# end=#^%}#
syn region 	jflexClassOptionCode transparent matchgroup=jflexCodeInclude start=#^%init{# end=#^%init}#
 
"}}}
"Set the syntax for the yylex method	{{{ 
syn match	jflexYYLexOption #^%int# contained
syn match	jflexYYLexOption #^%integer# contained
syn match	jflexYYLexOption #^%intwrap# contained
syn match 	jflexYYLexOptionParam #^%function# contained
syn match	jflexYYLexOptionParam #^%type# contained nextgroup=@javaClasses
syn match	jflexYYLexOptionParam #^%yylexthrow# contained nextgroup=@javaClasses
syn region	jflexYYLexOptionParam transparent matchgroup=jflexYYLexOptionParam start=#^%yylexthrow{# end=#^%yylexthrow}# contained contains=@javaClasses

"}}}
"Set the syntax for the eof definitions	{{{
syn match	jflexEOFOption #^%eofclose# contained
syn match	jflexEOFOptionParam #^%eofthrow# contained nextgroup=@javaClasses
syn region	jflexEOFOptionParam start=#^%eofthrow{# end=#^%eofthrow}# contained contains=@javaClasses
syn region	jflexEOFOptionCode start=#^%eof{# end=#^%eof}# contained contains=@javaTop
syn region	jflexEOFOptionCode matchgroup=jflexCodeInclude start=#^%eofval{# end=#^%eofval}# contained contains=@javaTop
"}}}
"Set the syntax for standalone scanner options	{{{
syn match jflexStandaloneOption #^%debug# contained 
syn match jflexStandaloneOption #^%standalone# contained 
"}}}
"Set the syntax for the cup compatibility options	{{{
syn match	jflexCupOption #^%cup# contained
syn match	jflexCupOption #^%cupdebug# contained
syn match	jflexCupOptionParam #^%cupsym# contained
"}}}
"{{{
syn match	jflexByaccOption #^%byacc# contained
"}}}
"Set the syntax for the code generation options	{{{
syn match	jflexCodeGenOption #^%switch# contained
syn match	jflexCodeGenOption #^%pack# contained
syn match	jflexCodeGenOption #^%table# contained
"}}}
"Set the syntax for the charachter set options	{{{
syn match	jflexCharSetOption #^%7bit# contained
syn match	jflexCharSetOption #^%full# contained
syn match	jflexCharSetOption #^%8bit# contained
syn match	jflexCharSetOption #^%unicode# contained
syn match	jflexCharSetOption #^%16bit# contained
syn match	jflexCharSetOption #^%caseless# contained
syn match	jflexCharSetOption #^%ignorecase# contained
"}}}
"Set the syntax for the counting options	{{{
syn match	jflexCountOption #^%char# contained
syn match	jflexCountOption #^%line# contained
syn match	jflexCountOption #^%column# contained
"}}}
"Set the syntax for obsolete JLex options	{{{
syn match	jflexObsoleteOption #^%notunix# contained
syn match	jflexObsoleteOption #^%yyeof# contained
"}}}
"Set the syntax for state declarations	{{{
syn match	jflexStateDecl #^%s\|^%x#me=e contained nextgroup=jflexStateIdent 
syn match	jflexStateDecl #^%state\|^%xstate#me=e contained nextgroup=jflexStateIdent 
"I hate deciphering regex's so this regex matches "one or more whitespace
"chars then zero or more identifier characters (a-Z basically) then zero or
"more whitespace chars then zero or one comma, all of that is repeated one or more times
syn match	jflexStateIdent #\(\s\+\i\+\s*[,]\?\)\+# contained
"}}}
"Set the syntax for macros	{{{
syn match	jflexMacro #\I\i*\s*=#me=e-1 contained contains=jflexMacroEqual nextgroup=jflexMacroEqual
"}}}
"}}}

"Set the highlighting	{{{
hi jflexSectionDivider guibg=blue guifg=yellow gui=bold
hi link jflexCodeInclude jflexSectionDivider


hi jflexClassOption guifg=orange gui=bold
hi link jflexClassOptionParam jflexClassOption
hi link jflexClassOptionCode jflexClassOption

"if you want to change the yylex option higlighting, change the following line only
hi link jflexYYLexOption jflexClassOption
hi link jflexYYLexOptionParam jflexYYLexOption

"if you want to change the eof option higlighting, change the following line only
hi link jflexEOFOption		jflexClassOption
hi link jflexEOFOptionParam	jflexEOFOption
hi link jflexEOFOptionCode	jflexEOFOption

"if you want to change the standalone highlighting, change the following line
hi link jflexStandaloneOption	jflexClassOption

"if you want to change the cup compatibility highlighting, change the
"following line only
hi link jflexCupOption	jflexClassOption
hi link jflexCupOptionParam	jflexCupOption

hi link jflexByaccOption jflexClassOption
hi link jflexCodeGenOption jflexClassOption
hi link jflexCharSetOption jflexClassOption
hi link jflexCountOption jflexClassOption

hi jflexObsoleteOption guibg=lightred guifg=black ctermbg=1* ctermfg=0

hi jflexStateDecl guifg=white gui=bold
hi jflexStateIdent	guifg=darkcyan

hi jflexMacro guifg=yellow gui=NONE
""}}}
