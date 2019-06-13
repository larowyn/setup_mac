set shiftwidth=4
set tabstop=4

set nocompatible
set incsearch
set fileencoding=utf-8
set encoding=utf-8
set gdefault
set hlsearch
set cc=80

" Map Shift-Down and Shift-Up to travel to the next/previous paragraph (blank line)
map <S-Up> {
map <S-Down> }

"
" NOTE Highlithing
"
if !exists("autocmd_colorscheme_loaded")
    let autocmd_colorscheme_loaded = 1
    autocmd ColorScheme * highlight Note ctermfg=34 gui=bold cterm=underline
    autocmd ColorScheme * highlight Debug ctermfg=160 gui=bold cterm=underline
    autocmd ColorScheme * highlight Todo ctermfg=33 gui=bold cterm=underline
endif



syntax on
set number
colorscheme molokai


"
" NOTE Highlithing
"
if has("autocmd")
    if v:version > 701
        autocmd Syntax * call matchadd('Note',  '\W\zs\(NOTE\|INFO\|IDEA\)')
        autocmd Syntax * call matchadd('Debug',  '\W\zs\(TMP\|DEBUG\)')
        autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\)')
    endif
endif





au! BufNewFile,BufRead *.html.twig,*.twig setf html


"
"
"	Vundle :
"
"
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-rails.git'
" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin '42header'
" Plugin 'webVim'
" Plugin 'synmark'
" non-GitHub repos
Plugin 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///Users/gmarik/path/to/plugin'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Syntax for dockerfile
Plugin 'ekalinin/Dockerfile.vim'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.


"
"
"	Powerline :
"
"
let g:Powerline_symbols = 'unicode'
set laststatus=2
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set guifont=Source\ Code\ Pro\ for\ Powerline:14
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

"
"
"	Highlithing rules :
"
"


" Activate filetype extension to conditionnal highlithing
filetype on

" Hilights type
highlight NormError ctermbg=red ctermfg=white guibg=#592929


" Highlight trailing Spaces
au BufWinEnter * let w:m3=matchadd('Space', '\s\+$\| \+\ze\t', -1)
set list listchars=tab:»·,trail:·
highlight Space ctermbg=darkblue guibg=darkblue


"
"			Auto command part :
"



"	This part permit to apply highlithing rules when you open vim, and permit conditionnal highlithing


" autocmd that will apply highlithing when you open vim
autocmd VimEnter *.c call matchadd('NormError', '\s\+$')										"ExtraWhitespace
"autocmd VimEnter *.c call matchadd('NormError', '\%>80v.\+')										"OverLength
autocmd VimEnter *.c call matchadd('NormError', '\(if\|while\|return\)(.*)')								"IfWhileReturnLackSpace
" autocmd VimEnter *.c call matchadd('NormError', '.\+(.\+,.\+,.\+,.\+,.\+)')								"FivePlusArgument

" 	This part permit to apply highlithing rules to new window and permit conditionnal highlithing


" autocmd that will set up the w:created variable
autocmd VimEnter * autocmd WinEnter * let w:created=1

" autocmd that will apply highlithing to every new window
autocmd WinEnter *.c if !exists('w:created') | call matchadd('NormError', '\s\+$', 11) | endif						"ExtraWhitespace
"autocmd WinEnter *.c if !exists('w:created') | call matchadd('NormError', '\%>80v.\+') | endif						"OverLength
autocmd WinEnter *.c if !exists('w:created') | call matchadd('NormError', '\(if\|while\|return\)(.*)') | endif				"IfWhileReturnLackSpace
" autocmd WinEnter *.c if !exists('w:created') | call matchadd('NormError', '.\+(.\+,.\+,.\+,.\+,.\+)') | endif				"FivePlusArgument
