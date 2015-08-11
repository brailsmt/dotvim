"Extra syntax file

hi comment guifg=green

hi javaCommentTitle 	guifg=lightgreen
hi javaCommentTag 	guifg=lightgreen
hi javaFuncDef 		guifg=yellow
hi javaType 		guifg=orange gui=bold
hi javaLangClass 	guifg=lightblue
hi javaString		guifg=lightmagenta
hi link JavaNumber	javaString

set commentstring=//%s
let b:commentchars="//"

"This changes all the highlight stuff from javaid.vim	{{{
hi link javaBeansClass				javaLangClass
hi link javaBeansBeancontextClass	javaLangClass
hi link javaLangRefClass			javaLangClass
hi link javaLangReflectClass		javaLangClass
hi link javaLangMathClass			javaLangClass
hi link javaNetClass				javaLangClass
hi link javaSecurityClass			javaLangClass
hi link javaSecurityAclClass		javaLangClass
hi link javaSecurityCertClass		javaLangClass
hi link javaSecurityInterfacesClass	javaLangClass
hi link javaTextClass				javaLangClass
hi link javaUtilJarClass			javaLangClass
hi link javaUtilZipClass			javaLangClass
hi link javaxCryptoClass			javaLangClass
hi link javaAwtClass				javaLangClass
hi link javaAwtColorClass			javaLangClass
hi link javaAwtDatatransferClass	javaLangClass
hi link javaAwtDndClass				javaLangClass
hi link javaAwtDndPeerClass			javaLangClass
hi link javaAwtEventClass			javaLangClass
hi link javaAwtFontClass			javaLangClass
hi link javaAwtGeomClass			javaLangClass
hi link javaAwtImClass				javaLangClass
hi link javaAwtImageClass			javaLangClass
hi link javaAwtImageRenderableClass	javaLangClass
hi link javaAwtPeerClass			javaLangClass
hi link javaAwtPrintClass			javaLangClass
hi link javaxAccessibilityClass		javaLangClass
hi link javaxSwingClass				javaLangClass
hi link javaxSwingBorderClass		javaLangClass
hi link javaxSwingColorchooserClass	javaLangClass
hi link javaxSwingEventClass		javaLangClass
hi link javaxSwingFilechooserClass	javaLangClass
hi link javaxSwingPlafClass			javaLangClass
hi link javaxSwingTableClass		javaLangClass
hi link javaxSwingTextClass			javaLangClass
hi link javaxSwingTextHtmlClass		javaLangClass
hi link javaxSwingTextHtmlParserClass	javaLangClass
hi link javaxSwingTextRtfClass		javaLangClass
hi link javaxSwingTreeClass			javaLangClass
hi link javaxSwingUndoClass			javaLangClass
hi link javaRmiClass				javaLangClass
hi link javaRmiActivationClass		javaLangClass
hi link javaRmiDgcClass				javaLangClass
hi link javaRmiRegistry       		javaLangClass
hi link javaRmiServerClass			javaLangClass
hi link javaSqlClass				javaLangClass
hi link javaxEjbClass				javaLangClass
hi link javaEjbDeploymentClass		javaLangClass
hi link javaxJmsClass				javaLangClass
hi link javaxNamingClass			javaLangClass
hi link javaxNamingDirectoryClass	javaLangClass
hi link javaxNamingSpiClass			javaLangClass
hi link javaxServletClass			javaLangClass
hi link javaxServletHttpClass		javaLangClass
hi link javaxSqlClass				javaLangClass
hi link javaxTransactionClass		javaLangClass
hi link javaxTransactionXaClass		javaLangClass
hi link orgOmgCorbaClass			javaLangClass
hi link orgOmgCorbaDynanypackageClass	javaLangClass
hi link orgOmgCorbaOrbpackage       javaLangClass
hi link orgOmgCorbaPortable         javaLangClass
hi link orgOmgCorbaTypecodepackage  javaLangClass
hi link orgOmgCosnamingClass		javaLangClass
hi link orgOmgCosnamingNamingcontextpackage	javaLangClass
 "}}}
