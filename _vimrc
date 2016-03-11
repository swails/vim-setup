" Better safe than sorry
set nocompatible

execute pathogen#infect()
syntax enable                            " turn on syntax
set tabstop=4 softtabstop=4 shiftwidth=4 " Size of tabbing
set tabpagemax=100                       " open up to 100 tabs with vim -p
set expandtab
set number
set ruler
set showcmd
set nowrap
set cursorline
filetype plugin indent on
set wildmenu
set showmatch
set incsearch
set hlsearch
nnoremap ,<space> :nohlsearch<CR>
nnoremap za zM<CR>
nnoremap zn zR<CR>
set foldmethod=indent
set foldenable
set foldlevelstart=10
set foldnestmax=10

function StripTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

" For configurations of different languages
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType go setlocal noexpandtab
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd FileType c,cpp,python,ruby,java,markdown autocmd BufWritePre <buffer> :call StripTrailingWhitespace()
augroup END

" MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplVSplit = 1
let g:miniBufExplMaxSize = 40
