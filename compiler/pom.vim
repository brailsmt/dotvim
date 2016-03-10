
let current_compiler = "pom"

if exists(":CompilerSet") != 2 " older Vim always used :setlocal
    command! -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=mvn\ dependency:build-classpath\ -Dmdep.outputFile=.classpath

" POM related messages
CompilerSet errorformat=%E[ERROR]\ %#Non-parseable\ POM\ %f:\ %m\ %#\\@\ line\ %l\\,\ column\ %c%.%#,%Z,
CompilerSet errorformat+=%+E[ERROR]\ %#Malformed\ POM\ %f:%m\ %#\\@\ %.%#\\,\ line\ %l\\,\ column\ %c%.%#,%Z,

" Misc message removal
CompilerSet errorformat+=%-G%.%#,%Z
