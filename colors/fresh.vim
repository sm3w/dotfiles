" -----------------------------------------------------------------------------
" File: gruvbox.vim
" Description: Retro groove color scheme for Vim
" Author: morhetz <morhetz@gmail.com>
" Source: https://github.com/morhetz/gruvbox
" Last Modified: 12 Aug 2017
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{
"function! InsertStatuslineColor(mode)
"  if a:mode == 'i'
"    hi statusline guibg=#111111 ctermfg=119 guifg=#89e894 ctermbg=0
"  elseif a:mode == 'r'
"    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
"  else
"    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
"  endif
"endfunction
"
if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='fresh'

let s:is_dark=(&background == 'dark')
"
"
" }}}
" Palette: {{{

" Modifiers and emphasis
let s:none = ['NONE', 'NONE']
let s:underline = 'underline,'
let s:bold= 'bold,'
"
" setup palette dictionary
let s:gb = {}

" COLOUR_TABLE
" fill it with absolute colors
let s:gb.bg             = ['#151515', 235]     " 40-40-40
let s:gb.text_normal    = ['#AFA895', 255]     " 253-244-193
let s:gb.text_comment   = ['#888888', 255]     " 253-244-193
let s:gb.text_strings   = ['#d09090', 255]     " 253-244-193
let s:gb.types          = ['#ace8a7', 255]     " 253-244-193

" Greys
let s:gb.grey_darkest   = ['#222222', 235]     " 40-40-40
let s:gb.grey_dark      = ['#888888', 235]     " 40-40-40
let s:gb.grey_med       = ['#555555', 235]     " 40-40-40
let s:gb.grey_light     = ['#dddddd', 235]     " 40-40-40


" Colours used
let s:gb.white          = ['#ffffff', 255]     " 175-58-3
let s:gb.pale_yellow    = ['#ffff99', 167]     " 251-73-52
let s:gb.pale_pink      = ['#f4bce4', 167]     " 251-73-52
let s:gb.pale_green     = ['#7eaf82', 142]     " 184-187-38
let s:gb.pale_red       = ['#c68d8d', 214]     " 250-189-47
let s:gb.bright_blue    = ['#affff0', 109]     " 131-165-152
let s:gb.bright_cyan    = ['#72f5ff', 109]     " 131-165-152
let s:gb.bright_red     = ['#ff0000', 175]     " 211-134-155
let s:gb.bright_green   = ['#00ff00', 108]     " 142-192-124
let s:gb.bright_orange  = ['#fe8019', 208]     " 254-128-25
let s:gb.dark_green     = ['#96b38a', 142]     " 184-187-38

let s:gb.neutral_red    = ['#cc241d', 124]     " 204-36-29
let s:gb.neutral_green  = ['#98971a', 106]     " 152-151-26
let s:gb.neutral_yellow = ['#d79921', 172]     " 215-153-33
let s:gb.neutral_blue   = ['#458588', 66]      " 69-133-136
let s:gb.neutral_purple = ['#b16286', 132]     " 177-98-134
let s:gb.neutral_aqua   = ['#689d6a', 72]      " 104-157-106
let s:gb.neutral_orange = ['#d65d0e', 166]     " 214-93-14

let s:gb.faded_red      = ['#9d0006', 88]      " 157-0-6
let s:gb.faded_green    = ['#79740e', 100]     " 121-116-14
let s:gb.faded_yellow   = ['#b57614', 136]     " 181-118-20
let s:gb.faded_blue     = ['#076678', 24]      " 7-102-120
let s:gb.faded_purple   = ['#8f3f71', 96]      " 143-63-113
let s:gb.faded_aqua     = ['#427b58', 66]      " 66-123-88
let s:gb.faded_orange   = ['#af3a03', 130]     " 175-58-3


" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  execute join(histring, ' ')
endfunction


" Group, guifg, guibg
call s:HL('Normal', s:gb.text_normal, s:gb.bg)

" Status and Cursor line setup 
call s:HL('StatusLine', s:gb.white, s:gb.grey_darkest)
call s:HL('StatusLineNC',s:gb.grey_dark, s:gb.bg)
call s:HL('CursorLine', s:none, s:gb.grey_darkest)
call s:HL('CursorLineNR',s:gb.grey_light, s:gb.grey_darkest)
call s:HL('LineNR',s:gb.grey_med, s:gb.bg)

call s:HL('Visual',s:gb.white, s:gb.grey_med)

" Defaults
call s:HL('WildMenu', s:gb.bg, s:gb.pale_yellow)
call s:HL('Search', s:gb.pale_pink, s:gb.grey_med)
call s:HL('IncSearch', s:gb.bg, s:gb.pale_pink)
call s:HL('VertSplit', s:gb.grey_light, s:gb.bg)
call s:HL('MatchParen', s:none, s:gb.grey_med)
call s:HL('Type', s:gb.dark_green) 
call s:HL('Constant', s:gb.bright_blue) 
call s:HL('String', s:gb.dark_green) 
call s:HL('Comment', s:gb.text_comment) 
call s:HL('PreProc', s:gb.pale_red) 
call s:HL('Todo', s:gb.bright_red, s:none, s:underline) 
call s:HL('Note', s:gb.bright_green, s:none, s:underline) 
call s:HL('Important', s:gb.pale_yellow, s:none, s:underline) 
call s:HL('Identifier', s:gb.bright_blue) 
call s:HL('Special', s:gb.pale_pink) 

" Custom syntax highlighting groups
call s:HL('FreshWhite', s:gb.white, s:none)
call s:HL('FreshWhiteB', s:gb.white, s:none, s:bold)
call s:HL('FreshPaleGreen', s:gb.pale_green, s:none)
call s:HL('FreshYellow', s:gb.pale_yellow, s:none)
call s:HL('FreshGreen ', s:gb.types, s:none)

hi! link Statement   FreshWhite
hi! link Conditional FreshWhite
hi! link Keyword     FreshWhite

" -------- C / C++ specific ----------- "
hi! link cOperator     FreshWhite
hi! link cStructure    FreshWhite 
hi! link cppStructure  FreshWhite 
hi! link cStorageClass FreshWhite 
hi! link cType         FreshYellow
hi! link cStatement    FreshWhite

" --------- html/css Specific ------------ "

hi htmlTag           guifg=#8e7f57
hi htmlTagName       guifg=#8e7f57
hi htmlEndTag        guifg=#a7925a
hi htmlString        guifg=#96b38a
hi htmlArg           guifg=#efe0a2
hi htmlStatement     guifg=#a9bca9
hi htmlValue         guifg=#ff0000 
hi htmlAssign        guifg=#ffffff
hi htmlLink          guifg=#ffffff 
hi cssBraces         guifg=#738273
hi cssTagName        guifg=#ddf8dd
hi cssAttr           guifg=#e7f98b
hi cssProp           guifg=#869886
hi cssValueLength    guifg=#e7f98b
hi cssUnitDecorators guifg=#99a659
hi cssAtRule         guifg=#ddf8dd
hi Function          guifg=#e7f98b
hi Title             guifg=#a8baa8         

" --------- JS Specific ------------ "

hi javaScriptIdentifier guifg=#ddca7e
hi javaScriptFunction   guifg=#ddca7e
hi javaScriptStringD    guifg=#96b38a
hi javaScriptStringS    guifg=#96b38a
hi javaScriptJQ         guifg=#ffd8f9
hi javaScriptComment    guifg=#888888


" --------- JS Specific ------------ "



" Control colour of the status line to indicate when we enter and leave insert
" mode
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    call s:HL('StatusLine',s:gb.bg, s:gb.pale_green)
  endif
endfunction
au InsertLeave * call s:HL('StatusLine', s:gb.white, s:gb.bg)


" Manual settings
hi NonText guibg=#111111 ctermbg=none
