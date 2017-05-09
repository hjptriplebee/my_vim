"basic setting
syntax on
set nu
set smartindent
set cindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set showmatch
set nobackup
colorscheme molokai
set fileencodings=utf-8,gb2312,gbk,gb18030  
set termencoding=utf-8  
set encoding=utf-8
set nocompatible
set noswapfile
set mouse=a
filetype off
set rtp+=~/.vim/bundle/vundle/
"plugin manager
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'davidhalter/jedi-vim'
Bundle 'vim-syntastic/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle "bling/vim-airline"
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
filetype plugin indent on
"python-mode
let g:pymode_indent = 1 "pep8 indent
let g:pymode_folding = 0 "code folding
let g:pymode_options_max_line_length = 120
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
let g:pymode_rope = 0
"nerdtree auto-open
let NERDTreeWinSize=20
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
"syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers = ['pyflakes', 'pylint']
let g:syntastic_python_pylint_exe = 'pylint3'
let g:syntastic_aggregate_errors = 1
let g:syntastic_enable_highlighting=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 6
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 0

"jedi-vim config
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "top"
let g:jedi#force_py_version = "auto"
"fast run
func! RunPython()
	exec "!python3 %"
endfunc
func! CompileCode()
	exec "w"
	if &filetype == "python"
		exec "call RunPython()"
	endif
endfunc
"auto insert
autocmd BufNewFile *.py exec ":call AutoInsert()"
func AutoInsert()
	if &filetype == 'python'
		call setline(1,"# coding: UTF-8")  
		call append(line("."),"'''''''''''''''''''''''''''''''''''''''''''''''''''''")  
		call append(line(".")+1,"   file name: ".expand("%")."")  
		call append(line(".")+2,"   create time: ".strftime("%c")."")  
		call append(line(".")+3,"   author: Jipeng Huang")  
		call append(line(".")+4,"   e-mail: huangjipengnju@gmail.com")  
		call append(line(".")+5,"   github: https://github.com/hjptriplebee")  
		call append(line(".")+6,"'''''''''''''''''''''''''''''''''''''''''''''''''''''")
	endif
	autocmd BufNewFile * normal G
endfunc
"key map
map <C-A> ggVG
map! <C-A> <Esc>ggVGY

vnoremap <C-C> "+y
map <C-V> "+gP

map <C-S> :w<CR>
map! <C-S> <Esc>:w<CR>

inoremap <F3>  <C-X><C-N>

map <F5> :call CompileCode()<CR>
imap <F5> <ESC>:call CompileCode()<CR>
vmap <F5> <ESC>:call CompileCode()<CR>
