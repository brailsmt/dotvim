
let current_compiler = "hdevtools"

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=hdevtools\ check\ %
CompilerSet errorformat=
            \%-Z\ %#,
            \%W%f:%l:%v:\ Warning:\ %m,
            \%W%f:%l:%v:\ Warning:,
            \%E%f:%l:%v:\ %m,
            \%E%>%f:%l:%v:,
            \%+C\ \ %#%m,
            \%W%>%f:%l:%v:,
            \%+C\ \ %#%tarning:\ %m
