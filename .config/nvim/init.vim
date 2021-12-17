" Install vim-plug and install plugins if not already installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged/')

" Declare the list of plugins.
Plug 'srstevenson/vim-picker'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'janko-m/vim-test'
Plug 'iCyMind/NeoSolarized'
Plug 'tomtom/tcomment_vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jgdavey/tslime.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let g:picker_selector_executable = 'pick'
let g:picker_selector_flags = '-K'
nmap<c-p> <Plug>(PickerEdit)
let g:lsp_diagnostics_echo_cursor = 1

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" COC
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


let g:ruby_indent_assignment_style = 'variable'
let g:elm_setup_keybindings = 0

" For vim-textobj-rubyblock plugin
set nocompatible
if has("autocmd")
  filetype indent plugin on
endif
runtime macros/matchit.vim

" ================ Completion =======================

set wildmode=list:full
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

set nocompatible  " Use Vim settings, rather then Vi settings
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set backspace=indent,eol,start "sets backspace to wrap backward
set colorcolumn=80 "Sets a marker for where the 80th column is for proper style
set clipboard=unnamed "Sets copy and pasting to clipboard

syntax on

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Use ag instead of Grep when available
if executable("ag")
  set grepprg=ag\ -H\ --nogroup\ --nocolor
endif

" Color scheme
colorscheme NeoSolarized

" Numbers
set number                     " Show current line number
set relativenumber             " Show relative line numbers

" Set Window dimensions
set winwidth=84

" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Editing Vim Source
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" Testrunner settings
nmap <silent> <leader>s :w <CR> :TestNearest<CR>
nmap <silent> <leader>t :w <CR> :TestFile<CR>
nmap <silent> <leader>a :w <CR> :TestSuite<CR>
nmap <silent> <leader>l :w <CR> :TestLast<CR>
nmap <silent> <leader>g :w <CR> :TestVisit<CR>
function! NuStrategy(cmd)
  call Send_to_Tmux(a:cmd . "\n")
endfunction

" Note the Rails test runner checks for the Rails version, but GitHub doesnt
" have a Rails version so the test runner doesn't work. If you update vim-test
" you may have to comment out the version checking
let test#enabled_runners = ["ruby#rails"]
let test#ruby#use_binstubs = 1
let g:test#custom_strategies = {'nu': function('NuStrategy')}
let g:test#strategy = 'nu'
" let test#strategy='tslime'
let g:test#preserve_screen = 1

" Remapping file browser
map <Leader>e :Explore<CR>

" Split Gdiff vertically instead of horizontally
set diffopt+=vertical

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<tab>"
"     else
"         return "\<c-p>"
"     endif
" endfunction
" inoremap <expr> <tab> InsertTabWrapper()
" inoremap <s-tab> <c-n>

" Clear search highlight with <C-i>
if maparg('<C-i>', 'n') ==# ''
  nnoremap <silent> <C-i> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
