" Vim color file
" Maintainer:   Michael Brailsford <brailsmt@yahoo.com>
" Date:			$Date: 2002/04/11 03:29:51 $ 
" Version: 		$Revision: 1.4 $

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

" your pick:
set background=light
hi clear          
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="midnight_inverse"

hi Normal          guifg=lightsteelblue guibg=#ffff90 ctermfg=14

"Toggle semicolon matching at the end of lines
nmap <silent> <leader>; :call ToggleSemicolonHighlighting()<cr>
"{{{
function! ToggleSemicolonHighlighting()
	if exists("b:semicolon")
		unlet b:semicolon
		hi semicolon guifg=NONE gui=NONE ctermfg=NONE
	else
		syn match semicolon #;$#
		hi semicolon guifg=red gui=bold ctermfg=1
		let b:semicolon = 1
	endif
endfunction
"}}}

hi Cursor          guifg=bg guibg=fg ctermfg=0 ctermbg=11
"hi CursorIM	
hi Directory       gui=bold
hi DiffAdd         guifg=#0000ff guibg=darkgreen ctermbg=0
"hi DiffChange	
"hi DiffDelete	
"hi DiffText	
hi ErrorMsg        guibg=#00ffff ctermfg=1
"hi VertSplit	
hi Folded          guibg=#ffffb8 ctermbg=4 guifg=#0000ff ctermfg=11 gui=bold
hi FoldColumn      guibg=steelblue3 ctermbg=14 guifg=darkblue ctermfg=11 gui=bold
"hi IncSearch	
hi LineNr          guifg=#0000ff ctermfg=11
hi ModeMsg         guifg=#0000ff gui=bold
"hi MoreMsg		
"hi NonText		
"hi Question	
hi Search          guibg=#0000ff guifg=bg
"hi SpecialKey	
hi StatusLine      guifg=steelblue1
hi StatusLineNC    guifg=steelblue3
"hi Title		
hi Visual          guifg=fg guibg=bg
"hi VisualNOS	
"hi WarningMsg	
"hi WildMenu	
"hi Menu		
"hi Scrollbar	
"hi Tooltip		

" syntax highlighting groups
hi Comment         guifg=#ff00ff ctermfg=10
hi Constant        guifg=lightmagenta gui=bold ctermfg=13
hi String          guifg=indianred1 ctermfg=5
hi Character       guifg=#117d11 ctermfg=5
hi Number          guifg=#ff0a00 ctermfg=5
"hi Identifier	
hi Statement       guifg=#000970 gui=bold ctermfg=15 cterm=underline
hi PreProc         guifg=#00cfcf gui=italic ctermfg=9
hi Type            guifg=#0028ff gui=bold ctermfg=3
"hi Special	
"hi Underlined	
"hi Ignore		
"hi Error		
hi Todo            guifg=#0000ff guibg=#ffff00 gui=bold
