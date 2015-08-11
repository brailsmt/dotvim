" Vim syntax file
" Language:	   ezt - ViewVC's template syntax
" Maintainer:  Michael Brailsford <brailsmt@yahoo.com>

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

"Source the html syntax file
ru! syntax/html.vim
unlet b:current_syntax

syn cluster htmlCrap contains=cssStyle,htmlArg,htmlArg,htmlBoldItalic,htmlBoldItalicUnderline,htmlBold,htmlBoldUnderline,htmlBoldUnderlineItalic,htmlComment,htmlCommentError,htmlCommentPart,htmlCssDefinitionmatchgroup,htmlCssStyleComment,htmlEndTag,htmlError,htmlEvent,htmlEventDQ,htmlEventSQ,htmlH1,htmlH2,htmlH3,htmlH4,htmlH5,htmlH6,htmlHead,htmlHighlightgroupthere,htmlHighlightSkip,htmlItalicBold,htmlItalicBoldUnderline,htmlItalic,htmlItalicUnderlineBold,htmlItalicUnderline,htmlJavaScript,htmlLink,htmlPreAttr,htmlPreError,htmlPreProcAttrError,htmlPreProcAttrName,htmlPreProc,htmlPreStmt,htmlScriptTag,htmlSpecialChar,htmlSpecialTagName,htmlString,htmlTag,htmlTagError,htmlTagN,htmlTagName,htmlTagName,htmlTitle,htmlTopcontains,htmlUnderlineBold,htmlUnderlineBoldItalic,htmlUnderlineItalicBold,htmlUnderlineItalic,htmlUnderline,htmlValue,javaScript,javaScriptExpression,@htmlCss,@htmlJavaScriptsyntax,@htmlVbScript

syn match eztKeywords /if-any/
syn keyword eztKeywords if include is for else end
syn match eztString /".\{-}"/ containedin=eztBracket
syn match eztComment /#.*]/me=e-1 containedin=eztBracket
syn match eztBracket /\[.\{-}\]/ contains=eztKeywords containedin=@top,@htmlCrap

hi eztBracket ctermbg=4 cterm=NONE
hi eztKeywords ctermfg=1 cterm=NONE
hi link eztString String
hi link eztComment Comment
