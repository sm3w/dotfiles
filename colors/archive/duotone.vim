
" Vim color file
" Maintainer: Jamie

if version > 580
" no guarantees for version 5.8 and below, but this makes it stop
" complaining
    hi clear
    if exists("syntax_on")
syntax reset
    endif
endif
function! <SID>DOHI(group, fg, bg, attr)

    if a:fg != ""
        exec "hi " . a:group . " guifg=#" . a:fg   
    endif
    if a:bg != ""
        exec "hi " . a:group . " guibg=#" . a:bg    
    endif
    if a:attr != ""
        exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
    endif
endfun

let g:colors_name="duotone"

set background=dark
hi Normal guifg=#ceA990 guibg=#222222
hi WildMenu  guifg=#000000 guibg=#ffff80 
""hi Menu
""hi Scrollbar
""hi Tooltip
""hi MatchParen guibg=#dfffdf guifg=#fffacd
""hi MatchParen guibg=#add8e6 guifg=#dddddd
"
"" C / C++
"hi MatchParen guibg=#344fe8 guifg=#ffffff
"" syntax highlighting groups
hi Comment guifg=#84b3e1
hi htmlComment guifg=#ffffff
hi Constant guifg=#99ffff cterm=NONE 
hi Identifier guifg=#80ffff
"
"" If else switch case, typedef, static etc yellow
""hi Typedef guifg=#fff696
hi Typedef guifg=#fffd8e
""hi Statement gui=bold guifg=#ffffff 
hi StorageClass guifg=#ffffff
"
hi PreProc guifg=#D86060 cterm=NONE
hi Type guifg=#fecb52   term=NONE 
hi cSpecial guifg=#bc8f8f cterm=NONE 
hi Special guifg=#bc8f8f cterm=NONE 
""hi String guifg=#fcc7c7
hi String guifg=#ffdac2
""hi Cursor guifg=#efefef guibg=#efefef
"
"" Black on yellow for search
hi incSearch guibg=#000000 guifg=#f7ad4c
"hi Search guifg=#000000 guibg=#f7ad4c
hi Search  guibg=#555555 guifg=#ffff99
"
hi VertSplit guibg=#cfcfcf ctermfg=0 guifg=#222222 ctermbg=8
hi LineNR guifg=gray26 ctermfg=238
hi ColorColumn guibg=#440000
"
"" python
hi Function guifg=#C0EEC0 cterm=NONE 
""hi Include guifg=#C0EEC0 cterm=NONE 
""hi Include guifg=#C0EEC0 cterm=NONE 
hi Boolean guifg=#99ffff cterm=NONE 
hi Structure guifg=#ffffff cterm=NONE 
"
"" Define Line Number highlighting when cursor moves up or down
hi CursorLineNR gui=none guibg=#222222 guifg=#cccccc  ctermfg=250 ctermbg=222222
"
""" Fix horrible pink background in popup menu for code auto-complete
hi Pmenu ctermbg=235 ctermfg=white guibg=#333333 guifg=#EEEEEE
hi PmenuSel ctermbg=88 ctermfg=white guibg=#EEEEEE guifg=#333333
"
""" set cursorline to 'disappear' into background (want line nr highlighted but
""" not the whole line)
"
hi Cursorline guibg=#333333 gui=NONE ctermbg=235 cterm=none
"" Make search highlighting behave itself!
"hi incSearch ctermbg=243 ctermfg=226
"hi Search ctermbg=243 ctermfg=226
"
"" ----Status line highlighting settings-----
"" Default the statusline to monochrome when entering Vim
hi statusline guibg=#ffffff ctermfg=0 guifg=#000000 ctermbg=0
"
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=#000000 ctermfg=119 guifg=#89e894 ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

" Set any areas of non-text to same bg colour as theme
hi NonText guibg=#222222 ctermbg=none
""hi NonText guibg=#042327 ctermbg=none
"
"" @Check
hi Visual guifg=#FFFFFF guibg=gray30
"
""" Set the vim gutter color (used by ycm for diag signs)
"hi SignColumn guibg=#222222 ctermbg=234
"
"hi Title guifg=#CCCCCC cterm=NONE 


" Sets the bg/fg colours of the unfocused statusline when window split
hi StatusLineNC guibg=#777777 guifg=#000000 ctermbg=16 ctermfg=232
hi Folded guibg=gray15 guifg=Yellow1
"Error
    call <SID>DOHI("Statement", "ffffff", "222222", "")
    call <SID>DOHI("StorageClass", "FFFFFF", "222222", "")
    call <SID>DOHI("Todo", "ee0000", "222222", "bold,underline")
    call <SID>DOHI("Important", "FFFF33", "222222", "bold,underline")
    call <SID>DOHI("Note", "2EB82E", "222222", "bold,underline")
    "  Nerdtree
    call <SID>DOHI("pythonTodo", "ee0000", "222222", "bold,underline")
    call <SID>DOHI("pythonImportant", "FFFF33", "222222", "bold,underline")
    call <SID>DOHI("pythonNote", "2EB82E", "222222", "bold,underline")
    call <SID>DOHI("Directory", "E0E0E0", "", "")
    
    " YCM diag signs
    call <SID>DOHI("YcmWarningSign", "000000", "FFF34A", "") " Orange
    call <SID>DOHI("YcmErrorSign", "FFFFFF", "800000", "") " Red

    "QF colors
    call <SID>DOHI("qfError", "ff5f5f", "222222", "bold")
    "call <SID>DOHI("qfError", "ee0000", "222222", "bold")
    call <SID>DOHI("qfWarning", "FFFF99", "222222", "bold")
    "call <SID>DOHI("qffunction", "ffc0cb", "222222", "bold")
    call <SID>DOHI("qffunction", "ffffff", "222222", "bold")
highlight Cursor guifg=black guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
