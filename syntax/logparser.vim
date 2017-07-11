syn keyword LOGPARSE warning
syn keyword fname_m FILENAME
hi def link LOGPARSE Type 
syn match fname_m ':(+\d):\d:'

let b:current_syntax = "logparser"
