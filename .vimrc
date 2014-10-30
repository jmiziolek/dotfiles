set nocompatible
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

filetype off " required!

if has("win32") || has("win16")
    set ffs=dos
    set shell=cmd.exe
    source $VIMRUNTIME/mswin.vim
    behave mswin
    set undodir=~/vimfiles/undodir//
    set backupdir=~/vimfiles/tmp/backup/ " backups
    set directory=~/vimfiles/tmp/swap//   " swap files
    set rtp+=~/vimfiles/bundle/vundle/
    "au GUIEnter * simalt ~s

else
  set undodir=~/.vim/tmp/undo//     " undo files
  set backupdir=~/.vim/tmp/backup// " backups
  set directory=~/.vim/tmp/swap//   " swap files
  set rtp+=~/vimfiles/bundle/vundle/
endif

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab' 
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'edsono/vim-matchit'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-startify'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'mattn/webapi-vim'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Townk/vim-autoclose'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'mattn/emmet-vim'
"Plugin 'bling/vim-bufferline'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'koron/nyancat-vim'
Plugin 'mattn/flappyvird-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'rking/ag.vim'
Plugin 'dhruvasagar/vim-vinegar'
Plugin 'tommcdo/vim-exchange'
Plugin 'junegunn/goyo.vim'
Plugin 'mtth/scratch.vim'
Plugin 'danielmiessler/VimBlog'
" VCS
Plugin 'mhinz/vim-signify'
Plugin 'vim-scripts/vcscommand.vim'
Plugin 'tpope/vim-fugitive'
" Filetype Specific
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'burnettk/vim-angular'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'vim-scripts/grep.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'moll/vim-node'
Plugin 'guileen/vim-node-dict'
Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'vim-scripts/CSApprox'
Plugin 'elzr/vim-json'

call vundle#end()
filetype plugin indent on

set t_Co=256
set langmenu=none
let $LANG='en_US'
language messages en
set encoding=utf-8
set selectmode=
syntax on
colorscheme solarized
set background=light
set autoread
set backspace=indent,eol,start
set number
set nobackup
set history=1000
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"set guifont=Source\ Code\ Pro:h11
set guifont=Sauce\ Code\ Powerline:h16
set smartindent
set autoindent
set copyindent    " copy the previous indentation on autoindenting
set splitbelow
set ruler
set autowrite
set cursorline
set laststatus=2
set linespace=2
set incsearch
set nowrap
set title
"set list lcs=trail:Â·,tab:Â»Â·
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*node_modules                    "nodejs modules
set wildignore+=*touch/                    "sencha SDK 
set wildignore+=*.sass-cache                     "sass tmp

let g:startify_lists = ['sessions', 'files', 'dir', 'bookmarks']
let g:startify_files_number = 5
let g:startify_custom_indices = ['a','s','d','f']


" ariline  custom fonts
let g:airline_powerline_fonts=1
" airline don't chect whitespace
let g:airline#extensions#whitespace#checks = []
" jshint for JS syntastic
let g:syntastic_javascript_checkers = ['jshint']
"default config file overrides project .jshintrc
"let g:syntastic_javascript_jshint_args = '--config ~/.jshintrc'
let g:syntastic_html_validator_parser = 'html5'
let g:bufferline_echo = 1
let g:bufferline_rotate = 2
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_warning_symbol = '∆'
let g:syntastic_style_warning_symbol = '≈'

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" signify enable by :SignifyToggle
let g:signify_disable_by_default = 1
let g:signify_vcs_list = [ 'git', 'cvs' ]

" disable <C-l> as jsdoc mapping
let g:jsdoc_default_mapping = 0

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

set complete=.,w,b,u,U,t,i,d
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete

augroup omni_complete
  " clear commands before resetting
  autocmd!
  " Enable omnicomplete for supported filetypes
  autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

" remove fugitive scratch buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

"prevents some security exploits
set modelines=0
" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" better clipboard integration on ms windows
set clipboard=unnamed

" When completing by tag, show not just the function name
set showfulltag
" Add ignorance of whitespace to diff
set diffopt+=iwhite

set scrolloff=8         " Number of lines from vertical edge to start scrolling
set sidescrolloff=15 " Number of cols from horizontal edge to start scrolling
set sidescroll=5       " Number of cols to scroll at a time

set mousehide
set timeoutlen=300
"Switch between buffers without saving
set hidden
set ignorecase
set noinf
set smartcase
set noswapfile
"updatetime 2sec ,writes swap file ;-)
set updatetime=1000
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
" Height of the command bar
set cmdheight=1
" Disable blinking cursor
:set guicursor+=a:blinkon0

" Comma as Leader
let mapleader = ","

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
autocmd GUIEnter * set vb t_vb=
" Don't redraw while executing macros (good performance config)
set lazyredraw

let g:user_emmet_install_global = 0
let g:user_emmet_next_key = '<c-e>'
let g:user_emmet_prev_key = '<c-r>'
let g:use_emmet_complete_tag = 1
autocmd FileType html,css,scss,sass imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

autocmd FileType html,css,scss,sass EmmetInstall

"disable Entering Ex Mode 
:map Q <Nop>

" Map Goyo toggle to <Leader> + spacebar
nnoremap <Leader><Space> :Goyo<CR>  
let g:goyo_width = 80
let g:goyo_margin_top = 4
let g:goyo_margin_bottom = 4
let g:goyo_linenr = 0

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader>gr :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Ctrl+S save
map <C-s> <esc>:w!<CR>

imap <C-o> <CR><Esc>O
" move between buffers with arrows
map <C-right> :bn<cr>
map <C-left> :bp<cr>

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


nmap <leader>bc :Bclose<CR>
"Make Y behave like other capitals
map Y y$
"Made D delete to the end of line
nnoremap D d$

" get rid of the silly characters in separators
set fillchars = ""

"view the current buffer in NERDTree
map <leader>r :NERDTreeFind<cr>
let NERDTreeMinimalUI=1
map <silent> <leader>s :NERDTree<CR><C-w>p:NERDTreeFind<CR>
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
let NERDTreeHijackNetrw=1

"Keep search pattern at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

 " When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif
augroup END

" wordpress syntax hightlight
"autocmd BufEnter *.php :set syn=wordpress

" Autoindent for PHP and Javascript
"au! BufNewFile,BufRead *.php set filetype=php.html.javascript.css
au BufNewFile,BufRead *.php set cindent
au BufNewFile,BufRead *.js set cindent

" Create parent folder when saving file
function s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Fast saving
nmap <leader>w :w!<cr>

set shortmess+=I

"searching and moving
nnoremap / /\v
vnoremap / /\v
set gdefault
set showmatch
set hlsearch
nnoremap <tab> %
vnoremap <tab> %

" Edit and Source the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Tern js
nmap <leader>td :TernDef<CR>
nmap <leader>tr :TernRename<CR>
"ACK/SilverSearcher config
nnoremap <C-a> :Ag
vnoremap <C-a> :Ag

"persistent undo file
" undodir OS dependent
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

au BufNewFile,BufRead *.less set filetype=less
"autosave on focuslost
au FocusLost * :wa
"
" automatically leave insert mode after 'updatetime' milliseconds of inaction
au CursorHoldI * stopinsert
" set 'updatetime' to 5 seconds when in insert mode
au InsertEnter * let updaterestore=&updatetime | set updatetime=5000
au InsertLeave * let &updatetime=updaterestore

" Enable omni completion.
autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
au BufNewFile,BufRead *.ftl set filetype=ftl
autocmd FileType css imap <buffer> {{ {<CR>}<Esc>ko
let g:syntastic_enable_signs=1

" You might also find this useful
" PHP Generated Code Highlights (HTML & SQL)
let php_sql_query=1
let php_htmlInStrings=1

"Helpeful abbreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

set pastetoggle=<F2>

"Bubble single lines (kicks butt)
nmap <C-k> ddkP
nmap <C-j> ddp
"Bubble multiple lines reuires unimpaired plugin
vmap <C-k> xkP`[V`]
vmap <C-j> xp`[V`]

let g:ctrlp_map = '<c-Space>'
let g:ctrlp_cmd = 'CtrlP'

map <leader>b :CtrlPBuffer<CR>
map :vs :vsplit<cr><c-w>l
" Resize windows quickly
" reset with <c-w>=
nmap <c-w>l :vertical res +10<cr>
nmap <c-w>h :vertical res -10<cr>
nmap <c-w>j :res +10<cr>
nmap <c-w>k :res -10<cr>

"Shortcut for NERDTreeToggle
nmap <leader>nt :NERDTreeToggle<cr>
"Show hidden files in NerdTree
let NERDTreeShowHidden=1
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.\.$', '\.$', '\~$','\env','\.vim$', '\~$', 
let g:user_emmet_wrap_with_abbreviation = '<F8>'
            \'\.pyc$', '\.swp$', '\.egg-info$',
            \ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
            \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
            \ '\.embed\.manifest$', '\.embed\.manifest.res$',
            \ '\.intermediate\.manifest$', '^mt.dep$' ]

let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeHightlightCursorline=1

" clear search highlight
nmap <silent> <leader>/ :nohlsearch<CR>

" Open current file in Explorer (simple version)
function OpenPathInExplorer()
    if has("win32") || has("win16")
        let filepath=substitute(expand("%:p"), '/', '\', 'g')
        :exe '!start explorer.exe /select,"' . filepath . '"'
    endif
endfunction
nmap <F11> :call OpenPathInExplorer()<CR>
nmap <leader>f :!open %:p:h<CR>
nmap <leader>t :!open -a iTerm.app %:p:h<CR>
nmap <leader>ch :!open -a "Google Chrome" %<CR>
nmap <leader>l :SyntasticToggleMode<CR>

"Home & End with capitalized directions
noremap H ^
noremap L $

"Open last/alternate buffer
noremap <leader><leader> <C-^>

" just no cursors :D
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" multiple line hjlk
noremap j gj
noremap k gk
noremap gj j
noremap gk k
"no need for F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" better block indent
vnoremap < <gv
vnoremap > >gv

" Make <leader>' switch between ' and "
nnoremap <leader>' ""yls<c-r>={'"': "'", "'": '"'}[@"]<cr><esc>

"easy split movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"YankRing mappings
nnoremap <silent> <leader>y :YRShow<cr>
inoremap <silent> <leader>y <ESC>:YRShow<cr>

" change directory to current file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

imap <leader><tab> <C-x><C-o>
nnoremap <leader>q gqip

"Next/previous in quickfix list
nnoremap <c-n> :cnext<CR>
nnoremap <c-p> :cprevious<CR>

"Map escape key to smash jk -- much faster
inoremap jk <Esc>
inoremap kj <Esc>
nmap <space> :

set guioptions=
"set guioptions=T
"set guioptions-=m  "remove menu bar

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

"JS Beautify buffer npm install -g js-beautify
nnoremap <leader>js :%!js-beautify -j -q -B -f -<CR>
"tern js
let g:tern_show_argument_hints='on_hold'

" yo angular generator settings
let g:angular_source_directory = 'app/scripts'
let g:angular_test_directory = 'test/spec'

au FileType javascript set dictionary+=~/HOME/.vim/bundle/vim-node-dict/dict/node.dict

" Extended Text Objects {{{1
let items = [ "<bar>", "\\", "/", ":", ".", "*", "_" ]
for item in items
  exe "nnoremap yi".item." T".item."yt".item
  exe "nnoremap ya".item." F".item."yf".item
  exe "nnoremap ci".item." T".item."ct".item
  exe "nnoremap ca".item." F".item."cf".item
  exe "nnoremap di".item." T".item."dt".item
  exe "nnoremap da".item." F".item."df".item
  exe "nnoremap vi".item." T".item."vt".item
  exe "nnoremap va".item." F".item."vf".item
endfor

nnoremap viz v[zo]z$

command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<leader>n"
let g:UltiSnipsJumpBackwardTrigger="<leader>k"

function! RunAntInSrcDir()
    exec '!cd M:\P\WEB-INF\build && ant ci_automatic_update'
endfunction

map <F4> :call RunAntInSrcDir()<CR>

so ~/.local.vim
