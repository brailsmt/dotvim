"	This file creates templates for .cpp files from the .h file of the same
"	name, or based on a template in ~/.vim/templates.
"	Author:		Michael Brailsford <brailsmt@yahoo.com>
" 	Copyright:	2002 Michael Brailsford
"	Version:	0.25
"	License:	This is released under the terms of the BSD license.  The text
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
"	Documentation:
"		This script looks for the file ~/.vim/templates/template.cpp.  In that
"		file are several fields that this looks for and will replace with the
"		information it parsed from the header file.  if you have a header file
"		in a source directory and you want to create the .cpp source file for
"		it then ":e file.cpp" (or :sp, i use a script that allows easy
"		alternation via ":A") will create file.cpp based on the existing
"		file.h header.  The tags which tmp_gen searches for are:
"
"		<FILENAME> -- will be replaced with the name of the class in lowercase.
"		<YEAR>     -- will be replaced by the current year with century.
"		<DEFINE>   -- will be replaced with the name of the class in uppercase
"		<HEADER>   -- the same as <FILENAME>
"		<CLASSNAME>-- replaced with the name of the class, preserves the case
"		<TIMESTAMP>-- replaced with the timestamp in the following format "Sun Nov 24 01:51:27 MST 2002"
"		<CONSTRUCTORS>  -- replaced by the constructors from the header file,
"			the constructors also will have the data members in the body, to
"			make it easier to initialize them (saves lots of typing).
"		<METHODS>       -- replaced by the methods from the header file,
"			including the argument lists, though no names are given to the
"			parameters.
"
"		This list of tags will grow.
"
"	Installation:
"		In order to get this to work, put the following line your .vimrc.
"
"		au bufnewfile *.cpp call Make_cpp_template()

function! Make_cpp_template()
ruby <<END

require "tmpl_gen.rb"

src = SourceFile.new
src.make_source_file

END
endfunction

" vim: set ts=4 sw=4:
