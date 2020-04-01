" ============================================
" Desc: Custom vimrc
" Auth: Jamie
" Date: 3/2/17
" ============================================
runtime macros/matchit.vim
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'Valloric/MatchTagAlways'
Plugin 'tpope/vim-fugitive'
Plugin 'jiangmiao/auto-pairs'
Plugin 'rstacruz/sparkup'

filetype plugin indent on

set lazyredraw
set shell=/bin/bash
"
" set Vim-specific sequences for RGB colors (fixes issues in tmux)
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set nofoldenable
set termguicolors
" Set colorscheme and enable truecolour
if exists('$TMUX')
    "colorscheme duotone_2
    "colorscheme gruvbox 
    colorscheme fresh 
    set bg=dark
else
    set termguicolors
    "colorscheme duotone
   colorscheme fresh 
    set bg=dark
" Disable folding
endif

" Disable bold fonts
"set t_md=
"" Only applies to gvim 
"set gfn=Source\ Code\ Pro\ Semi-Bold\ 10

set wildmenu

"This should be with statusline stuff
set laststatus=2

"" ???????????
"let g:agformat="%f:%l:%m"
"Automatic reloading of .vimrc

"set autoread
" Show which mode we are in? Dont know
"set showmode

" Autoreload vimrc when making changes to ...vimrc! Not sure this works

" Allow me to background current buffer without saving changes to it
set hidden

" Improve copying as pasting - clipboard requires vim to be built with
" +clipboard
set pastetoggle=<F2>
set clipboard=unnamedplus

" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","
map <Leader>f :find 

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-h> :nohl<CR>
vnoremap <C-h> :nohl<CR>
inoremap <C-h> :nohl<CR>

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Save and make command - calls out to gcc on current source file
noremap <C-M> :wa<CR>  :call SaveAndMake()<CR>

" Quick reload vimrc
map 11 :so %<CR>

" We should not be using arrow keys to navigate in vim. Also unmap the <esc>
" key for leaving modes, and remap it to 
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
imap jj <esc>

"easier moving of code blocks
" Try to go into visual mode (v), then select several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Enable syntax highlighting
" You need to reload this file for the change to apply
let python_highlight_file_headers_as_comments = 1
set autoindent
set cindent
syntax on

" Showing line numbers and length
"highlight LineNR ctermfg=gray13
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing

" ---------- move this to color file

"" Define where color column will be placed, and how it will look
"set colorcolumn=80


"hi CursorLineNR gui=none guibg=gray15 guifg=gray35 ctermfg=240 ctermbg=235
set cursorline

" Undefined in cterm so far
"hi Visual guifg=#FFFFFF guibg=gray30

" Useful settings
set history=700
set undolevels=700

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
"call pathogen#infect()

" Custom c<RightMouse>colours for statusline
"hi User1 ctermbg=grey ctermfg=grey   guibg=grey guifg=grey
"set statusline=%F%m%r%h%w\ %{&ff}\ {%Y}[%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline+=%1*

"" Convoluted status line config :)
au InsertEnter * call InsertStatuslineColor(v:insertmode)
"au InsertLeave * hi statusline guibg=#cfcfcf ctermfg=0 guifg=#111111 ctermbg=15

" Formats the statusline
set statusline=%f\                            " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}\|  "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=\ %{fugitive#statusline()}   " sets [branch->{branch}] if in a git repo   

set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
set statusline+=\ Chr:[%{VisualSelectionSize()}] "Number of characters in current visual selection
set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor
set guioptions-=T

" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
if &term =~ '256color'
    set t_ut=
    endif
"" Function to auto split two files and bnext when opening
"" more than one file (vsp splits vertically)
if argc() >= 2
    silent vsplit
    silent bnext
endif

function! VisualSelectionSize()
    if mode() == "v"
        " Exit and re-enter visual mode, because the marks
        " ('< and '>) have not been updated yet.
        exe "normal \<ESC>gv"
    else
        return (col("'>") - col("'<") + 1) . ' chars'
    endif
endfunction 

" Function to check if any line lengths > 80
" If so, toggle on color column as a warning
"function! LongLines()
"     let threshold = (&tw ? &tw : 80)
"     let spaces = repeat(" ", &ts)
"
"     let long_line_lens = []
"
"     let i = 1
"     while i <= line("$")
"         let len = strlen(substitute(getline(i), '\t', spaces, 'g'))
"         if len > threshold
"             call add(long_line_lens, len)
"         endif
"         let i += 1
"     endwhile
"     return long_line_lens
"endfunction
"
"function! LongLineResult()
"     if len(LongLines()) > 0
"        set colorcolumn=80
"    else
"        set colorcolumn=0
"    endif
"endfunction 
"
"function! CheckIfBufQuicklist()
"    if &buftype ==# 'quickfix'
"    return 2
"    endif
"endfunction
"augroup test
"        autocmd!
"                autocmd  bufread * call LongLineResult()
"                autocmd  bufwritepost * call LongLineResult()
"                autocmd  insertleave * call LongLineResult()
"                autocmd  bufwrite * call LongLineResult()
"augroup end

"" Auto-compile
augroup project
    autocmd!
        autocmd BufRead,BufNewFile *.h,*.c set filetype=c 
        autocmd BufRead,BufNewFile *.h,*.cpp set filetype=cpp
        autocmd BufRead,BufNewFile *.qf set syntax=qf
        "autocmd BufRead,BufNewFile,Bufwrite,bufwritepost,insertleave *.h,*.c,*.cpp  set colorcolumn=0 
        "autocmd BufRead,BufNewFile,Bufwrite,bufwritepost,insertleave *.h,*.c,*.cpp colorscheme jamie
        "autocmd BufNewFile,BufRead,BufEnter *.py colorscheme jamie
        "autocmd BufNewFile,BufRead,BufEnter,bufwritepost,insertleave *.vimrc colorscheme jamie

    augroup END
set cmdheight=2
"set makeprg='/home/jamie/coding/c/sdl/compile'
"set makeprg='/home/jamie/coding/c++/cpu/MAKEFILE'
"set makeprg='MAKEFILE'
set makeprg='\./_makefile.sh'
"set makeprg=[[\ -f\ Makefile\ ]]\ &&\ make
" Clang Complete Settings
let g:clang_use_library=1
"" if there's an error, allow us to see it
let g:clang_complete_copen=1
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
" Limit memory use
let g:clang_memory_percent=70
" " Remove -std=c++11 if you don't use C++ for everything like I do.
let g:clang_user_options='|| exit 0'

"YCM Options" 
"" Not a ycm option, but gets rid  of the annoying preview when
"" autcompleting
set completeopt-=preview

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
""let g:ycm_autoclose_preview_window_after_completion = 1
""let g:ycm_add_preview_to_completeopt = 0
""let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_show_diagnostic_ui= 0
let g:ycm_enable_diagnostic_highlighting = 0
"hi YcmErrorSection guibg=red guifg=white
"hi YcmWarningSection ctermbg=white ctermfg=yellow
let g:ycm_confirm_extra_conf = 0 
let g:ycm_auto_trigger = 1 
"" Python syntax hi options
function! NumberToggle()
    if(&relativenumber == 1)
        set nornu
    else
        set relativenumber
    endif
endfunction
"nnoremap <C-n> :call NumberToggle()<cr>
nnoremap <C-n> :bn <cr>

function! SaveAndMake()
"
"    if (&modified == 1)
"        silent make | copen 
"        redraw!
"    else 
"        silent make | copen
"        redraw!
"    endif
    silent make! | copen
    redraw!
    " This rather interesting code, makes our quickfix window ALWAYS appear as
    " a right hand split - if we dont have a split yet, this will create one.
    " If we have an existing split, this will put the quickfix window in it.
    if(winnr('$') > 2)
        exe 2 . "wincmd w"
        :q
    elseif(winnr('$') == 2)
        exe 2 . "wincmd w"
        wincmd L
    endif
endfunction

function! Buildscript()
    make
    sp %<.log
endfunction
    
" Unset colorcolumn and line number when we're in a quickfix window
function! Unsetcol()
    set colorcolumn=0
    set nonumber
endfunction

" Testing new gcc 4.5 parsing
"
"set errorformat=%f%l%v
"set errorformat=%*[^\"]\"%f\"%*\\D%l:\ %m,\"%f\"%*\\D%l:\%m,%-G%f:%l:
set errorformat=%*[^\"]\"%f\"%*\\D%l:\ %m,\"%f\"%*\\D%l:\ %m,%-G%f:%l:\ Each\ undeclared\ identifier\ is\ reported\ only\ once,%-G%f:%l:\ for\ each\ function\ it\ appears\ in,%-GIn\ file\ included\ from\ %f:%l:%c:,%-GIn\ file\ included\ from\ %f:%l:%c,%-GIn\ file\ included\ from\ %f:%l,%-Gfrom\ %f:%l:%c,%-Gfrom\ %f:%l,%f:%l:%c:%m,%f(%l):%m,%f:%l:%m,\"%f\"\\,\ line\ %l%*\\D%c%*[^\ ]\ %m,%D%*\\a[%*\\d]:\ Entering\ directory\ `%f',%X%*\\a[%*\\d]:\ Leaving\ directory\ `%f',%D%*\\a:\ Entering\ directory\ `%f',%X%*\\a:\ Leaving\ directory\ `%f',%DMaking\ %*\\a\ in\ %f,%f\|%l\|\ %m
"set efm=%f:%l:\ %\\%%(undefined\ reference%\\\|multiple\ definitions%\\)%\\@=%m

" This extra errorformat string prevents vim from opening a new blank buffer
" when it treats 'in file included from' string as a filename for some unknown
" reason i dont understand, i belive it to be a bug. see this stackoverflow
" page:
" http://stackoverflow.com/questions/9427141/vim-tries-to-jump-to-nonexistent-file-after-make
set errorformat^=%-GIn\ file\ included\ %.%# 
" Testing logparse reading
"
autocmd BufNewFile,BufRead *.log setf logparser
autocmd bufreadpost quickfix call Unsetcol()
" Testing pythong inside vim function

" Keep window split on buffer close
command! Bd bp\|bd \#

" Surround visually selected text in parentheses
"xnoremap <leader>s c()<Esc>P
"noremap <leader>s( c()<Esc>P 
"noremap <leader>s< c<><Esc>P 
"noremap <leader>s" c""<Esc>P 
"noremap <leader>s[ c[]<Esc>P 
"noremap <leader>s{ c{}<Esc>P 

" USEFUL USEFUL USEFUL
" Surround single word in double quotes, single quotes, paren etc
noremap <leader>, dei""<ESC>P<ESC>
noremap <leader>. dei''<ESC>P<ESC>
noremap <leader>( dei()<ESC>P<ESC>
noremap <leader>[ dei[]<ESC>P<ESC>

" Enable full python syntax highlighting
let g:python_highlight_all=1

" The terminal controls the cursor colour, so we need to specifically set it
" here and then change it back to default when we exit vim.
"

" use an orange cursor in insert mode
"let &t_SI = "\<Esc>]12;white\x7"
" use a red cursor otherwise
"let &t_EI = "\<Esc>]12;white\x7"
"silent !echo -ne "\033]12;white\007"

"
"silent !echo -ne  "\<Esc>]38;2;255;100;0m\x7"
" reset cursor when vim exits
"autocmd VimLeave * silent !echo -ne "\033]112\007"
" use \003]12;gray\007 for gnome-terminal
"endif
" TESTING TESTING TESTING
"if &term =~ "xterm\\|rxvt"
"let &t_SI = "\<Esc>[38;2;255;236;255m"
"let &t_EI = "\<Esc>[38;2;255;236;255m"
""silent !echo -ne "\x1b[38;2;255;255;255m" 
"endif

"if &term =~ "xterm"
"let &t_SI = "\Esc>]12;white\x7"
"let &t_SR = "\<Esc>]12;white\x7"
"let &t_EI = "\<Esc>]12;white\x7"
"silent !echo -ne "\033]12;white\007"
"endif
function! SwitchSourceHeader()
    if (expand ("%:e") == "cpp") 
        find %:t:r.h
        if(winnr('$') == 2)
        exe 2 . "wincmd w"
        wincmd L
    if (expand ("%:e") == "c") 
        find %:t:r.h
    else
        find %:t:r.cpp endif
    endif
    endif
endfunction 
nmap ,s :call SwitchSourceHeader()<CR>

" @Debug - tells you the hi group for thing under cursor
function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
augroup myvimrc
    au!
    au BufWritePost .vim, .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
