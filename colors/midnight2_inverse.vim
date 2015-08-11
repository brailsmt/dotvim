" Vim color file
" Maintainer:   Michael Brailsford <brailsmt@yahoo.com>
" Date:			$Date: 2002/04/11 03:29:51 $ 
" Version: 		$Revision: 1.4 $
" Inspiration:	This colorscheme was inspired by midnight.vim.  It is a darker
" 				version of it.  With some colors tweaked.
" Thanks:		Thanks go to Hans Fugal for creating the colorscheme template.
"				Without it I would have been lost creating the original midnight.vim
" Note: 		If you do not like the dark look of the colorscheme, you can
" 				easily lighten things up with the following line:
" 				:%s/\(\w\)3/\12/g
"				It is easily pasteable into the command line.  you can also
"				change "\12" to "\11", "\1" or "\14" (if you want things even
"				darker).  If you do use the "\14" replacement, then it looks
"				like your monitor in a fog bank.  :)

" your pick:
set background=dark	
hi clear          
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="midnight2"

hi Normal          guifg=slategray3 guibg=#ffffd6 ctermfg=14

"Toggle semicolon matching at the end of lines
nmap <silent> <leader>; :call ToggleSemicolonHighlighting()<cr>
"{{{
function! ToggleSemicolonHighlighting()
	if exists("b:semicolon")
		unlet b:semicolon
		hi semicolon guifg=NONE gui=NONE ctermfg=NONE
	else
		syn match semicolon #;$#
		hi semicolon guifg=red3 gui=bold ctermfg=1
		let b:semicolon = 1
	endif
endfunction
"}}}

hi Cursor          guifg=bg guibg=fg ctermfg=0 ctermbg=11
"hi CursorIM	
hi Directory       gui=bold
hi DiffAdd         guifg=#3232ff guibg=darkgreen ctermbg=0
"hi DiffChange	
"hi DiffDelete	
"hi DiffText	
hi ErrorMsg        guibg=#32ffff ctermfg=1
"hi VertSplit	
hi Folded          guibg=#ffffe5 ctermbg=4 guifg=#3232ff ctermfg=11 gui=NONE
hi FoldColumn      guibg=steelblue3 ctermbg=14 guifg=navyblue ctermfg=11 gui=bold
"hi IncSearch	
hi LineNr          guifg=#3232ff ctermfg=11
hi ModeMsg         guifg=#3232ff gui=bold
"hi MoreMsg		
"hi NonText		
"hi Question	
hi Search          guibg=#3232ff guifg=bg
"hi SpecialKey	
hi StatusLine      guifg=steelblue3
hi StatusLineNC    guifg=steelblue4
"hi Title		
hi Visual          guifg=fg guibg=bg
"hi VisualNOS	
"hi WarningMsg	
"hi WildMenu	
"hi Menu		
"hi Scrollbar	
"hi Tooltip		

" syntax highlighting groups
hi Comment         guifg=#9932ff ctermfg=10
hi Constant        guifg=#326932 gui=bold ctermfg=13
hi String          guifg=indianred3 ctermfg=5
hi Character       guifg=mediumpurple3 ctermfg=5
hi Number          guifg=#ff3a32 ctermfg=5
"hi Identifier	
hi Statement       guifg=#32398c gui=bold ctermfg=15 cterm=underline
hi PreProc         guifg=#32d9d9 gui=italic ctermfg=9
hi Type            guifg=#3252ff gui=bold ctermfg=3
"hi Special	
"hi Underlined	
"hi Ignore		
"hi Error		
hi Todo            guifg=#3232ff guibg=#ffff32 gui=bold
