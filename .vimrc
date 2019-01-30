"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

let mapleader =" "

" vundle
	set nocompatible
	filetype off
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

" Plugins
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'The-NERD-tree'
	Plugin 'scrooloose/syntastic'
	Plugin 'davidhalter/jedi-vim'
	Plugin 'majutsushi/tagbar'
	Plugin 'bling/vim-airline'
    Plugin 'Lokaltog/powerline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'flazz/vim-colorschemes'

	call vundle#end()
	filetype on
	filetype plugin on
	filetype plugin indent on

" Comandos basicos:
	syntax enable

	set t_Co=256
	colorscheme monoacc

	set number relativenumber
	set ruler
	set ttyfast

	set tabstop=4
	set shiftwidth=4
	set smarttab
	set expandtab
	set autoindent

	set cursorline
	set showmatch

	set encoding=utf-8
	language pt_BR.utf8

	set nobackup
	set nowritebackup
	set noswapfile

	set backspace=indent,eol,start

	set clipboard=unnamed

	set exrc

    set showcmd

    set incsearch
	set hlsearch
	set ignorecase

" Atalhos adicionais para Esc
    inoremap jj <Esc>
    inoremap kk <Esc>

" Abrir/fechar (parenteses, chaves e colchetes)
	imap ( ()<left>
	imap [ []<left>
	imap { {}<left>

" Navecação entre os splits:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

    map <C-Left> <C-w>h
	map <C-Down> <C-w>j
	map <C-UP> <C-w>k
	map <C-Right> <C-w>l

" Auto-centralizar:
	:nnoremap j jzz
	:nnoremap k kzz
    :nnoremap <Down> <Down>zz
    :nnoremap <UP> <Up>zz
	:nnoremap <leader>zz :let &scrolloff=999-&scrolloff<CR>


" Verificar ortografia:
	map <leader>o :setlocal spell! spelllang=pt<CR>

" Rodar codigo python:
	map <leader><Enter> <Esc>:w<CR>:!clear;python %<CR>

" Auto-completar:
	function! InsertTabWrapper(direction)
    	let col = col('.') - 1
    	if !col || getline('.')[col - 1] !~ '\k'
        	return "\<tab>"
    	elseif "backward" == a:direction
        	return "\<c-p>"
    	else
        	return "\<c-n>"
	   	endif
	endfunction

inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

" Substitui todas as ocorrencias.
	nnoremap S :%s//g<Left><Left>

" Copia/cola texto do clipbord
	vnoremap <C-c> "*Y :let @+=@*<CR>
	map <C-v> "+P

" Configurações Tabs/Buffers
    tab sball
    set switchbuf=useopen
    set laststatus=2
    nmap <C-p> :bprev<CR>
    nmap <C-n> :bnext<CR>

" Desabilita comentario automatico em nova linha:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits abrem abaixo e a esquerda.
	set splitbelow splitright

" Deleta automaticamente espaços em branco no final da linha, quando salvar
	autocmd BufWritePre * %s/\s\+$//e

" Configurações jedi-vim
	set completeopt-=preview
    let g:jedi#completions_command = "'"
    let g:jedi#documentation_command = "K"

" Configurações powerline
	let g:airline_theme='badwolf'
	let g:airline#extensions#tabline#enabled=1
	let g:airline#extensions#tabline#formatter='unique_tail'
	let g:airline_powerline_fonts=1

" Configurações syntastic
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 0
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0

" Configurações NERDTree
	let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']
	autocmd VimEnter * if !argc() | NERDTree | endif
	nmap ' :NERDTreeToggle<CR>

" Configurações Tagbar
	let g:tagbar_autofocus=0
	let g:tagbar_width=38
	map <C-t> :TagbarToggle<CR>


