"{{{
"Extra syntax file
"Set all the highlight stuff from javaid.vim
hi link javaLangObject                javaLangClass
hi link javaIoClass                   javaLangClass
hi link javaBeansClass                javaLangClass
hi link javaBeansBeancontextClass     javaLangClass
hi link javaLangRefClass              javaLangClass
hi link javaLangReflectClass          javaLangClass
hi link javaLangMathClass             javaLangClass
hi link javaNetClass                  javaLangClass
hi link javaSecurityClass             javaLangClass
hi link javaSecurityAclClass          javaLangClass
hi link javaSecurityCertClass         javaLangClass
hi link javaSecurityInterfacesClass   javaLangClass
hi link javaTextClass                 javaLangClass
hi link javaUtilClass                 javaLangClass
hi link javaUtilJarClass              javaLangClass
hi link javaUtilZipClass              javaLangClass
hi link javaxCryptoClass              javaLangClass
hi link javaAwtClass                  javaLangClass
hi link javaAwtColorClass             javaLangClass
hi link javaAwtDatatransferClass      javaLangClass
hi link javaAwtDndClass               javaLangClass
hi link javaAwtDndPeerClass           javaLangClass
hi link javaAwtEventClass             javaLangClass
hi link javaAwtFontClass              javaLangClass
hi link javaAwtGeomClass              javaLangClass
hi link javaAwtImClass                javaLangClass
hi link javaAwtImageClass             javaLangClass
hi link javaAwtImageRenderableClass   javaLangClass
hi link javaAwtPeerClass              javaLangClass
hi link javaAwtPrintClass             javaLangClass
hi link javaxAccessibilityClass       javaLangClass
hi link javaxSwingClass               javaLangClass
hi link javaxSwingBorderClass         javaLangClass
hi link javaxSwingColorchooserClass   javaLangClass
hi link javaxSwingEventClass          javaLangClass
hi link javaxSwingFilechooserClass    javaLangClass
hi link javaxSwingPlafClass           javaLangClass
hi link javaxSwingTableClass          javaLangClass
hi link javaxSwingTextClass           javaLangClass
hi link javaxSwingTextHtmlClass       javaLangClass
hi link javaxSwingTextHtmlParserClass javaLangClass
hi link javaxSwingTextRtfClass        javaLangClass
hi link javaxSwingTreeClass           javaLangClass
hi link javaxSwingUndoClass           javaLangClass
hi link javaRmiClass                  javaLangClass
hi link javaRmiActivationClass        javaLangClass
hi link javaRmiDgcClass               javaLangClass
hi link javaRmiRegistry               javaLangClass
hi link javaRmiServerClass            javaLangClass
hi link javaSqlClass                  javaLangClass
hi link javaxEjbClass                 javaLangClass
hi link javaEjbDeploymentClass        javaLangClass
hi link javaxJmsClass                 javaLangClass
hi link javaxNamingClass              javaLangClass
hi link javaxNamingDirectoryClass     javaLangClass
hi link javaxNamingSpiClass           javaLangClass
hi link javaxServletClass             javaLangClass
hi link javaxServletHttpClass         javaLangClass
hi link javaxSqlClass                 javaLangClass
hi link javaxTransactionClass         javaLangClass
hi link javaxTransactionXaClass       javaLangClass
"}}}

syn match semicolon #;$#

set commentstring=//%s
let b:commentchars="//"

" Include annotations inside folds
syn region javaFuncDef start="^\z(\s*\)\%(@[A-Z]\k*\%((\_.\{-})\)\?\_s*\)*\%(\%(public\|protected\|private\|static\|abstract\|final\|native\|synchronized\)[ \n]\+\)*\%(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|\%([A-Z][$A-Za-z0-9_]*\%(\_s*<\_s*[$A-Za-z0-9,_ <]\+\_s*>\%(\_s*>\)*\_s*\)\?\)\)\_s\+\%([a-zA-Z$0-9_][$A-Za-z0-9_]*\)\_s*(\_[^)]*)\_s*\%(throws\_s\+[A-Z]\k\+\%(\_s*,\_s*[A-Z]\k\+\)*\_s\{-}\)\?\_s*{" end="^\z1}\s*$" keepend transparent fold
  
" Prevent one line functions from messing up the folds
" This must appear after javaFuncDef due to vim's syntax rule priorities
syn region javaFuncDef start="^\z(\s*\)\%(@[A-Z]\k*\%((\_.\{-})\)\?\_s*\)*\%(\%(public\|protected\|private\|static\|abstract\|final\|native\|synchronized\)[ \n]\+\)*\%(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|\%([A-Z][$A-Za-z0-9_]*\%(\_s*<\_s*[$A-Za-z0-9,_ <]\+\_s*>\%(\_s*>\)*\_s*\)\?\)\)\_s\+\%([a-z][$A-Za-z0-9_]*\)\_s*(\_[^)]*)\_s*\%(throws\_s\+[A-Z]\k\+\%(\_s*,\_s*[A-Z]\k\+\)*\_s\{-}\)\?\_s*{" end="}\s*$" oneline keepend transparent

syn region javaConstructorDef start="^\z(\s*\)\(public\|protected\|private\)\?[ \n]\+[A-Z][A-Za-z0-9_$]*[ \n]*(\_[^)]*)" end="^\z1}$" keepend transparent fold

syn region java5EnumDef start="^\z(\s*\)\%(@[A-Z]\k*\%((\_.\{-})\)\?\_s*\)*\%(\%(public\|protected\|private\|static\|final\)\_s\+\)*enum\_s\+\%([$A-Za-z0-9_]*\)\_s*{" end="^\z1}\s*$" keepend transparent fold

" Fold one line comments if there are multiple
"syn region javaMultipleOneLineCommentFold start="^\z(\s*\(//\)\)" skip="^\z1" end="^\z1\@!" transparent fold
syn region javaMultiLineComment start="/[*]\{1,}" end="[*]/" keepend transparent fold

syn region foldMarker start="\/\/\s*{{{" end="\/\/\s*}}}" keepend transparent fold

"syn region initializersFold start="^\z(\s*\)\(static\)\?\_s*{" end="^\z1}$" transparent fold keepend

hi javadocFold      gui=italic
hi semicolon        guifg=red
hi javaCommentTitle guifg=lightgreen ctermfg=119
hi javaCommentTag   guifg=lightgreen
hi javaFuncDef      guifg=yellow
hi java5EnumDef     guifg=yellow
hi javaType         guifg=orange gui=bold
"hi javaString      guifg=lightmagenta
hi javaLangClass    guifg=white
"hi link JavaNumber javaString
hi javaC_           ctermfg=183 
hi javaOperator     ctermfg=227 cterm=none

