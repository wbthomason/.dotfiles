" General autocommands

augroup main_aucommands
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal! g`\"" |
        \ endif
  au BufWinEnter * checktime
  au CompleteDone * pclose
  au FileType qf setlocal wrap
  autocmd VimEnter *
        \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
        \|   PlugInstall --sync | q
        \| endif
augroup END

augroup ale_colors
  au!
  autocmd ColorScheme *
        \ hi ALEErrorSign guifg=#ff727b |
        \ hi ALEWarningSign guifg=#ebcb8b |
        \ hi ALEInfoSign guifg=#eceff4 |
        \ hi ALEStyleErrorSign guifg=#bf616a |
        \ hi ALEStyleWarningSign guifg=#ebfb8b |
        \ hi ALEError guifg=#ff727b |
        \ hi ALEWarning guifg=#ebcb8b |
        \ hi ALEInfo guifg=#eceff4 |
        \ hi ALEStyleError guifg=#bf616a |
        \ hi ALEStyleWarning guifg=#ebfb8b |
augroup END

augroup markdown_aucommands
  au!
  au FileType pandoc set syntax=pandoc | 
        \ silent :ALEDisableBuffer | 
augroup END

augroup haskell_aucommands
  au!
  au FileType haskell setlocal omnifunc=necoghc#omnifunc
  au! BufWritePost *.hs InteroReload
augroup END

augroup lsp_aucommands
  au!
  au BufEnter * let b:LanguageClient_serverRunning = v:false 
  au User LanguageClientStopped let b:LanguageClient_serverRunning = v:false
  au User LanguageClientStarted let b:LanguageClient_serverRunning = v:true
  au CursorHold * if b:LanguageClient_serverRunning | call LanguageClient_textDocument_hover() | endif
augroup END

augroup tex_aucommands
  au!
  au FileType tex setlocal spell |
        \ silent :ALEDisableBuffer |
augroup END

augroup misc_lang_aucommands
  au!
  au BufNewFile,BufFilePre,BufRead *.rs,Cargo.toml set makeprg=cargo\ build
  au BufWritePost *.scala silent :EnTypeCheck
  au BufRead,BufNewFile *.launch set filetype=roslaunch
augroup END

augroup python_aucommands
  au FileType python setl nosmartindent
augroup END

augroup lisp_aucommands
  " Also Racket, Scheme, etc
  au filetype lisp,scheme,racket setlocal equalprg=scmindent
augroup END

augroup scribble_aucommands
  au BufNewFile,BufFilePre,BufRead *.scrbl set filetype=scribble
augroup END

augroup cmake_aucommands
  au!
  au FileType cmake setlocal commentstring=#\ %s
augroup END

augroup ncm_aucommands
  au!
  au BufEnter * call ncm2#enable_for_buffer()
  au TextChangedI * call ncm2#auto_trigger()
  au InsertEnter * call ncm2#enable_for_buffer()
  au Filetype tex call ncm2#register_source({
        \ 'name' : 'vimtex-cmds',
        \ 'priority': 8, 
        \ 'complete_length': -1,
        \ 'scope': ['tex'],
        \ 'matcher': {'name': 'prefix', 'key': 'word'},
        \ 'word_pattern': '\w+',
        \ 'complete_pattern': g:vimtex#re#ncm2#cmds,
        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
        \ })
  au Filetype tex call ncm2#register_source({
        \ 'name' : 'vimtex-labels',
        \ 'priority': 8, 
        \ 'complete_length': -1,
        \ 'scope': ['tex'],
        \ 'matcher': {'name': 'combine',
        \             'matchers': [
        \               {'name': 'substr', 'key': 'word'},
        \               {'name': 'substr', 'key': 'menu'},
        \             ]},
        \ 'word_pattern': '\w+',
        \ 'complete_pattern': g:vimtex#re#ncm2#labels,
        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
        \ })
  au Filetype tex call ncm2#register_source({
        \ 'name' : 'vimtex-files',
        \ 'priority': 8, 
        \ 'complete_length': -1,
        \ 'scope': ['tex'],
        \ 'matcher': {'name': 'combine',
        \             'matchers': [
        \               {'name': 'abbrfuzzy', 'key': 'word'},
        \               {'name': 'abbrfuzzy', 'key': 'abbr'},
        \             ]},
        \ 'word_pattern': '\w+',
        \ 'complete_pattern': g:vimtex#re#ncm2#files,
        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
        \ })
  au Filetype tex call ncm2#register_source({
        \ 'name' : 'bibtex',
        \ 'priority': 8, 
        \ 'complete_length': -1,
        \ 'scope': ['tex'],
        \ 'matcher': {'name': 'combine',
        \             'matchers': [
        \               {'name': 'prefix', 'key': 'word'},
        \               {'name': 'abbrfuzzy', 'key': 'abbr'},
        \               {'name': 'abbrfuzzy', 'key': 'menu'},
        \             ]},
        \ 'word_pattern': '\w+',
        \ 'complete_pattern': g:vimtex#re#ncm2#bibtex,
        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
        \ })
augroup END
