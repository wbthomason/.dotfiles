" Keybindings

" Get rid of the annoying F1 binding
map <F1> <nop>

" Re-run commands
nnoremap <silent> <localleader>r @:

" Easily run a build
nnoremap <silent> <localleader><localleader> :Make<cr>

" Exiting
nnoremap <silent> <leader>q :qa<cr>
nnoremap <silent> <leader>x :x!<cr>

" Buffer bindings
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent><nowait> <leader>d :Sayonara<cr>
nnoremap <silent> <leader>k :Sayonara!<cr>
nnoremap <silent> <leader>l :b#<cr>
nnoremap <silent>  - :Buffers<cr>
nnoremap <silent> _ :FindIt<cr>

" Error bindings
nnoremap <silent> <leader>eo :lopen<CR>
nnoremap <silent> <leader>ec :lclose<CR>

" Version control bindings
nnoremap <silent> <leader>gl :Gpull<CR>
nnoremap <silent> <leader>gp :Gpush<CR>
nnoremap <silent> <leader>gs :MagitOnly<CR>

" REPL and Terminal bindings
tnoremap jj <C-\><C-n>
nnoremap <leader>r :IronRepl<CR>

" Formatting Bindings
nnoremap <silent> <leader>f :Neoformat<CR>

" Easy-Align bindings
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <silent> ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <silent> ga <Plug>(EasyAlign)

" Schlepp bindings
vmap <up>    <Plug>SchleppUp
vmap <down>  <Plug>SchleppDown
vmap <left>  <Plug>SchleppLeft
vmap <right> <Plug>SchleppRight

" Journal and note bindings
nnoremap <silent> <leader>jt :e ~/wiki/journal/<c-r>=strftime("%Y%m%d")<cr>.org<cr>
nnoremap <silent> <leader>js :Rg .* ~/wiki/journal<cr>

nnoremap <silent> <leader>ps :Files ~/wiki<cr>

" replace under cursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

" Swap ` and ' for marks (` includes horizontal position)
for first in ['', 'g', '[', ']']
  for mode in ['n', 'x', 'o']
    exe mode . 'noremap ' . first . "' " . first . '`'
    exe mode . 'noremap ' . first . '` ' . first . "'"
  endfor
endfor
