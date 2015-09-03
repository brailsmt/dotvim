"$Revision: 1.9 $
" vim: fdm=marker

set t_kb=

"Turn on syntax highlighting  {{{
if !exists("syntax_on")
   syntax on
endif
"}}}

" Vundle plugin definitions
"{{{
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" alternatively, pass a path where Vundle should install plugins
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'airblade/vim-gitgutter'
Plugin 'brailsmt/vim-plugin-minibufexpl' " minibufexpl with some enhancements
Plugin 'dln/avro-vim'                    " avro syntax file
Plugin 'gmarik/Vundle.vim'               " Vundle
Plugin 'guns/vim-clojure-static'         " something something clojure
Plugin 'kien/ctrlp.vim'                  " ctrl-p - fuzzy filename searc
Plugin 'kien/rainbow_parentheses.vim'    " make lisp parens all pretty
Plugin 'rking/ag.vim'                    " super fast grep, but better
Plugin 'scrooloose/nerdtree'             " file browser
Plugin 'scrooloose/syntastic'            " syntax check on file save
Plugin 'sjl/gundo.vim'                   " visualize vim's undo tree
Plugin 'tfnico/vim-gradle'               " gradle stuff
Plugin 'tpope/vim-dispatch'              " async for vim commands
Plugin 'tpope/vim-fireplace'             " lisp repl-y stuff
Plugin 'tpope/vim-fugitive'              " Work with git within vim
Plugin 'vim-ruby/vim-ruby'               " ruby stuff
Plugin 'Valloric/YouCompleteMe'          " complete as you type super smart completion

" Plugins I used to use
"Plugin 'molok/vcscommand.vim'            " work with VCS
" All of your Plugins must be added before the following line
call vundle#end()            " required
"}}}

"Some custom default settings {{{
   colorscheme midnight2          " set default colorscheme to midnight2
   "let g:ctags_path='C:\Documents and Settings\michael.brailsford\bin\ctags.exe'
   "let Tlist_Ctags_Cmd = g:ctags_path

   filetype plugin indent on      " Turn filetype indent and plugins on
   set tabstop=4                  " set tabstop to 4
   set shiftwidth=4               " make tabs be the same width as 4 spaces
   set backspace=2                " make backspace work how I expect
   set textwidth=120              " 80 is the standard, too bad, 100 makes more sense nowadays
   set nocompatible               " why would I not want to use all of vim's features?
   set nobackup                   " these files get annoying, so turn it off
   set nohlsearch                 " highlighting the current search is annoying
   set incsearch                  " convenient when typing in a regex
   set ruler                      " show cursor position
   set showmatch                  " temporarily highlight the matching parens, brackets, etc...
   set modeline                   " this will allow modelines to work
   set formatoptions=tcqn         " This is my preference
   set guioptions-=T              " give me more screen real estate
   set guioptions-=m              " ditto
   set guioptions-=r              " ditto
   set guioptions-=l              " ditto
   set guioptions-=L              " ditto
   set foldcolumn=2               " make the nice little fold column 2 cols wide
   set history=1000               " set the command history to 1000 entries
   set wrapscan                   " allow searches to wrap around the end of the file
   set tags=../*/tags,tags;          " This searches for a tags file from the cwd to the root of the filesystem
   set formatprg=astyle           " astyle is a good source code reformatter
   set number                     " turn on line numbering
   set laststatus=2               " always display the status line
   set awa                        " Autosave always instead of prompting
   set viminfo='25,<100,:100,s5   " Some viminfo settings
   set scrolloff=5                " Leave 5 lines above and below the cursor when at top and bottom of screen
   set ul=5000                    " Set the max number of undos
   set undofile
   set undodir=~/.vim/undos
   set vb                         " Set visual bell
   set fillchars=fold:-           " Fill the fold line with spaces (type alt-space to get the fill char)
   "set foldmethod=marker          " Fold manually to maintain control
   "set foldmarker={,}
   set foldnestmax=2
   set foldmethod=syntax          " Fold according to syntax, not as nice as marker, but co-workers don't like the markers
   set diffopt=filler,iwhite      " ignore whitespace when diffing...
   set wildmenu                   " term menus for command mode
   set wildmode=list:longest,full " ditto
   set wildignore+=*.class,.svn,META-INF,target,.git 
   set backspace=indent,eol,start " Make backspaces delete sensibly
   set expandtab                  " Convert all tabs typed to spaces
   set shiftround                 " Indent/outdent to nearest tabstop
   set matchpairs+=<:>            " Allow % to bounce between angles too
   set shellslash

   set cinoptions=>1s,:1s,p1s,t0,g0               " whatever this does, I like it :)
   set cinwords=if,else,while,do,for,switch,case  " these are pretty good defaults

   "Set my statusline
   set statusline=%<%f\ %h%m%r\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ %=%l,%c%V\ \ \ \ \ %P
   set foldtext='+'.v:folddashes.substitute(GetFoldedHeader(),'\\\/\\\/\\\|\\*\\','','g')


   "if this does not hold for a particular language change it in after/syntax/XXX.vim
   let b:commentchars="//"
   let g:openmarker="\{\{\{"  "This is for my folding function
   let g:closemarker="\}\}\}" "This is for my folding function

   "These settings are for minibufexpl.vim plugin
   "let g:miniBufExplVSplit=20
   "let g:miniBufExplBRSplit=1
   let g:miniBufExplHideWhenDiff=1
   let g:miniBufExplMaxSize=2
   "let g:miniBufExplDebugMode = 0
   "let g:miniBufExplDebugLevel = 9

   "These settings are for the vimspell plugin
   "let spell_executable="aspell"
    
   "VCSCommand plugin settings
   let VCSCommandDeleteOnHide=1  "Delete temporary VCS buffers when the window is closed

   "use the_silver_searcher to weed out any VCS files and be super fast
   set grepprg=ag\ -f\ --nogroup\ --column
   set grepformat=%f:%l:%c:%m

   " Settings for JavaImp for generating java import statements
   let g:JavaImpSortJavaFirst = 1
   let g:JavaImpSortBin = "" 
   let g:JavaImpPaths=""
   let g:JavaImpDataDir='/home/michaelb/.vim/.javaimp'

   " ctrlp options
   let g:ctrlp_working_path_mode=0
   let g:ctrlp_regexp=0
   let g:ctrlp_by_filename=1
   let g:ctrlp_user_command='ag %s -U -f -l --nocolor -g ""'
   let g:ctrlp_use_caching=0
   
   " ag options
   let g:agprg="ag\ -f\ --column"

   let g:EclimCompletionMethod = 'omnifunc' 

    " Rainbow parentheses colors.
    " Left column is for terminal environment.
    " Right column is for GUI environment.
    " Outermost is determined by last.
    let g:rbpt_colorpairs = [
        \ ['blue',        '#FF6000'], 
        \ ['cyan',        '#00FFFF'], 
        \ ['darkmagenta', '#CC00FF'], 
        \ ['yellow',      '#FFFF00'], 
        \ ['red',         '#FF0000'], 
        \ ['darkgreen',   '#00FF00'], 
        \ ['White',       '#c0c0c0'], 
        \ ['blue',        '#FF6000'], 
        \ ['cyan',        '#00FFFF'], 
        \ ['darkmagenta', '#CC00FF'], 
        \ ['yellow',      '#FFFF00'], 
        \ ['red',         '#FF0000'], 
        \ ['darkgreen',   '#00FF00'], 
        \ ['White',       '#c0c0c0'], 
        \ ['blue',        '#FF6000'], 
        \ ['cyan',        '#00FFFF'], 
        \ ['darkmagenta', '#CC00FF'], 
        \ ['yellow',      '#ffff00'], 
        \ ['red',         '#ff0000'], 
        \ ['darkgreen',   '#00ff00'], 
        \ ['White',       'orange' ], 
        \ ]

   let g:rbpt_max = 21
   let g:rbpt_loadcmd_toggle = 0


   " YouCompleteMe settings
   let g:ycm_complete_in_comments=1 
   let g:ycm_complete_in_strings=1 
   let g:ycm_autoclose_preview_window_after_completion=1
   let g:ycm_key_list_select_completion=['<TAB>', '<Down>']

   " Gundo options
   let g:gundo_preview_bottom = 1
   let g:gundo_right = 1

   " syntastic options
   let g:syntastic_java_javac_config_file_enabled = 1
   let g:syntastic_always_populate_loc_list = 1
   let g:syntastic_check_on_open = 0
   let g:syntastic_check_on_wq = 0
   let g:syntastic_mode_map = { 'mode': 'passive' }

"}}}
"keymaps {{{
"This used to be provided by minibufexpl.vim but isn't anymore.  Which is sad, but here it is now.

"map the tab completion
inoremap <silent> <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <silent> <s-tab> <c-r>=RevInsertTabWrapper()<cr>
inoremap <silent> <c-tab> <tab>

" Toggle hlsearch on and off
nmap <silent> <leader>hl :set hlsearch! hlsearch?<cr>

" map 'zf' to print foldmarkers
map  <silent> zf :call PrintFoldMarker()<cr>

" map 'cd' to change vim's internal working dir to the dir of the currently opened buffer
nmap <silent> cd :CD<cr>

" Opens the header file for a .c/.cpp file or vice-versa in a split window 10 lines high
nmap <silent> <leader>a :AS<cr>z10<cr><c-w>j

" map 'm=' to add the gui toolbar
nmap <silent> m= :set guioptions+=m<cr>

" map 'm- to remove the gui toolbar
nmap <silent> m- :set guioptions-=m<cr>

" Set a GDB breakpoint on the line the cursoe is on
nmap <silent> <leader>gdb :call Make_GDB_Breakpoint_At_Cursor()<cr>
nmap <silent> <leader>jdb :call Make_JDB_Breakpoint_At_Cursor()<cr>

" fold the code block using '\\'
nmap <silent> <leader><leader> V%zf

" make '\syn' sync the syntax from the top of the file
nmap <silent> <leader>syn :syn sync fromstart<cr>

" map 'dp' put the difference to the other buffer and jump to the next difference
nmap <silent> dp dp]c
" map 'do' obtain the difference from the other buffer and jump to the next difference
nmap <silent> do do]c

" map '\re' to resize the current buffer to the full height of the window
nmap <silent> <leader>re 80<c-w>+280<c-w>>
nmap <silent> <leader>hre 80<c-w>+
nmap <silent> <leader>vre 280<c-w>>

"The following maps are shortcuts to editing various config files
if has("win16") || has("win32") || has("win64")
    nmap <silent> <leader>rc :sp ~/_vimrc<cr>
    nmap <silent> <leader>src :so ~/_vimrc<cr>
    nmap <silent> <leader>mid :sp ~/vimfiles/colors/midnight2.vim<cr>
    nmap <silent> <leader>my :sp ~/vimfiles/macro/myfuncs.vim<cr>
    nmap <silent> <leader>smy :so ~/vimfiles/macro/myfuncs.vim<cr>
else
    nmap <silent> <leader>rc :sp ~/.vimrc<cr>
    nmap <silent> <leader>src :so ~/.vimrc<cr>
    nmap <silent> <leader>mid :sp ~/.vim/colors/midnight2.vim<cr>
    nmap <silent> <leader>my :sp ~/.vim/macro/myfuncs.vim<cr>
    nmap <silent> <leader>smy :so ~/.vim/macro/myfuncs.vim<cr>
endif

" remap arrow keys to jump to compile errors/warnings with eclim

nmap <silent> <leader>lc :call SetLocationMode()<cr>
nmap <silent> <leader>qf :call SetQuickfixMode()<cr>
function! SetLocationMode() 
    nmap <silent> <right>      :lnext<cr>
    nmap <silent> <left>       :lprevious<cr>
    nmap <silent> <up>         :lrewind<cr>
    nmap <silent> <down>       :lopen 5<cr>
    nmap <silent> <down><down> :lclose<cr>
endfunction
function! SetQuickfixMode()
    nmap <silent> <right>      :cnext<cr>
    nmap <silent> <left>       :cprevious<cr>
    nmap <silent> <up>         :crewind<cr>
    nmap <silent> <down>       :copen 5<cr>
    nmap <silent> <down><down> :cclose<cr>
endfunction
call SetQuickfixMode()

nmap <leader>nt :NERDTreeToggle<cr>

" syntastic mappings
nmap <silent> <leader>sc :SyntasticCheck<cr> | :call SetLocationMode()<cr>

"Add a mark in the current buffer that will cause vimdiff to align this with the other window on a
"specific line.
nmap <silent> <leader>da O<esc>80I=<esc>j

" Grep the :pwd directory for the word under the cursor
nmap <silent> <leader>gr :Ag <C-R>=expand("<cword>")<cr><cr>
"}}}
"Source other configuration oriented files   {{{
ru! macro/myfuncs.vim
ru! macro/scheme_func.vim
ru! macro/fortunes.vim
ru! macros/matchit.vim
ru! ftplugin/man.vim

"}}}
"Custom auto commands  {{{
if !exists("set_au")
   let set_au = 1
   " C/C++ autocommands
   au bufnewfile *.c,*.cpp,*.h call Make_C_SourceTemplate()
   au bufreadpost *.cpp,*.c,*.h call Generate_Highlighting()
   au bufnewfile *.java call Make_Java_SourceTemplate()
   au bufreadpost *.cpp,*.c,*.h,*.java syn match semicolon #;$# | hi semicolon guifg=red gui=bold ctermfg=1

   au bufreadpost *.clj set foldmethod=marker
 
   " Various autocommands
   au bufreadpre,bufnewfile *.story set ft=jbehave
   au bufreadpre,bufnewfile *.bnf set ft=bnf
   au bufreadpre,bufnewfile gdbconf set ft=gdb
   au bufreadpre,bufnewfile *.wiki set ft=mediawiki
   au bufreadpre,bufnewfile *.ezt set ft=ezt
   au bufreadpre,bufnewfile *.ddl,*.dml set ft=sql
   au bufnewfile *.rb call Make_Ruby_Template()
   au bufreadpre,bufnewfile build.gradle,gradle.* set ft=groovy

   " Settings for log files
   au bufreadpre,bufnewfile *.log set nowrap

   " Set syntax to markdown for all *.md files
   au bufnewfile,bufreadpost *.md set ft=markdown
endif
"}}}
"cscope settings {{{
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    "set nocsverb
    set cscopequickfix=s-,g-,d-,c-,t-,i-
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    " add database pointed to by environment
    if filereadable($CSCOPE_DB_BASE . "/cscope.out")
        cs add $CSCOPE_DB_BASE/cscope.out
    endif
    set csverb
    nmap <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>gs :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>gg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>gd :cs find d <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>gc :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>gt :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>gi :cs find i <c-r>=expand("%")<cr><cr>
else
    set csto=1
endif
"}}}
