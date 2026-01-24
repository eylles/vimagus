""""""""""""""""""""""
" vim script keymaps "
""""""""""""""""""""""

" need to convert these to lua

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !pkexec tee % >/dev/null' <bar> edit!

" Replace ex mode with gq
map Q gq

