" -----------------------------------------------------------------------------
" File: gruvbox.vim
" Description: Retro groove color scheme for Vim
" Author: morhetz <morhetz@gmail.com>
" Source: https://github.com/morhetz/gruvbox
" Last Modified: 12 Aug 2017
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=#111111 ctermfg=119 guifg=#89e894 ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

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

" setup palette dictionary
let s:gb = {}

" COLOUR_TABLE
" fill it with absolute colors
let s:gb.bg          = ['#111111', 235]     " 40-40-40
let s:gb.text_normal = ['#a89786', 255]     " 253-244-193

" Colours used
let s:gb.white          = ['#ffffff', 255]     " 175-58-3
let s:gb.bright_red     = ['#fb4934', 167]     " 251-73-52
let s:gb.bright_green   = ['#b8bb26', 142]     " 184-187-38
let s:gb.bright_yellow  = ['#fabd2f', 214]     " 250-189-47
let s:gb.bright_blue    = ['#83a598', 109]     " 131-165-152
let s:gb.bright_purple  = ['#9beeff', 175]     " 211-134-155
let s:gb.bright_aqua    = ['#c7e0c7', 108]     " 142-192-124
let s:gb.bright_orange  = ['#fe8019', 208]     " 254-128-25

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

  echo histring
  execute join(histring, ' ')
endfunction

"call s:HL('GruvboxRed', s:red)
"call s:HL('GruvboxRedBold', s:red, s:none, s:bold)
"call s:HL('GruvboxGreen', s:green)
"


" Default status ;ine setting
call s:HL('StatusLine', s:gb.white, s:gb.bg)
call s:HL('CursorLineNR',s:gb.bg, s:gb.white)
hi CursorLineNR gui=none guibg=#222222 guifg=#cccccc  ctermfg=250 ctermbg=111111

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    call s:HL('StatusLine', s:gb.bg, s:gb.bright_green)
  endif
endfunction
