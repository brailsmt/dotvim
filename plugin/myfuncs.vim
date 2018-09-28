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
