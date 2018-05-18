set statusline+=%f
set guitablabel=%t
set showtabline=4
set backspace=indent,eol,start
set nocompatible
set smartindent
set tabstop=4
set softtabstop=4
set expandtab
colorscheme default
syn on
set wrap
set textwidth=79
set mouse=a
set shiftwidth=2
set hlsearch
set ignorecase
set smartcase
set number
inoremap jk <ESC>
nnoremap <leader>c :noh<cr>
nnoremap <leader>t zt
nnoremap <leader>g zz
nnoremap <leader>b zb
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
autocmd BufWritePre * %s/\s\+$//e
