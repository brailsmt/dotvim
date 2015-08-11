"############################################################################
"#    Vim config (Recommended) from Appendix C of "Perl Best Practices"     #
"#     Copyright (c) O'Reilly & Associates, 2005. All Rights Reserved.      #
"#  See: http://www.oreilly.com/pub/a/oreilly/ask_tim/2001/codepolicy.html  #
"############################################################################

" From Perl Best Practices" by Damian Conway and O'Reilly books
set autoindent                    "Preserve current indent on new lines
set textwidth=78                  "Wrap at this column
set backspace=indent,eol,start    "Make backspaces delete sensibly
 
set tabstop=4                     "Indentation levels every four columns
set expandtab                     "Convert all tabs typed to spaces
set shiftwidth=4                  "Indent/outdent by four columns
set shiftround                    "Indent/outdent to nearest tabstop
 
set matchpairs+=<:>               "Allow % to bounce between angles too
 
"Inserting these abbreviations inserts the corresponding Perl statement...
"iab phbp  #! /usr/bin/perl -w      
"warn Dumper [];ita::Dumper 'Dumper';
"cmpthese -10, {};     k qw( cmpthese );
"### pusc  use Smart::Comments;
"iab putm  use Test::More qw( no_plan );
" 
" iab papp  r ~/.code_templates/perl_application.pl
" iab pmod  r ~/.code_templates/perl_module.pm

nmap <leader>pudd ouse Data::Dumper;<esc>
nmap <leader>pusw ouse strict;<cr>use warnings;<esc>
nmap <leader>pucc ouse Carp qw( croak carp );<esc>
nmap <leader>pure ouse Regexp::Common qw(  );<esc>hhi

"Some perl settings
let perl_string_as_statement=1

compiler perl

hi perlStringStartEnd ctermfg=white cterm=bold

