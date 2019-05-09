
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

" --------- Vim Interface ------------ "

hi WildMenu  guifg=#111111 guibg=#ffff80 
""hi Menu
""hi Scrollbar
""hi Tooltip
""hi MatchParen guibg=#dfffdf guifg=#fffacd
""hi MatchParen guibg=#add9e6 guifg=#dddddd

"" Black on yellow for search
hi incSearch guibg=#111111 guifg=#f7ad4c
"hi Search guifg=#111111 guibg=#f7ad4c
hi Search  guibg=#555555 guifg=#ffff99
"
hi VertSplit guibg=#cfcfcf ctermfg=0 guifg=#111111 ctermbg=8
hi LineNR guifg=gray26 ctermfg=238
hi ColorColumn guibg=#440000


"" Define Line Number highlighting when cursor moves up or down
hi CursorLineNR gui=none guibg=#222222 guifg=#cccccc  ctermfg=250 ctermbg=111111

"" Fix horrible pink background in popup menu for code auto-complete
hi Pmenu ctermbg=235 ctermfg=white guibg=#333333 guifg=#EEEEEE
hi PmenuSel ctermbg=88 ctermfg=white guibg=#EEEEEE guifg=#333333
" --------- Language Agnostic ------------ "

"hi Normal        guifg=#97a997 guibg=#2a2a2a
"hi Normal        guifg=#a8baa8 guibg=#111111
hi Normal        guifg=#cccccc  guibg=#111111
"hi Comment       guifg=#84b3e1
hi Comment        guifg=#888888
hi Constant      guifg=#ddf8dd cterm=NONE 
hi Identifier    guifg=#80ffff
hi Typedef       guifg=#fffd8e
hi StorageClass  guifg=#ffffff
"hi MatchParen    guibg=#dfffdf guifg=#fffacd
"hi MatchParen    guifg=#111111  guibg=#b3ba75
hi  MatchParen    guibg=#444444 guifg=NONE

"hi PreProc       guifg=#738273 cterm=NONE
hi PreProc       guifg=#869886 cterm=NONE
hi Type          guifg=#e7f98b term=NONE 
hi cSpecial      guifg=#bc8f8f cterm=NONE 
hi Special       guifg=#bc8f8f cterm=NONE 
"hi String        guifg=#f8f98b
hi String        guifg=#ddea9d
hi Boolean       guifg=#99ffff cterm=NONE 
""hi String guifg=#fcc7c7
""hi Cursor guifg=#efefef guibg=#efefef



" --------- Python Specific ------------ "

hi PythonFunction  guifg=#C0EEC0 cterm=NONE 
hi Structure guifg=#ffffff cterm=NONE 

" --------- C/C++ Specific ------------ "


" --------- html/css Specific ------------ "

hi htmlTag        guifg=#8e7f57
hi htmlTagName    guifg=#8e7f57
hi htmlEndTag     guifg=#a7925a
hi htmlString     guifg=#96b38a
hi htmlArg        guifg=#efe0a2
hi htmlStatement  guifg=#a9bca9
hi htmlValue      guifg=#ff0000 
hi htmlAssign     guifg=#ffffff
hi htmlLink       guifg=#ffffff 
hi cssBraces      guifg=#738273
hi cssTagName     guifg=#ddf8dd
hi cssAttr        guifg=#e7f98b
hi cssProp        guifg=#869886
hi cssValueLength guifg=#e7f98b
hi cssUnitDecorators guifg=#99a659
hi cssAtRule      guifg=#ddf8dd
hi Function       guifg=#e7f98b
hi Title          guifg=#a8baa8         

" --------- JS Specific ------------ "

hi javaScriptIdentifier guifg=#ddca7e
hi javaScriptFunction   guifg=#ddca7e
hi javaScriptStringD    guifg=#96b38a
hi javaScriptStringS    guifg=#96b38a
hi javaScriptJQ         guifg=#ffd8f9
hi javaScriptComment    guifg=#888888


" --------- JS Specific ------------ "
hi Number guifg=#a9bca9

"" C / C++
"hi MatchParen guibg=#344fe8 guifg=#ffffff
"" syntax highlighting groups

"
"" If else switch case, typedef, static etc yellow
""hi Typedef guifg=#fff696
""hi Statement gui=bold guifg=#ffffff 
"
"
"
"
""" set cursorline to 'disappear' into background (want line nr highlighted but
""" not the whole line)
"
hi Cursorline guibg=#222222 gui=NONE ctermbg=235 cterm=none
"" Make search highlighting behave itself!
"hi incSearch ctermbg=243 ctermfg=226
"hi Search ctermbg=243 ctermfg=226
"
"" ----Status line highlighting settings-----
"" Default the statusline to monochrome when entering Vim
hi statusline guibg=#ffffff ctermfg=0 guifg=#222222 ctermbg=0
"
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=#111111 ctermfg=119 guifg=#89e894 ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

" Set any areas of non-text to same bg colour as theme
hi NonText guibg=#111111 ctermbg=none
""hi NonText guibg=#042327 ctermbg=none
"
"" @Check
hi Visual guifg=#ffffff guibg=gray30
"
""" Set the vim gutter color (used by ycm for diag signs)
"hi SignColumn guibg=#111111 ctermbg=234
"
"hi Title guifg=#CCCCCC cterm=NONE 


" Sets the bg/fg colours of the unfocused statusline when window split
hi StatusLineNC guibg=#777777 guifg=#111111 ctermbg=16 ctermfg=232
hi Folded guibg=gray15 guifg=Yellow1
"Error
    call <SID>DOHI("Statement", "ffffff", "111111", "")
    call <SID>DOHI("StorageClass", "FFFFFF", "111111", "")
    call <SID>DOHI("Todo", "ee0000", "111111", "bold,underline")
    call <SID>DOHI("Important", "FFFF33", "111111", "bold,underline")
    call <SID>DOHI("Note", "2EB82E", "111111", "bold,underline")
    "  Nerdtree
    call <SID>DOHI("pythonTodo", "ee0000", "111111", "bold,underline")
    call <SID>DOHI("pythonImportant", "FFFF33", "111111", "bold,underline")
    call <SID>DOHI("pythonNote", "2EB82E", "111111", "bold,underline")
    call <SID>DOHI("Directory", "E0E0E0", "", "")
    
    " YCM diag signs
    call <SID>DOHI("YcmWarningSign", "111111", "FFF34A", "") " Orange
    call <SID>DOHI("YcmErrorSign", "FFFFFF", "800000", "") " Red

    "QF colors
    call <SID>DOHI("qfError", "ff5f5f", "111111", "bold")
    "call <SID>DOHI("qfError", "ee0000", "111111", "bold")
    call <SID>DOHI("qfWarning", "FFFF99", "111111", "bold")
    "call <SID>DOHI("qfNote", "7dff60", "111111", "bold")
    "call <SID>DOHI("qffunction", "ffc0cb", "111111", "bold")
    call <SID>DOHI("qffunction", "ffffff", "111111", "bold")
highlight Cursor guifg=black guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
