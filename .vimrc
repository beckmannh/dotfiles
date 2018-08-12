set nocompatible              " be iMproved, required
filetype off                  " required
set number
set relativenumber
set incsearch
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>
imap { {}<left>
imap ( ()<left>
imap [ []<left>
set cursorline
set hlsearch
set wrap
set showcmd 
set ignorecase
set autoindent 
syntax on 
language pt_BR.utf8
colorscheme elflord  
nnoremap <space> za
" Always show statusline
set laststatus=1
"Word completion
"Complementação de palavras
set complete=.,w,k

"====== complementação de palavras ====
"usa o tab em modo insert para completar palavras
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
augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END
:nnoremap j jzz
:nnoremap k kzz
:nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
