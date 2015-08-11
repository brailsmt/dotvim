" Vim Compiler plugin for Maven

if exists("current_compiler")
    finish
endif
let current_compiler = "maven2"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=mvn\ package

"CompilerSet errorformat=File:%f,
"    \%-G[%\\(WARNING]%\\)%\\@!%.%#,
"    \%A%[%^[]%\\@=%f:[%l\\,%v]\ %m,
"    \%W[WARNING]\ %f:[%l\\,%v]\ %m,
"    \%-Z\ %#,
"    \%-Clocation\ %#:%.%#,
"    \%C%[%^:]%#%m,
"    \%-G%.%#,

CompilerSet errorformat=
    \%-G[%\\(ERROR]%\\)%\\@!%.%#,
    \%A%[%^[]%\\@=%f:[%l\\,%v]\ %m,
    \%E[ERROR]\ %f:[%l\\,%v]\ %m,
    \%-Z\ %#,
    \%-Clocation\ %#:%.%#,
    \%C%[%^:]%#%m,
    \%-G%.%#
    "\%C[ERROR]\ %*symbol\\s%#:%m,
