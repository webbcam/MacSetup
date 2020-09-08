set exrc
set secure
set statusline+=%f
set guitablabel=%t
set showtabline=4
set backspace=indent,eol,start
set nocompatible
set smartindent
set tabstop=4
set softtabstop=4
set expandtab
set colorcolumn=110
colorscheme desert
highlight ColorColumn ctermbg=darkgray
syn on
set wrap
" set textwidth=79
set mouse=a
set shiftwidth=4
set hlsearch
set ignorecase
set smartcase
set number
set tags=tags;/
nnoremap <C-]> g<C-]>
inoremap jk <ESC>
vnoremap // y/<C-R>"<CR>
map ,c *<C-O>:%s///gn<CR>
nnoremap <leader>c :noh<cr>
nnoremap <leader>t zt
nnoremap <leader>g zz
nnoremap <leader>b zb
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
"autocmd BufWritePre * %s/\s\+$//e
map <leader><space> :NERDTreeToggle<CR>

" Load CScope database from parent directory
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  " else add the database pointed to by environment variable 
  elseif $CSCOPE_DB != "" 
    cs add $CSCOPE_DB
  endif
endfunction
au BufEnter /* call LoadCscope()
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END
set runtimepath^=~/.vim/bundle/ctrlp.vim
nmap <leader>gf :CtrlP<CR><C-\>w
let NERDTreeWinSize=80
noremap <C-w>. <C-w>>
noremap <C-w>, <C-w><

" Formatter
function! Format()
        echom "Made Pretty"
        silent! execute 'norm! mz'

        if &ft ==? 'ino' || &ft ==? 'c' || &ft ==? 'cpp'
                set formatprg=astyle\ --style=linux
        silent! execute 'norm! gggqG'
        elseif &ft ==? 'java'
                set formatprg=astyle\ --mode=java
        silent! execute 'norm! gggqG'
        endif

        silent! call RemoveTrailingSpaces()
        silent! execute 'retab'
        silent! execute 'gg=G'
        silent! execute 'norm! `z'
        set formatprg=
endfunction

" Remove whitespace
function! RemoveTrailingSpaces()
        echom "Trim whitespace"
        silent! execute '%s/\s\+$//ge'
        silent! execute 'g/\v^$\n*%$/norm! dd'
endfunction
map <F12> :call Format()<CR>
