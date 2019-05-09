" Vim syntax file
" Language:	Quickfix window
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Jan 15

"" Quit when a syntax file was already loaded
"if exists("b:current_syntax")
"  finish
"endif

syn match	qfNormal        ":.*"
syn match	qfFileName	"^[^|]*" nextgroup=qfSeparator
syn match	qfSeparator	"|" nextgroup=qfLineNr contained
syn match	qfError		"error" contained
syn match	qfFunction "\vIn\ function.*$"

" Override the defaults to make qf more readable
hi qfFileName guifg=#96b38a ctermfg=green
hi qfNormal   guifg=#ffffff ctermfg=white
hi qfLineNr   guifg=#dddddd ctermfg=grey
hi qfGreen    guifg=#7dff60 ctermfg=green
hi qfRed      guifg=#ff5f5f ctermfg=red
hi qfYellow   guifg=#e7f98b ctermfg=yellow

syn keyword qfGreen    succeeded finished note 
syn keyword qfYellow   warning 
syn keyword qfRed      error failed 

"let b:current_syntax = "qf"

" vim: ts=8
