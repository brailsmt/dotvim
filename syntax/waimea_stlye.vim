" Waimea config syntax file
" Author:		Michael Brailsford <brailsmt@yahoo.com>
" Copyright:	2002 Michael Brailsford
" Version:		0.1
" License:		This is released under the terms of the BSD license.  The text
"				of the license follows.
"
"	Copyright (c) 2002, Michael Brailsford.  All rights reserved.
"	
"	Redistribution and use in source and binary forms, with or without
"	modification, are permitted provided that the following conditions are met:
"	
"   * Redistributions of source code must retain the above copyright notice,
"     this list of conditions and the following disclaimer.  
"   * Redistributions in binary form must reproduce the above copyright notice,
"	  this list of conditions and the following disclaimer in the documentation
"	  and/or other materials provided with the distribution.
"   * Neither the name of the Author nor the names of contributors may be used 
"     to endorse or promote products derived from this software without 
"     specific prior written permission.
"	
"	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
"	AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
"	IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
"	DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
"	ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
"	(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
"	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
"	ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
"	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
"	THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
"
"	Note:  This is not complete. I rate it as follows:  menu file - 98%, style
"	file - 85%, action file - 10%.

" Quit when a syntax file was already loaded	{{{
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif
"}}}

syn match waimeaStyleComment #!.*$# 
syn match waimeaStyleBoolean #true\c#
syn match waimeaStyleBoolean #false\c#
syn match waimeaStyleColor /#\x\x\x\x\x\x\>/ contains=waimeaStyleColorRed 
syn match waimeaStyleColorRed /\x\x\x\x\x\x\>/ contains=waimeaStyleColorGreen contained
syn match waimeaStyleColorGreen /\x\x\x\x\>/ contains=waimeaStyleColorBlue contained
syn match waimeaStyleColorBlue /\x\x\>/ contained
syn region waimeaStyleWindowKeys start=#\s*window\.\c# end=#:# contains=waimeaStyleWindowSpecifierKeys,waimeaStyleWindowFocusKeys
syn region waimeaStyleMenuKeys start=#\s*menu\.\c# end=#:# 
syn region waimeaStyleDockKeys start=#\s*dockappholder\.\c# end=#:# 
syn match waimeaStyleWindowSpecifierKeys #\(title\|label\|handle\|button\|grip\)\c# contained
syn match waimeaStyleWindowFocusKeys #\(focus\|unfocus\|pressed\)\c# contained
syn match waimeaStyleWindowAttributeKeys #\(color\|colorto\|pixmap\|border\|opacity\|piccolor\)\c# contained
syn match waimeaStyleWindowTextAttributeKeys #\(textcolor\|textshadowcolor\|textshadowxoffset\|textshadowyoffset\)\c# contained
syn match waimeaStyleKeys #\(borderColor\|borderWidth\|handleWidth\):\c# 
syn match waimeaStyleTexture  #Flat\|Raised\|Sunken\|Gradient\|Solid\|Pixmap\|Horizontal\|Vertical\c# 
syn match waimeaStyleTexture  #Diagonal\|Crossdiagonal\|Pipecross\|Elliptic\|Rectangle\|Pyramid\c# 
syn match waimeaStyleTexture  #Tiled\|Scaled\|Stretched\|Interlaced\|ParentRelative\|Bevel1\|Bevel2\c# 
syn match waimeaStyleOffsets #LEFT\|RIGHT\|TOP\|BOTTOM\c# 
syn match waimeaStyleOpacity #1\?\d\d# 
syn match waimeaStyleRootCommand #rootCommand:\c.*$# contains=waimeaStyleRootCommandName 
syn match waimeaStyleRootCommandName #:.*$#ms=s+1 

hi link waimeaStyleComment Comment
hi link waimeaStyleBoolean boolean
hi link waimeaStyleColor preproc
hi waimeaStyleColorRed guifg=red
hi waimeaStyleColorGreen guifg=green
hi waimeaStyleColorBlue guifg=blue
hi link waimeaStyleKeys statement
hi link waimeaStyleRootCommand statement
hi link waimeaStyleWindowKeys waimeaStyleKeys
hi link waimeaStyleMenuKeys waimeaStyleKeys
hi link waimeaStyleDockKeys waimeaStyleKeys
hi link waimeaStyleTexture type
hi link waimeaStyleOffsets waimeaStyleCheckboxOption
hi link waimeaStyleOpacity number
hi link waimeaStyleBraces todo
hi waimeaStyleRootCommandName guifg=cyan ctermfg=cyan
