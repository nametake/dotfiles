" go syntax

syn case match

" Function call
syn match goFunctionCall /\w\+\ze(/ contains=goBuiltins,goDeclaration

hi def link goField Identifier

" Fields
syn match goField /\.\w\+\
      \%(\%([\/\-\+*%]\)\|\
      \%([\[\]{}<\>\)]\)\|\
      \%([\!=\^|&]\)\|\
      \%([\n\r\ ]\)\|\
      \%([,\:.]\)\)\@=/hs=s+1

hi def link goFunctionCall Type

" vim: sw=2 ts=2 et
