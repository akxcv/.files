" line numbers
set number
" soft tabs of 2
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
" remove trailing whitespaces upon writing to file
autocmd BufWritePre * :%s/\s\+$//e

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'ap/vim-css-color'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mhartington/oceanic-next'
Plugin 'kchmck/vim-coffee-script'
Plugin 'othree/jsdoc-syntax.vim'
Plugin 'slim-template/vim-slim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'vim-syntastic/syntastic'
Plugin 'valloric/youcompleteme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
"
" syntax highlighting
syntax enable
set t_Co=256
colorscheme oceanicnext
hi javaScriptReserved guifg=#c594c5 ctermfg=176 gui=italic cterm=italic
hi javaScriptIdentifier guifg=#ec5f67 ctermfg=203 gui=italic cterm=italic
" highlight text when line is too long
highlight ColorColumn ctermbg=203
call matchadd('ColorColumn', '\%101v', 100)
" highlight matches when jumping
nnoremap <silent> n  n:call HLNext(0.6, 6)<cr>
nnoremap <silent> N  N:call HLNext(0.6, 6)<cr>
highlight WhiteOnRed ctermbg=203 ctermfg=white
function! HLNext (blinktime, blinks)
  let blink = 0
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#'.@/
  while blink < a:blinks
    let blink += 1
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000 / (a:blinks * 2)) . 'm'
    call matchdelete(ring)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000 / (a:blinks * 2)) . 'm'
  endwhile
endfunction
" show invisibles
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list
" remap :;
nnoremap ; :
nnoremap : ;
" other mappings
let mapleader = ","
" enable JSX on all .js files
let g:jsx_ext_required = 0
" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint', 'flow']
" NERDTree settings
let NERDTreeShowHidden = 1
" Override eslint with local version where necessary.
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
  let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
  let g:syntastic_javascript_eslint_exec = local_eslint
endif
