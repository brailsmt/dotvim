" Vim color file
" Maintainer:   Michael Brailsford <brailsmt@yahoo.com>
" Date:        $Date: 2002/11/25 20:25:54 $ 
" Version:     $Revision: 1.1 $
" Inspiration: This colorscheme was inspired by midnight.vim.  It is a darker
"              version of it.  With some colors tweaked.
"
" Thanks:      Thanks go to Hans Fugal for creating the colorscheme template.
"                Without it I would have been lost creating the original midnight.vim
"              Thanks to Mark Lodato for providing vim7 updates.
"
" Note:        If you do not like the dark look of the colorscheme, you can
"              easily lighten things up with the following line:
"              :%s/\(\w\)3/\12/g
"              It is easily pasteable into the command line.  you can also
"              change "\12" to "\11", "\1" or "\14" (if you want things even
"              darker).  If you do use the "\14" replacement, then it looks
"              like your monitor in a fog bank.  :)

" your pick:
set background=dark  
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="midnight2"

hi Normal guifg=#90B6CD guibg=#000029 ctermfg=14
hi Visual guibg=#90B6CD guifg=#000029 ctermfg=14

"Toggle semicolon matching at the end of lines
nmap <silent> <leader>; :call ToggleSemicolonHighlighting()<cr>
"{{{
function! ToggleSemicolonHighlighting()
   if exists("b:semicolon")
      unlet b:semicolon
      hi semicolon guifg=NONE gui=NONE ctermfg=NONE
   else
      syn match semicolon #;$#
      hi semicolon guifg=#CD0000 gui=bold ctermfg=1
      let b:semicolon = 1
   endif
endfunction
"}}}

hi Cursor guibg=fg guifg=bg ctermfg=0 ctermbg=11
"hi CursorIM   
hi Directory gui=bold
hi DiffAdd guibg=#6C7B8B ctermbg=0
hi DiffChange guibg=#4F94CD guifg=bg gui=NONE
hi DiffDelete guibg=#6C7B8B guifg=#9FB6CD
hi DiffText guibg=#36648B gui=bold
hi ErrorMsg guibg=#CD0000 ctermfg=0
"hi VertSplit  
hi Folded guibg=#00001a guifg=#CDCD00 ctermbg=4 ctermfg=11 gui=NONE
hi FoldColumn guibg=#4F94CD ctermbg=14 guifg=#000080 ctermfg=11 gui=bold
"hi SignColumn
"hi IncSearch  
hi LineNr guifg=#CDCD00 ctermfg=3
hi MatchParen guibg=#000080 gui=italic
hi ModeMsg guifg=#CDCD00 gui=bold ctermfg=3
"hi MoreMsg(   )
"hi NonText    
hi Pmenu guibg=#000090 guifg=#d3d3d3 ctermfg=7 ctermbg=4 cterm=bold
hi PmenuSel guibg=#d3d3d3 guifg=#000090 gui=bold ctermfg=4 ctermbg=7 cterm=bold
hi link PmenuSbar Pmenu
"hi PmenuThumb
"hi Question   
hi Search guibg=#000090 guifg=#d3d3d3
"hi SpecialKey 
"hi SpellBad
"hi SpellCap
"hi SpellLocal
"hi SpellRare
hi StatusLine guifg=#4F94CD
hi StatusLineNC guifg=#36648B
"hi TabLine
"hi TabLineFill
"hi TabLineSel
"hi Title      
"hi WarningMsg 
"hi WildMenu   
"hi Menu    
"hi Scrollbar  
"hi Tooltip    

" syntax highlighting groups
hi Comment guifg=#66cd00 ctermfg=10
hi Constant guifg=#cd96cd gui=bold ctermfg=13
hi String guifg=#cd5555 ctermfg=124
hi Character guifg=#8968cd ctermfg=5
hi Number guifg=#00cdc5 ctermfg=5
"hi Identifier 
hi Statement guifg=#cdc673 gui=bold ctermfg=228 
hi PreProc guifg=#cd2626 gui=italic ctermfg=9
hi Type  guifg=#CDAD00 gui=bold ctermfg=220
hi Special guifg=#ffa500 ctermfg=208
hi Underlined ctermfg=white cterm=underline
"hi Ignore     
"hi Error      
hi Todo guifg=#CDCD00 guibg=#0000cd gui=bold ctermfg=3 

"hi SignError guibg=#500000 gui=italic
"hi SignWarn  guibg=yellow4 guifg=black gui=bold

hi WarningMsg guifg=#8b8b00 guibg=#36648B
"hi Error      guifg=red4 guibg=#36648B
"hi SignColumn guibg=#36648B guifg=#000080

hi illuminatedWord guifg=none guibg=#303010

" see ~/.vim/autoload/airline/themes/midnight.vim for airline theming
