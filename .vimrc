call plug#begin('~/.vim/plugged')

" some standard config options
syntax on
filetype plugin indent on
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" don't highlight previuos search result
set nohlsearch

" Make it obvious where 80 characters is
set textwidth=120
set colorcolumn=+1

" set increment/decrement to alt- instead of Ctrl-
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>
" paste yanked text on next line
nnoremap ,p o<Esc>p
" ctrlp like behaviour with Denite
nnoremap <C-P> :FZF<CR>

" Numbers
set number
set numberwidth=5

" add Ruby gems tags file
set tags+=gems.tags

" Use silver surfer (ag) instead of grep
set grepprg=ag

" toggle paste mode
set pastetoggle=<F2>

" load NERDTree automatically
autocmd VimEnter * NERDTree
" put cursor in file tab if specified, in NERDTree otherwise
autocmd VimEnter * if argc() | wincmd p | endif

" status line
Plug 'vim-airline/vim-airline'

" file navigation
Plug 'scrooloose/nerdtree'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'Shougo/denite.nvim' " useless!!
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" syntax
Plug 'scrooloose/syntastic'
Plug 'slim-template/vim-slim'
" Syntastic
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'

" snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Plug 'garbas/vim-snipmate' " alternative to ultisnips
" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
"au BufNewFile,BufRead *.blade.php	setf blade
autocmd BufRead,BufNewFile,BufEnter *.php UltiSnipsAddFiletypes php-laravel

" auto complete
"Plug 'Valloric/YouCompleteMe'

" add closing tag/element 
Plug 'tpope/vim-endwise'

" Ruby and Rails
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
"Plug 'skalnik/vim-vroom'

" allows . to repeat last command from plugin
Plug 'tpope/vim-repeat'
" change surrounding characters
Plug 'tpope/vim-surround'
" allow C-a and C-x to work correctly on dates
Plug 'tpope/vim-speeddating'
" allow replacing variations (uppercase, lowercase, plural, etc) of word
Plug 'tpope/vim-abolish'
" allow commenting of single/multiple lines in different languages
" gc and gcc
Plug 'tpope/vim-commentary'
" align text by columns
Plug 'godlygeek/tabular'
" find all TODOs and FIXMEs
" \t to list all
Plug 'vim-scripts/TaskList.vim'
" Most Recently Used
Plug 'yegappan/mru'
" Add PHP Documentor support
" Plug 'tobyS/pdv'
" " pdv relies on vmustache
" Plug 'tobyS/vmustache'
" let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
" nnoremap <A-d> :call pdv#DocumentWithSnip()<CR>

" Add plugins to &runtimepath
call plug#end()
