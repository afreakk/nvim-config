CompilerSet makeprg=cabal\ build
" errformat from https://gist.github.com/roman/1008420
CompilerSet errorformat=
                   \%-Z\ %#,
                   \%W%f:%l:%c:\ Warning:\ %m,
                   \%E%f:%l:%c:\ %m,
                   \%E%>%f:%l:%c:,
                   \%+C\ \ %#%m,
                   \%W%>%f:%l:%c:,
                   \%+C\ \ %#%tarning:\ %m,,
