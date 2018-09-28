"$Revision: 1.9 $
" vim: fdm=marker

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:python_host_prog='/usr/local/bin/python'
"set t_kb=

" plugin definitions
"{{{
call plug#begin("~/.vim/vim-plug")

" let vim-plug manage plugins
Plug 'airblade/vim-gitgutter'
Plug 'brailsmt/vim-plugin-minibufexpl' " minibufexpl with some enhancements
Plug 'brailsmt/clide-vim'
Plug 'dln/avro-vim'                    " avro syntax file
Plug 'guns/vim-clojure-static'         " something something clojure
Plug 'kien/ctrlp.vim'                  " ctrl-p - fuzzy filename searc
Plug 'rking/ag.vim'                    " super fast grep, but better
Plug 'scrooloose/nerdtree'             " file browser
Plug 'scrooloose/nerdcommenter'        " comment plugin
Plug 'sjl/gundo.vim'                   " visualize vim's undo tree
Plug 'tfnico/vim-gradle'               " gradle stuff
Plug 'tpope/vim-fireplace'             " lisp repl-y stuff
Plug 'tpope/vim-fugitive'              " Work with git within vim
Plug 'vim-ruby/vim-ruby'               " ruby stuff
Plug 'ervandew/supertab'               " supertab
Plug 'pgdouyon/vim-accio'
Plug 'rizzatti/dash.vim'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'airblade/vim-rooter'
Plug 'vim-airline/vim-airline'
function! DoRemote(arg)
	UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" All of your Plugins must be added before the following line
call plug#end()            " required
"Plug 'Valloric/YouCompleteMe'          " complete as you type super smart completion
"Plug 'kien/rainbow_parentheses.vim'    " make lisp parens all pretty
"Plug 'benekastah/neomake'
"Plug 'scrooloose/syntastic'            " syntax check on file save
"}}}

"Some custom default settings 
"{{{
colors midnight2

" These settings are required for vim only, nvim has them as defaults
if !has('nvim')
	set backspace=indent,eol,start " Make backspaces delete sensibly
	set formatoptions=tcqnjl       " This is my preference
	set history=10000              " set the command history to 10000 entries
	set incsearch                  " convenient when typing in a regex
	set laststatus=2               " always display the status line
	set wildmenu                   " term menus for command mode
	set viminfo='1000,<100,s5      " viminfo is...cryptic, see :help 'viminfo'
else
	set shada='1000,<100,s5        " shada is...cryptic, see :help 'viminfo'
endif

set awa                        " Autosave always instead of prompting
set diffopt=filler,iwhite      " ignore whitespace when diffing...
set expandtab                  " Convert all tabs typed to spaces
set fillchars=fold:-           " Fill the fold line with spaces (type alt-space to get the fill char)
set foldcolumn=2               " make the nice little fold column 2 cols wide
set foldmethod=syntax          " Fold according to syntax, not as nice as marker, but co-workers don't like the markers
set foldnestmax=2
set formatoptions+=nl          " This is my preference
"set formatprg=astyle           " astyle is a good source code reformatter
set guioptions-=TLlmr          " give me more screen real estate
set matchpairs+=<:>            " Allow % to bounce between angles too
set modeline                   " this will allow modelines to work
set nobackup                   " these files get annoying, so turn it off
set nohlsearch                 " highlighting the current search is annoying
set number                     " turn on line numbering
set ruler                      " show cursor position
set scrolloff=5                " Leave 5 lines above and below the cursor when at top and bottom of screen
set shellslash
set shiftround                 " Indent/outdent to nearest tabstop
set shiftwidth=4               " make tabs be the same width as 4 spaces
set showmatch                  " temporarily highlight the matching parens, brackets, etc...
set tabstop=4                  " set tabstop to 4
set tags=../*/tags,tags;       " This searches for a tags file from the cwd to the root of the filesystem
set textwidth=120              " 80 is the standard, too bad, 100 makes more sense nowadays
set ul=5000                    " Set the max number of undos
set undodir=~/.vim/undos
set undofile
set vb                         " Set visual bell
set wildignore+=*.class,.svn,META-INF,target,.git 
set wildmode=list:longest,full 
set wrapscan                   " allow searches to wrap around the end of the file

set cinoptions=>1s,:1s,p1s,t0,g0               " whatever this does, I like it :)
set cinwords=if,else,while,do,for,switch,case  " these are pretty good defaults

"Set my statusline
"set statusline=%t\ \ \ %<(%{fugitive#head()})\ \ \ \ %{expand(\"%:h\")}%h%m%r%=[%{accio#statusline()}]\ \ \ \ \ \ %l,%c%V\ \ \ \ \ %P
set foldtext='+'.v:folddashes.substitute(GetFoldedHeader(),'\\\/\\\/\\\|\\*\\','','g')

" When a file is shell, treat is as bash
let g:is_bash=1

"if this does not hold for a particular language change it in after/syntax/XXX.vim
let b:commentchars="//"
let g:openmarker="\{\{\{"  "This is for my folding function
let g:closemarker="\}\}\}" "This is for my folding function

" minibufexpl.vim settings
""{{{
"let g:miniBufExplVSplit=20
"let g:miniBufExplBRSplit=1
let g:miniBufExplHideWhenDiff=1
let g:miniBufExplMaxSize=2
"let g:miniBufExplDebugMode = 0
"let g:miniBufExplDebugLevel = 9  
"}}}

" Settings for JavaImp for generating java import statements
"{{{
let g:JavaImpSortJavaFirst = 1
let g:JavaImpSortBin = "" 
let g:JavaImpPaths=""
let g:JavaImpDataDir='/home/michaelb/.vim/.javaimp'
"}}}

" ctrlp options
"{{{
let g:ctrlp_working_path_mode=0
let g:ctrlp_regexp=0
let g:ctrlp_by_filename=1
let g:ctrlp_user_command='ag %s -U -f -l --nocolor -g ""'
let g:ctrlp_use_caching=0
"}}}

" ag options
"{{{
set grepprg=ag\ -f\ --nogroup\ --column
set grepformat=%f:%l:%c:%m
let g:ag_prg="ag\ -f\ --column"  
"}}}

" Rainbow parentheses colors.
"{{{
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
"}}}

" YouCompleteMe settings
"{{{
let g:ycm_complete_in_comments=1 
let g:ycm_complete_in_strings=1 
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_key_list_select_completion=['<TAB>', '<Down>']
"}}}

" Gundo options
"{{{
let g:gundo_preview_bottom = 1
let g:gundo_right = 1
"}}}

" NERDTree and NERDCommenter settings 
" {{{
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDDefaultNesting = 1
nmap <leader>nt :NERDTreeToggle<cr>
map <silent> <leader>cc <Plug>NERDCommenterToggle
"}}}

" deoplete settings
"{{{
let g:deoplete#enable_at_startup=1
"}}}

" javacomplete2 settings
"{{{
let g:JavaComplete_ImportSortType='packageName'
let g:JavaComplete_ImportOrder = ['java.', 'javax.', 'org.', 'net.', 'com.', 'com.cerner.' ] 
"}}}

" vim-airline settings
"{{{
let g:airline_powerline_fonts=1
let g:airline_gui_mode=1
let g:airline#extensions#whitespace#enabled=0
"{{{
function! GetCwd()
    let s:pwd = expand("%:h")
    if s:pwd == '.'
        return '.  (' . expand("%:p:h:t") . ')'
    endif
    return s:pwd
endfunction
"}}}
"{{{
function! AirlineInit()
    let g:airline_section_a = airline#section#create(['%t %m%r'])
    let g:airline_section_b = airline#section#create(['%<%{fugitive#head()}'])
    let g:airline_section_c = airline#section#create(['%{GetCwd()}'])  
    let g:airline_section_x = airline#section#create(['%{accio#statusline()}'])
    let g:airline_section_y = airline#section#create(['%l,%c'])
    let g:airline_section_z = airline#section#create(['%P'])
endfunction
"}}}
au VimEnter * call AirlineInit()|AirlineRefresh
au VimEnter * AirlineTheme midnight
"}}}

" vim-rooter settings
" {{{
let g:rooter_silent_chdir = 1
let g:rooter_use_lcd = 1
au BufEnter *.java let g:rooter_patterns = ['pom.xml', '.git/', '.git']
" }}}
"}}}

"keymaps {{{
" Toggle hlsearch on and off
nmap <silent> <leader>hl :set hlsearch! hlsearch?<cr>

" map 'zf' to print foldmarkers
map  <silent> zf :call PrintFoldMarker()<cr>

" map 'cd' to change vim's internal working dir to the dir of the currently opened buffer
nmap <silent> cd :CD<cr>

" map 'm=' to add the gui toolbar
nmap <silent> m= :set guioptions+=m<cr>

" map 'm- to remove the gui toolbar
nmap <silent> m- :set guioptions-=m<cr>

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
    " this requires a symlink to ~/.vimrc
    nmap <silent> <leader>rc :sp ~/.vim/.vimrc<cr>  
    nmap <silent> <leader>src :so ~/.vimrc<cr>
    nmap <silent> <leader>mid :sp ~/.vim/colors/midnight2.vim<cr>
    nmap <silent> <leader>my :sp ~/.vim/macro/myfuncs.vim<cr>
    nmap <silent> <leader>smy :so ~/.vim/macro/myfuncs.vim<cr>
endif

" remap arrow keys to jump through location list or quickfix list
"{{{
nmap <silent> <leader>lc :call SetLocationMode()<cr>
nmap <silent> <leader>qf :call SetQuickfixMode()<cr>
function! SetLocationMode() 
    nmap <silent> <right>      :lnext<cr>
    nmap <silent> <left>       :lprevious<cr>
    nmap <silent> <up>         :lrewind<cr>
    nmap <silent> <down>       :lopen 5<cr>
    nmap <silent> <down><down> :lclose<cr> | :sign unplace *<cr>
endfunction
function! SetQuickfixMode()
    nmap <silent> <right>      :cnext<cr>
    nmap <silent> <left>       :cprevious<cr>
    nmap <silent> <up>         :crewind<cr>
    nmap <silent> <down>       :copen 5<cr>
    nmap <silent> <down><down> :cclose<cr> | :sign unplace *<cr>
endfunction
call SetQuickfixMode()
"}}}

"Add a mark in the current buffer that will cause vimdiff to align this with the other window on a
"specific line.
nmap <silent> <leader>da O<esc>80I=<esc>j

"}}}

"Source other configuration oriented files   
"{{{
ru! macro/myfuncs.vim
"}}}


"Custom auto commands  {{{
if !exists("set_au")

   autocmd BufEnter * sign define dummy 
   autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

   au filetype crontab setlocal nobackup nowritebackup

   let set_au = 1
   " Java autocommands
   "au bufnewfile *.java call Make_Java_SourceTemplate()
   au bufreadpost *.java syn match semicolon #;$#
   au bufreadpost *.java hi semicolon ctermfg=1   

   " clojure autocommands
   au bufreadpost *.clj set foldmethod=marker
   au bufreadpost *.vim set foldmethod=marker
 
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

   " Set maildrop syntax
   au bufreadpost .mailfilter set ft=maildrop

   " Set syntax to markdown for all *.md files
   au bufnewfile,bufreadpost *.md set ft=markdown
endif
"}}}
"cscope settings {{{
if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=0
    set cst
    "set nocsverb
    set cscopequickfix=s-,g-,d-,c-,t-,i-
    " add any database in current directory
    if filereadable("cscope.out")
        "cs add cscope.out
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
