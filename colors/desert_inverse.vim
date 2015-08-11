" Vim color file
" Maintainer:   Hans Fugal <hans@fugal.net>
" Last Change:  5 Oct 2001
" URL:			http://fugal.net/vim/colors/desert.vim 

" A theme inspired by my home town of Santa Fe, New Mexico

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=light
hi clear          
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="desert"

hi Normal          guifg=#000000 guibg=#cccccc

" highlight groups
hi Cursor          guibg=#0f1973 guifg=slategrey
"hi CursorIM	
"hi Directory	
"hi DiffAdd		
"hi DiffChange	
"hi DiffDelete	
"hi DiffText	
"hi ErrorMsg	
hi VertSplit       guibg=#3d405a guifg=#808080 gui=none
hi Folded          guibg=#b2b2b2 guifg=#0028ff
hi FoldColumn      guibg=#b2b2b2 guifg=#2d4b73
hi IncSearch       cterm=none ctermbg=#ffff00 ctermfg=#414141 guifg=slategrey guibg=#0f1973
"hi LineNr		
hi ModeMsg         guifg=#255adf
hi MoreMsg         ctermfg=#6f116f guifg=#d174a8
hi NonText         ctermfg=#522719 guifg=#522719 guibg=#b2b2b2
hi Question        guifg=springgreen
hi Search          ctermbg=#ffff00 ctermfg=#414141 guibg=#327ac0 guifg=#0a214c
hi SpecialKey      guifg=springgreen
hi StatusLine      guibg=#3d405a guifg=#ffffff gui=none
hi StatusLineNC    guibg=#3d405a guifg=#808080 gui=none
hi Title           guifg=indianred
hi Visual          cterm=none ctermbg=darkgreen ctermfg=#0000ff gui=none guifg=#0f1973 guibg=olivedrab
"hi VisualNOS	
hi WarningMsg      guifg=#057f8d
"hi WildMenu	
"hi Menu		
"hi Scrollbar	
"hi Tooltip		

" syntax highlighting groups
hi Comment         ctermfg=lightblue guifg=#783114
hi Constant        ctermfg=darkcyan guifg=#005f5f
hi Identifier      ctermfg=darkgreen cterm=none guifg=palegreen
hi Statement       ctermfg=#5ad5d5 guifg=#0f1973
hi PreProc         ctermfg=darkmagenta guifg=indianred
hi Type            ctermfg=darkgreen guifg=darkkhaki
hi Special         ctermfg=darkmagenta guifg=navajowhite
"hi Underlined	
hi Ignore          guifg=#999999
"hi Error		
hi Todo            ctermfg=darkred ctermbg=#0000ff guifg=orangered guibg=#1111ff


"vim: ts=4
