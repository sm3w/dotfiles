" Vim syntax file
" Language:	Quickfix window
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Jan 15

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" A bunch of useful C keywords
hi qfFileName guifg=#fff696
syn match	qfFileName	"^[^|]*" nextgroup=qfSeparator
syn match	qfSeparator	"|" nextgroup=qfLineNr contained
syn match	qfError		"error" contained
syn match	qfFunction "\vIn\ function.*$"

" The default highlighting.
"hi def link qfFileName	Directory
hi qfLineNr ctermfg=gray 
"syn match	qfLineNr	"[^|]*" contained contains=qfError
hi def link qfError	Error
"syn keyword qfFunction  function
syn keyword qfWarning warning 
syn keyword qfNote note 
syn keyword qfNote finished 
syn keyword qfError error
syn keyword qfError failed 


let b:current_syntax = "qf"

" vim: ts=8
