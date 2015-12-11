set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()

" Git
Plug 'tpope/vim-fugitive'

" Completion
Plug 'Valloric/YouCompleteMe'
" Plug 'scrooloose/syntastic'
Plug 'benekastah/neomake'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

" Rust
Plug 'phildawes/racer'
Plug 'rust-lang/rust.vim'

" Clojure
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'

" Markdown
Plug 'tpope/vim-markdown'
Plug 'vim-pandoc/vim-markdownfootnotes'

" Pandoc/Markdown
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" JS
Plug 'marijnh/tern_for_vim'
Plug 'pangloss/vim-javascript'
Plug 'wookiehangover/jshint.vim'

" Utilities
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/paredit.vim'

" Coffeescript
Plug 'kchmck/vim-coffee-script'

" Jade
Plug 'digitaltoad/vim-jade'

" Less
Plug 'groenewege/vim-less'

" Elm
Plug 'lambdatoast/elm.vim'

" OCaml
Plug 'the-lambda-church/merlin'
Plug 'OCamlPro/ocp-indent'

" LaTeX
"Plug 'kana/vim-textobj-user'
"Plug 'rbonvall/vim-textobj-latex'
Plug 'lervag/vimtex'

call plug#end()

filetype plugin indent on    " required
inoremap jk <ESC>
let mapleader = "\<Space>"
nnoremap <Leader>hh :nohl<CR>
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>to :tabe<CR>:CtrlP<CR>
" set spell spellang=en_us
nnoremap <leader>f 1z=
nnoremap <leader>s :set spell!
set autoread
set tw=80
set so=7
set wildignore=*.o,*~,*.pyc
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set incsearch
set lazyredraw
set magic
set showmatch
set noerrorbells
set novisualbell
set ignorecase
set smartcase
syntax enable
colorscheme desert
set background=dark
set smarttab
set shiftwidth=2
set tabstop=2
set expandtab
set number
" " set autochdir
set ai
set si
let g:EclimCompletionMethod = 'omnifunc'
set wrap
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif
set viminfo^=%
autocmd BufWinEnter * checktime
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16

let g:rbpt_loadcmd_toggle = 0
let g:airline_powerline_fonts = 1

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

function MakeModoko(fname)
  let foo = jobstart(['madoko', '--pdf', a:fname])
endfunction

au BufWritePost *.mdk :call MakeModoko(expand('%:t'))
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au BufWritePost * Neomake
au BufRead * Neomake
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
set rtp^="/usr/local/share/ocp-indent/vim"
set hidden
let g:racer_cmd = "/Users/wil/racer/target/release/racer"
let $RUST_SRC_PATH="/Users/wil/rust/src/"

let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_view_general_options_latexmk = '-r 1'

let g:neomake_cpp_clang_args = ['-std=c++14']
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = ['re!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*']
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
autocmd CompleteDone * pclose

nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
set fo+=t
