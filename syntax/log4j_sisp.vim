" Vim syntax file
" " Language: log4j log files
" " Maintainer: Shivendra Panicker
" " Latest Revision: September 5 2015 
au BufRead,BufNewFile *.log_sisp set filetype=log4j_sisp
if exists("b:current_syntax")
  finish
endif

" This creates a keyword ERROR and puts it in the highlight group called logError
:syn keyword logError ERROR nextgroup=logClass skipwhite
:syn keyword logInfo  INFO nextgroup=logClass skipwhite
:syn keyword logDebug DEBUG nextgroup=logClass skipwhite

" This creates a match on the date and puts in the highlight group called logDate.  The
" nextgroup and skipwhite makes vim look for logTime after the match
:syn match logDate /^\d\{4}-\d\{2}-\d\{2}/ nextgroup=logTime skipwhite

" This creates a match on the time (but only if it follows the date)
:syn match logTime /\d\{2}:\d\{2}:\d\{2},\d\{3}/ nextgroup=logError,logInfo,logDebug skipwhite

:syn match logClass /\[[^\]]*\]/ nextgroup=logMessage skipwhite 
:syn match logMessage /.*/ contained

" Now make them appear:
" Link just links logError to the colouring for error
hi link logError Error
hi link logInfo Info
hi link logDebug Comment 
hi link logClass Constant 
hi link logMessage Info

" Def means default colour - colourschemes can override
hi def logDate guibg=yellow guifg=blue
hi def logTime guibg=green guifg=white
