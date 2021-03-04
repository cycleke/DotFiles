""" Coloring
syntax on
colorscheme parchment
highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
if has("nvim")
   highlight Normal gui=none
   highlight NonText guibg=none
endif

" Opaque Background (Comment out to use terminal's profile)
set termguicolors

" Transparent Background (For i3 and compton)
highlight Normal guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE

filetype plugin indent on
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\

set foldmethod=marker foldlevel=3 foldenable
set nobackup noswapfile noundofile autowrite noerrorbells
set wrap breakindent encoding=utf-8 number title cursorline
set guioptions-=T guioptions-=m guioptions-=r guioptions-=egrL

" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

autocmd filetype python nnoremap <F5> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F5> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' -std=c11 -Wall && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' -std=c++17 -Wall && ./'.shellescape('%:r')<CR>
autocmd filetype java nnoremap <F5> :w <bar> exec '!javac -encoding UTF-8 -sourcepath . -d . '.shellescape('%').' && java '.shellescape('%:r')<CR>

autocmd filetype c nnoremap <F6> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' -std=c11 -Wall -g && gdb '.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F6> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' -std=c++17 -Wall -g && gdb '.shellescape('%:r')<CR>


" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

imap jk <Esc>
nmap t :call TrimWhitespace()<CR>

nmap <M-1> 1gt
nmap <M-2> 2gt
nmap <M-3> 3gt
nmap <M-4> 4gt
nmap <M-5> 5gt
nmap <M-6> 6gt
nmap <M-7> 7gt
nmap <M-8> 8gt
nmap <M-9> 9gt
nmap <M-t> :tabnew<CR>
nmap <M-w> :close<CR>
nmap <Tab> :tabnext<CR>
nmap <S-Tab> :tabprevious<CR>
