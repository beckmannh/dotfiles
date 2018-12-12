"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

let mapleader =" "

" Comandos basicos:
	set encoding=utf-8
	language pt_BR.utf8
	colorscheme elflord
	syntax on
	set tabstop=4
	set number relativenumber
	set wrap
	set incsearch
"	set hlsearch
	set showcmd
	set ignorecase
	set smartindent
	set autoindent
	filetype detect

	imap { {}<left>
	imap ( ()<left>
	imap [ []<left>

" vundle
	set nocompatible
	filetype off
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

" Plugins
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'The-NERD-tree'

	call vundle#end()
	filetype plugin indent on

" Always show statusline
	set laststatus=1

" Auto-centralizar:
	:nnoremap j jzz
	:nnoremap k kzz
	:nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>


" Verificar ortografia:
	map <leader>o :setlocal spell! spelllang=pt<CR>

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


" Desabilita comentario automatico em nova linha:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits abrem abaixo e a esquerda.
	set splitbelow splitright

" Navecação entre os splits:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Substitui todas as ocorrencias.
	nnoremap S :%s//g<Left><Left>

" Copia/cola texto do clipbord
	vnoremap <C-c> "*Y :let @+=@*<CR>
	map <C-p> "+P

" Deleta automaticamente espaços em branco no final da linha, quando salvar
	autocmd BufWritePre * %s/\s\+$//e
