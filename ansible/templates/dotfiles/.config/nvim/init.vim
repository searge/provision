setglobal nocompatible
setglobal pastetoggle=<F2>

set ttyfast
set lazyredraw

let g:python_host_prog = '/usr/bin/python2' " Python2
let g:python3_host_prog = '$HOME/anaconda3/bin/python' " Python 3

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" WakaTime
Plug 'wakatime/vim-wakatime'
" Right default for configs
Plug 'tpope/vim-sensible'
" Any language comments
Plug 'tpope/vim-commentary'
"  The plugin provides mappings to easily delete, change and add such
"  surroundings in pairs.
Plug 'tpope/vim-surround'

" Language Server
Plug 'prabirshrestha/async.vim' | Plug 'prabirshrestha/vim-lsp'
Plug 'nvie/vim-flake8'

" Vim Makrdown, etc
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'shime/vim-livedown', { 'for': 'markdown' }
Plug 'othree/html5.vim'

Plug 'kovisoft/slimv', { 'for': ['clojure', 'scheme', 'racket'] }
Plug 'wlangstroth/vim-racket', { 'for': 'racket' }

Plug 'junegunn/goyo.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
      \ 'coc-tabnine',
      \ 'coc-cspell-dicts',
      \ 'coc-spell-checker',
      \ 'coc-tsserver',
      \ 'coc-html',
      \ 'coc-lists',
      \ 'coc-sh',
      \ 'coc-css',
      \ 'coc-stylelint',
      \ 'coc-vimlsp',
      \ 'coc-go',
      \ 'coc-json',
      \ 'coc-eslint',
      \ 'coc-python',
      \ 'coc-yaml',
      \ 'coc-highlight',
      \ 'coc-snippets',
      \ 'coc-docker',
      \ 'coc-diagnostic',
      \]

" Themes
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/powerline-fonts'

call plug#end()

" LSP
if executable('pyls')
    " conda install -c conda-forge python-language-server
    " https://github.com/prabirshrestha/vim-lsp#registering-servers
    au User lsp_setup call lsp#register_server({
            \ 'name': 'pyls',
            \ 'cmd': {server_info->['pyls']},
            \ 'whitelist': ['python'],
            \ })
endif

" Syntax
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set showmatch           " Show matching brackets.

" Theme
let g:airline_theme='violet'
let g:airline_powerline_fonts = 1

" Three line
nmap <silent> <C-E> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Correct comment highlighting:
autocmd FileType json syntax match Comment +\/\/.\+$+

" Keys
let mapleader = ","
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)


command! -nargs=0 Prettier :CocCommand prettier.formatFile

