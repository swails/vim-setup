set nocompatible " Better safe than sorry

" pathogen finds plugins and autoloads and loads them into the current vim
" environment. Look in ~/.vim/preload directory for list of preloads
execute pathogen#infect()

" Set tab preferences -- indentation is 4 spaces, no tabs, by default. This is
" overridden for certain languages that have different conventions (e.g., Go,
" Makefile, and Java)
set tabstop=4
set softtabstop=4
set shiftwidth=4

syntax enable  " turn on syntax highlighting
set expandtab  " By default expand tabs into spaces
set number     " Show line number in the editor window
set ruler      " Show line number and column number in underbar
set showcmd    " Show partial command in last line of the screen
set cursorline " Highlight the line that the cursor is on
set wildmenu   " For enhancing autocomplete
set showmatch  " Briefly jump to matching bracket (if it exists) when adding one
set incsearch  " Search for text as you are typing the search pattern
set hlsearch   " Highlight search result
set tw=80      " Wrap text at 80 characters

" New key mappings:
"   Turn un-highlight last search term
"   Fold all possible folds
"   Fold no possible folds
nnoremap ,<space> :nohlsearch<CR>
nnoremap za zM<CR>
nnoremap zn zR<CR>

set foldmethod=indent     " Fold based on indentation levels
set foldenable            " Allow text folding
set foldlevelstart=10     " Limit fold level to 10 levels
set foldnestmax=10
filetype plugin indent on " Turn on syntax-aware indentation

" StripTrailingWhitespace gets rid of whitespace at the ends of lines, but
" avoids jumping to the last line that was modified (by jumping back to the
" starting location)
function StripTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

" For configurations of different languages
augroup configgroup
    " Various language-specific tasks. For example, this keeps tabs as the
    " indentation character for java, Go, and Makefile
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
    " Don't strip from Go code, since vim-go already does that automatically
    " by invoking gofmt
    autocmd FileType c,cpp,python,ruby,java,markdown,Makefile,bash,csh,php,swift autocmd BufWritePre <buffer> :call StripTrailingWhitespace()
    " Auto-close braces and parentheses, but *only* in source code (and since
    " some languages don't use braces, don't close braces)
"   autocmd FileType c,cpp,python,ruby,java,Makefile,bash,csh,php,go,swift inoremap ( ()<Esc>i
"   autocmd FileType c,cpp,python,ruby,java,Makefile,bash,csh,php,go,swift inoremap ) <Esc>f)a
"   autocmd FileType c,cpp,python,ruby,java,Makefile,bash,csh,php,go,swift inoremap [ []<Esc>i
"   autocmd FileType c,cpp,python,ruby,java,Makefile,bash,csh,php,go,swift inoremap ] <Esc>f]a
"   autocmd FileType java,bash,csh,php,go,swift inoremap { {<CR>}<Esc>O
"   autocmd FileType java,bash,csh,php,go,swift inoremap } <Esc>/}<CR>:nohlsearch<CR>a
"   " c/cpp sometimes has braces on the same line, so don't force newlines.
"   autocmd FileType c,cpp inoremap { {<CR>}<Esc>O
"   autocmd FileType c,cpp inoremap } <Esc>f}a
    " Turn on spell checking for text, markdown, restructured text files, and
    " latex files (as well as RTF and README files)
    autocmd BufEnter *.txt,*.md,*.rst,*.tex,*.rtf,*.markdown,README* setlocal spell
    autocmd BufEnter *.txt,*.md,*.rst,*.tex,*.rtf,*.markdown,README* setlocal spelllang=en_us
augroup END

" MiniBufExplorer. Make the list of buffers reside in a vertical split on the
" left that can show up to 40 characters

" let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplModSelTarget = 1
" let g:miniBufExplVSplit = 1
" let g:miniBufExplMaxSize = 40
let g:miniBufExplMaxSize = 2

" NERDTree setup -- allow it to be toggled via Ctrl-n
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 30
" Automatically start NERDTree on startup
" autocmd VimEnter * NERDTree
