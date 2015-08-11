"This file contains some misc vim functions to use for my own purposes

"{{{
function! PrintFoldMarker() range
  let fl = getline(a:firstline)
  let ll = getline(a:lastline)
  let l:lastline = a:lastline
  "deal with the last line  {{{
    if exists("b:commentchars") > 0 
        execute l:lastline
        if match(ll, b:commentchars) >= 0
            execute "norm! A  ".g:closemarker
        else
            let tmp = b:commentchars.g:closemarker
            if match(b:commentchars, '\$\$\$') >= 0
                let tmp = substitute(b:commentchars, "\\$\\$\\$", g:closemarker, "")
            end
            execute "norm! o".tmp
        endif
        "}}}
        "deal with the first line {{{
        execute a:firstline
        if exists(b:commentchars) != 0 && match(fl, b:commentchars) >= 0
            execute "norm! A  ".g:openmarker
        else 
            let tmp = b:commentchars.g:openmarker
            if match(b:commentchars, '\$\$\$') >= 0
                let tmp = substitute(b:commentchars, "\\$\\$\\$", g:openmarker, "")
            end
            execute "norm! O".tmp
        endif
        "}}}
    endif
endfunction
"}}}
"{{{
function! Make_GDB_Breakpoint_At_Cursor()
  let ln = line(".")
  let fname = bufname("%")
  let fn = substitute(fname, '.*\/', "", "")
  sp .gdbinit
  1
  exec "norm! Obreak " fn ":" ln
  unlet ln
  unlet fname
  unlet fn
endfunction
"}}}
"{{{
function! Make_JDB_Breakpoint_At_Cursor()
  let ln = line(".")
  let fname = bufname("%")
  let fn = substitute(fname, '.*\/', "", "")
  sp .jdbrc
  1
  exec "norm! Ostop at " fn ":" ln
  unlet ln
  unlet fname
  unlet fn
endfunction
"}}}
""{{{
"function! EclimCodeCompleteForward()
"  if pumvisible()
"    return "\<c-p>"
"  else
"    return "\<c-x>\<c-u>"
"  endif
"endfunction
""}}}
""{{{
"function! EclimCodeCompleteReverse()
"  if pumvisible()
"    return "\<c-n>"
"  else
"    return "\<c-x>\<c-u>"
"  endif
"endfunction 
""}}}
"{{{
function! InsertTabWrapper()  
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k\|\.'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
"}}}
"{{{
function! RevInsertTabWrapper() 
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k\|\.'
    return "\<tab>"
  else
    return "\<c-n>"
  endif
endfunction
"}}}
"{{{
function! HungryBackspaceWrapper()  
  let column = col('.')
    if column == 1
        return "\<esc>kJxi"
    elseif column >= 2 && getline('.')[column - 2] =~ '\S'
    return "\<bs>"
  else
    return "\<Esc>d?\\S?e1\<CR>i"
  endif
endfunction
"}}}
"{{{
function! Resize()
  set lines=50
  set co=140
endfunction
"}}}
"{{{
function! Cscope_Setup()
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
  endif
endfunction
"}}}
"{{{
function! GetFoldedHeader()
  let numlines_folded = v:foldend - v:foldstart + 1
  let line_num = v:foldstart
  let firstline = getline(v:foldstart)

  let charline = matchstr(firstline, '^\s*\(<[^!]\|\w\+\)[^{}]*')

  " Handle javadoc style comments, display the javadoc summary as the foldtext
  if match(firstline, '^\s*\/\*\*') == 0
    if match(firstline, '^\s*\/\*\*\s*$') == 0
      let charline = substitute(getline(v:foldstart+1), '^\s*\**\s*', '(doc) ', '')
      let charline = substitute(charline, '\..*$', '.', ''et 
    else
      let charline = substitute(firstline, '\s*\/\*\*\s*', '', '')
    endif
  elseif match(firstline, '^\s*\/\/\s*[^{}]') == 0
    if match(getline(v:foldend), '^\s*\/\/') == 0
      let charline = substitute(firstline, '\s*\/*\s*', '', '')
    endif
  else
    let charline = matchstr(firstline, '^\s*\%(<[^!]\|\w\+\)[^{}]*')
    while strlen(charline) == 0 && line_num < v:foldend
      let line_num = line_num + 1
      let charline = matchstr(getline(line_num), '^\s*\%(<[^!]\|\w\+\)[^{}]*')
    endw
  endif

  let preamble = printf("[%d lines folded]:", numlines_folded)
  return printf("%-20s%s", preamble, substitute(charline, '^\s*', '', ''))
endfunction
"}}}
"{{{
function! Ender()
  let endchar = nr2char(getchar())
  execute "normal \<End>a".endchar
  normal `e
endfunction 
"}}}
"{{{
function! NetReadFixup(method,line1,line2)
   " a:line1: first new line in current file
   " a:line2: last  new line in current file
   if     a:method == 1 "rcp
   elseif a:method == 2 "ftp + <.netrc>
   elseif a:method == 3 "ftp + machine,uid,password,filename
   elseif a:method == 4 "scp
   elseif a:method == 5 "http/wget
   elseif a:method == 6 "dav/cadaver
   elseif a:method == 7 "rsync
   elseif a:method == 8 "fetch
   elseif a:method == 9 "sftp
   else               " complain
   endif
endfunction
"}}}

" these all require ruby
""{{{
"function! Add_Id_Tag()
"ruby <<END
" c = $curbuf
"    c.append 0, "// $Id$" if c[1].scan(/\$Id:?.*$/).empty?
"END
"endfunction
""}}}
""{{{
function! Make_Java_SourceTemplate()
ruby <<END
 c = $curbuf
 buf_name = File.basename(c.name, '.java');
    buf_name.capitalize!

 c.append 0, "package //PACKAGE NAME"
 c.append 1, ""
 c.append 3, "/**"
 c.append 4, " *  "
 c.append 5, " *  @author Michael Brailsford (mb013619)"
 c.append 6, " */"
    c.append 7, "public class #{buf_name} {"
 c.append 8, ""
    c.append 9, "    public #{buf_name}() {"
    c.append 10, "    }"
 c.append 11, ""
    c.append 12, "}"

    VIM::command ":5"

END
endfunction
"}}}
""{{{
"function! Make_C_SourceTemplate()
"ruby <<END
" c = $curbuf
" buf_name = c.name.gsub(/.*\//, '')
"
" c.append 0, "/* file name  : #{buf_name}"
" c.append 1, " * authors    : Michael Brailsford"
" c.append 2, " * created    : #{Time.now}"
" c.append 3, " * copyright  : (c) #{Time.now.year} Michael Brailsford"
" c.append 4, " */"
" buf_name.gsub! /\..*/, ''
" if c.name =~ /\.h$/
"   buf_name.capitalize!
"   def_name = buf_name.upcase + "_H"
"   c.append 5, ""
"   c.append 6, "#ifndef #{def_name}"
"   c.append 7, "#define #{def_name}"
"   c.append 8, ""
"   c.append 9, "class #{buf_name} {"
"   c.append 10, "\tprivate:"
"   c.append 11, "\tprotected:"
"   c.append 12, "\tpublic:"
"   c.append 13, "\t\t#{buf_name}();"
"   c.append 14, "\t\t#{buf_name}(#{buf_name} &);"
"   c.append 15, "\t\t~#{buf_name}();"
"   c.append 16, "};"
"   c.append 17, "#endif"
"   VIM::command ":16"
" elsif c.name =~ /\.cpp$/
"   c.append 5, ""
"   c.append 6, "#include \"#{buf_name.downcase}.h\""
"   c.append 7, "//{{{"
"   c.append 8, "#{buf_name}::#{buf_name}() {"
"   c.append 9, "}"
"   c.append 10, "//}}}"
"   c.append 11, "//{{{"
"   c.append 12, "#{buf_name}::#{buf_name}(#{buf_name} & other) {"
"   c.append 13, "}"
"   c.append 14, "//}}}"
"   c.append 15, "//{{{"
"   c.append 16, "#{buf_name}::~#{buf_name}() {"
"   c.append 17, "}"
"   c.append 18, "//}}}"
"   VIM::command ":7"
" end
"
"END
"endfunction
""}}}
""{{{
function! Make_Ruby_Template()
ruby <<END
  #Inserts a source template for ruby files
  
  #This is to avoid these cvs token from being expanded when this file is commited to cvs.
  rev_key_word = "Revizion"
  log_key_word = "Loz"
  
  line=0
  c = $curbuf
  c.append line   , "#!/usr/bin/env ruby"
  c.append line+=1, "# author:     Michael Brailsford"
  c.append line+=1, "# created:    #{Time.now}"
  c.append line+=1, "# contents:   "
  c.append line+=1, ""
  $curwin.cursor = [7, 15]
END
endfunction
""}}}
""{{{
"function! Makecoutstatements()
"ruby <<END
" ln, c = $curwin.cursor
" bufname = $curbuf.name.gsub(/\.c(pp)?/, '_DEBUG')
" bufname = bufname.split("/").last
" bufname.upcase!
"
" isdefined = false
" firsttime = true
" defline = 6
" high_count = 0
" tmp_str = ""
" (1..30).each { |n|
"   unless isdefined
"     line = $curbuf[n]
"     case line
"       when /^\/\/#define #{bufname}(_[0-9]+)?$/
"         firsttime = false
"         tmp = line.split "_"
"         tmp_str = ""
"         if tmp.last
"           high_count = tmp.last.to_i.succ unless tmp.last.to_i < high_count
"         else
"           high_count = 1
"         end
"         tmp_str << "#{bufname}_#{high_count.to_s}" unless high_count == 0
"         when /^#define #{bufname}(_[0-9]+)?$/
"           firsttime = false
"           isdefined = true
"           bufname = line.split[1]
"       end
"   end
" }
" unless firsttime
"   bufname = tmp_str unless isdefined
" end
" $curbuf.append(ln, "#endif")
" $curbuf.append(ln-1, "#ifdef #{bufname}")
"
" $curbuf.append defline, "#define #{bufname}" unless isdefined
"
" ln = ln.succ unless isdefined
" $curwin.cursor = [ln+2, c]
"END
"endfunction
""}}}
""{{{
"function! Comment_uncomment_defines(def_name)
"ruby <<END
" def_name = VIM.evaluate "a:def_name"
"
" (1..45).each { |line_num|
"   line = $curbuf[line_num]
"   if line =~ /^#define #{def_name}/
"     $curbuf[line_num] = "//#{line}"
"   elsif line =~ /^\/\/#define #{def_name}/
"     $curbuf[line_num] = line.sub(/\/\//, '')
"   end
" }
"END
"endfunction
""}}}
""{{{
"function! Make_Method_From_Definition()
"ruby << END
" b = $curbuf
"
"
"END
"endfunction
""}}}
""{{{
"function! Create_source_header_footer()
"ruby <<END
"
" b = $curbuf
" buf_name = b.name.gsub(/.*\//, '')
" #this is a kludge to avoid cvs changing this script when it is checked into cvs
" rev_key_word = "Revizion"
" log_key_word = "Loz"
"
" b.append 0, "/* file name       : #{buf_name}"
" b.append 1, " * contributors    : Michael Brailsford"
" b.append 2, " * header inserted : #{Time.now}"
" b.append 3, " * copyright       : (c) #{Time.now.year} Michael Brailsford"
" b.append 4, " * version         : $#{rev_key_word.gsub /z/, 's'}$"
" b.append 5, " */"
" b.append 6, ""
" b.append 7, ""
"
" b.append b.count, "/*"
" b.append b.count, " * change log"
" b.append b.count, " *"
" b.append b.count, " * $#{log_key_word.gsub /z/, 'g'}$"
" b.append b.count, " */"
"
"END
"endfunction
""}}}
