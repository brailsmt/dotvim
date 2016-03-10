
"Set the path to include the current directory and maven source directories
set path+=.,
set path+=**/src/*/java
set path+=~/dev/jdk-src/jdk/src/share/classes/

set suffixesadd+=.java

"Make vim understand Java import statements.  This is useful for 'gf' to
"navigate to files.
set include=^\s*import
set includeexpr=substitute(v:fname,'\\.','/','g')


"set tags+=/opt/tags/jdk6/tags
" If cscope is enabled, there is a jdk6 cscope database and it is not already loaded, the load the database
"if(has("cscope") && filereadable("/opt/tags/jdk6/cscope.out") && !cscope_connection(4, "/opt/tags/jdk6/cscope.out", "/opt/tags/jdk6/"))
"  cs add /opt/tags/jdk6/cscope.out /opt/tags/jdk6
"endif
