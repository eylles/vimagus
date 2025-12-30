""""""""""""""""""""""
" vim script keymaps "
""""""""""""""""""""""

" need to convert these to lua

" Indent controls
" Reselect text after indent/unindent.
vnoremap < <gv
vnoremap > >gv
" Tab to indent in visual mode.
vnoremap <Tab> >gv
" Shift+Tab to unindent in visual mode.
vnoremap <S-Tab> <gv

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !pkexec tee % >/dev/null' <bar> edit!

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Replace ex mode with gq
map Q gq

" Text reorder
nnoremap <M-J> :m .+1<CR>==
nnoremap <M-K> :m .-2<CR>==
vnoremap <M-J> :m '>+1<CR>gv=gv
vnoremap <M-K> :m '<-2<CR>gv=gv
inoremap <M-k> <Esc>:m .-2<CR>==gi
inoremap <M-j> <Esc>:m .+1<CR>==gi

" shortcut split navigation
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l

" Perform dot commands over visual blocks:
vnoremap . :normal .<CR>

" Move to the next buffer
nmap <M-PageDown> :bnext<CR>
nnoremap<silent> <Tab> :bnext<CR>

" Move to the previous buffer
nmap <M-PageUp> :bprevious<CR>
nnoremap<silent> <S-Tab> :bprevious<CR>
