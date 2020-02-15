set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set number
set noerrorbells
set ruler
set mouse=a
set incsearch
set ignorecase
set paste
"match ErrorMsg '\%>80v.\+'
syntax on

let mapleader = ','

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdcommenter'
" Initialize plugin system
call plug#end()

filetype plugin on

let @c='bi\033[031mea\033[0m'
ab #u \033[04m
ab #r \033[031m
ab #g \033[032m
ab #y \033[033m
ab #b \033[034m
ab #d \033[38;5;244m
ab #o \033[0m

" Tell vim to remember certain things when we exit
"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
"  :20 : up to 20 lines of command-line history will be remembered
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" Set Font & Size
set guifont=Menlo\ Regular:h15

call pathogen#infect()
filetype plugin indent on

" Vim-pencil
set nocompatible
let g:pencil#wrapModeDefault = 'soft'

augroup pencil
	autocmd!
	autocmd FileType markdown,mkd call pencil#init()
	autocmd FileType text         call pencil#init()
augroup END

let g:vimwiki_list = [{
 \ 'path': '~/Dropbox/all',
 \ 'template_path': '~/Dropbox/all/templates',
 \ 'template_default': 'default',
 \ 'template_ext': '.html' }]

let g:vimwiki_folding = 'list'

"let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized

"set lcs=eol:$,tab:➜\ ,trail:✖
map <F3> :set list!<CR>

map <C-L> @a <CR>

"Plugins
map <F4>  :A              <CR>
map <C-T> :Tlist          <CR>
map <C-N> :NERDTreeToggle <CR>

"Buffer Resizing
"Left/Right
map > <C-W>>
map < <C-W><
"Up/Down
map + <C-W>+
map _ <C-W>-

"Buffer Switching
map <Leader>[ <C-W>W
map <Leader>] <C-W>w
map <Leader>= <C-W>k
map <Leader>' <C-W>j

"Tab Switching
map <C-U> gT
map <C-I> gt
"map <D-u> gT
"map <D-i> gt

"Commenting Toggle
"map <C-B> <Leader>c<space>
"map <C-B> gcc
map <C-B> <Leader>ci


map <D-j> 6j
map <D-k> 6k
" Use \m to load a file in marked.app
"nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

" Vim Note-taking preferences
let g:notes_directory = '~/Dropbox/Notes'

" Colorscheme info
"colorscheme molokai

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
  autocmd BufReadPost *
   \ if expand("<afile>:p:h") !=? $TEMP |
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
	 \ let JumpCursorOnEdit_foo = line("'\"") |
	  \ let b:doopenfold = 1 |
	   \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
	    \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
		 \ let b:doopenfold = 2 |
		  \ endif |
		   \ exe JumpCursorOnEdit_foo |
		    \ endif |
			 \ endif
			  " Need to postpone using "zv" until after reading the modelines.
			   autocmd BufWinEnter *
			    \ if exists("b:doopenfold") |
				 \ exe "normal zv" |
				  \ if(b:doopenfold > 1) |
				   \ exe "+".1 |
				    \ endif |
					 \ unlet b:doopenfold |
					  \ endif
					  augroup END

