set nocompatible                    " Incompatible with vi
filetype plugin on
syntax enable                       " Enable syntax highlighting

set path+=**                        " search into subfolders
set wildmenu                        " Command menu autocompletion
set wildmode=longest,list,full      " Command autocompletion rule

set title                           " Change the terminal's title
set noerrorbells visualbell t_vb=   " Disable annoying system bells
set laststatus=2                    " Always show the statusline

" Define default encoding for the files
set encoding=utf-8
set fileencoding=utf-8
set spelllang=en_gb                 " Set default dictionary for spell checking

set mouse=a                         " Enable mouse in all modes
set backspace=indent,eol,start

" Speed up key to reaction times:
set timeoutlen=1000
set ttimeoutlen=0

set numberwidth=4                   " Width of line numbers column

" Force buffer splitting conventions:
set splitright
set splitbelow

set viminfo^=%                      " Remember buffer info after exit

" Ctrl-Space for completions. Heck Yeah!
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Define ctags search paths:
set tags=./tags,./../tags,./../../tags,./../../../tags,tags
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/

" Plugins {
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tpope/vim-surround'
Plugin 'epheien/termdbg'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/syntastic'
Plugin 'racer-rust/vim-racer'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-commentary'
Plugin 'davidhalter/jedi-vim'
Plugin 'mileszs/ack.vim'
Plugin 'majutsushi/tagbar'

call vundle#end()
" }

" disable syntastic on the statusline
let g:statline_syntastic = 0

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_remove_include_errors = 1

let g:syntastic_java_javac_classpath = "./build/libs/*.jar"

" UI {
filetype plugin indent on           " Filetype-specific indent/plugin rules
set ttyfast                         " Smoother scrolling

set number                          " Line numbers
highlight LineNr ctermfg=grey

autocmd BufEnter * match ErrorMsg /\s\+$/
" }
" 
" denugging
packadd termdebug

" netrw {
let g:netrw_banner=0
let g:netrw_liststyle=3
" }

" File Types {
" List of files ignored by Vim
set wildignore=*.swp,*.bak,*.pyc,*.class

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Add cython as file type
autocmd BufRead,BufNewFile *.pyx
    \ setlocal ft=python |
    \ setlocal syntax=pyrex

" let base16colorspace=256            " Access colors present in 256 colorspace
set t_Co=256                        " Tell vim we support 256 colours

" Spaces & Tabs {
set tabstop=4                       " Set tab size to 4 spaces
set shiftwidth=4                    " Size of indent when using '><'
set softtabstop=4                   " Tab size while editing
set shiftwidth=4                    " Size of tab when indenting with '<=>'
set expandtab                       " Insert spaces instead of tabs
set shiftround                      " Indent to nearest tabstop

" Indent rules:
set autoindent
set cino+=(0,W4                     " Matching unclosed parantheses/arguments

" Searching {
set incsearch                       " Enables fuzzy searching
" set noignorecase                    " Don't ignore case when searching
set ignorecase                      " Do ignore case when searching
set hlsearch                        " Highlight search results

" Shortcut to turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" }

" Movement {
set virtualedit=onemore             " Allow for cursor beyond last character
" }

let g:tmux_navigator_save_on_switch = 2
let g:tmux_navigator_disable_when_zoomed = 1

" make Y effect to end of line instead of whole line
nmap Y y$
