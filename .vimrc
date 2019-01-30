" THINGS TODO ON NEW INSTALL
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" paste ultisnips in appropriate files/folders or use :UltiSnipsEdit
" pip3 install --upgrade neovim
" :UpdateRemotePlugins
set nocompatible

if has("win32") || has("win16")
    set ffs=dos
    set shell=cmd.exe
    source $VIMRUNTIME/mswin.vim
    behave mswin
    set undodir=~/vimfiles/undodir//
    set backupdir=~/vimfiles/tmp/backup/ " backups
    set directory=~/vimfiles/tmp/swap//   " swap files
    "autosave
    "au GUIEnter * simalt ~s
else
  set undodir=~/.config/nvim/tmp/undo//     " undo files
  set backupdir=~/.config/nvim/tmp/backup// " backups
  set directory=~/.config/nvim/tmp/swap//   " swap files
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


call plug#begin('~/.local/share/nvim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'adelarsq/vim-matchit'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-abolish'
Plug 'vim-scripts/YankRing.vim'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ternjs/tern_for_vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'rking/ag.vim'
Plug 'moll/vim-bbye'
Plug 'ntpeters/vim-better-whitespace'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-speeddating'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nelstrom/vim-visual-star-search'
Plug 'koron/nyancat-vim'
Plug 'dhruvasagar/vim-vinegar'
Plug 'godlygeek/tabular'
Plug 'mtth/scratch.vim'
Plug 'szw/vim-g'
Plug 'sickill/vim-pasta'
Plug 'wincent/ferret'
Plug 'terryma/vim-expand-region'
Plug 'myusuf3/numbers.vim'
Plug 'wellle/targets.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'junegunn/goyo.vim'
Plug 'wakatime/vim-wakatime'

" Colors
Plug 'morhetz/gruvbox'

" VCS
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'mazubieta/gitlink-vim'
Plug 'sodapopcan/vim-twiggy'

"Filetype Specific
Plug 'reedes/vim-pencil'
Plug 'stephpy/vim-yaml'
Plug 'prettier/vim-prettier'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'othree/html5.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/jspc.vim'
Plug 'burnettk/vim-angular'
Plug 'matthewsimo/angular-vim-snippets'
Plug 'heavenshell/vim-jsdoc'
Plug 'othree/yajs.vim'
Plug 'gavocanov/vim-js-indent'
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'
Plug 'guileen/vim-node-dict'
Plug 'hail2u/vim-css3-syntax'
Plug 'elzr/vim-json'
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }
Plug 'isRuslan/vim-es6'
Plug '1995eaton/vim-better-javascript-completion'
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'reedes/vim-pencil'

call plug#end()
filetype plugin indent on

"set langmenu=none
"language messages en
set encoding=utf-8
set selectmode=
"colors in terminal
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8


" get rid of the silly characters in separators
"set fillchars = ""

syntax on
colorscheme gruvbox
set background=dark
set autoread
set backspace=indent,eol,start
set eol
set number
set nobackup
set history=1000
set tabstop=2
set shiftwidth=2
set softtabstop=2
"set expandtab
set guifont=Sauce\ Code\ Powerline:h13
set smartindent
set smarttab
set autoindent
set copyindent    " copy the previous indentation on autoindenting
set splitbelow
set splitright
set ruler
set autowrite
set cursorline
set laststatus=2
set linespace=2
set incsearch
set inccommand="split"
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
set wildignore+=*node_modules                    " nodejs modules
set wildignore+=*fixtures												 " test files

set colorcolumn=80
set synmaxcol=120

"" Autosave only when there is something to save. Always saving makes build
" watchers crazy
function! SaveIfUnsaved()
    if &modified
        :silent! w
    endif
endfunction
au FocusLost,BufLeave * :call SaveIfUnsaved()

" neovim terminal cursor highlight
:hi! TermCursorNC ctermfg=15 guifg=#fdf6e3 ctermbg=14 guibg=#93a1a1 cterm=NONE gui=NONE

"non-login shell used inside terminal mode
"let &shell='/bin/bash --login'
let g:snips_author = 'Jakub Miziołek'
let g:startify_lists = ['sessions', 'files', 'dir', 'bookmarks']
let g:startify_session_dir = '~/.config/nvim/session'

let daystillforty = system('/Users/jakub/dotfiles/deadline.sh')

let g:startify_custom_header = [ daystillforty ]
let g:startify_files_number = 5

let g:startify_lists = [
			\ { 'header': ['   Sessions'],       'type': 'sessions' },
			\ { 'header': ['   Bookmarks'],            'type': 'bookmarks' },
			\ { 'header': ['   MRU'],            'type': 'files' },
			\ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
			\ ]

let g:startify_bookmarks = [
				\ { 'c': '~/.config/nvim/init.vim' },
				\ { 't': '~/Documents/todo.md' },
				\ { 'n': '~/Documents/notes.md' }
				\ ]

" ariline  custom fonts
" airline don't chect whitespace
let g:airline#extensions#whitespace#checks = []

let g:airline#extensions#default#section_truncate_width = {
	\ 'b': 79,
	\ 'x': 60,
	\ 'y': 88,
	\ 'z': 45,
	\ 'warning': 80,
	\ 'error': 80,
	\ }
let g:bufferline_echo = 1
let g:bufferline_rotate = 2
let g:used_javascript_libs = 'underscore,angularjs,angularui,react,chai,jasmine'

let g:ale_linters = { 'javascript': ['eslint'], 'yaml': ['jamllint'] }
let g:ale_fixers = { 'javascript': ['prettier', 'eslint'] }
"let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_sign_column_always = 0
let g:ale_statusline_format = ['? %d', '? %d', '? ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <silent> <C-b> <Plug>(ale_next_wrap)

" signify enable by :SignifyToggle
let g:signify_disable_by_default = 0
let g:signify_vcs_list = ['git']

" :GitLink for github link cmd + click to open
command GitLink :echo gitlink#GitLink()

" disable <C-l> as jsdoc mapping
let g:jsdoc_default_mapping = 0
let g:jsdoc_enable_es6 = 1

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" remove fugitive scratch buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

"prevents some security exploits
set modelines=0
" Syntax coloring lines that are too long just slows down the world
set synmaxcol=248

" better systen clipboard integration
set clipboard=unnamed

" When completing by tag, show not just the function name
set showfulltag
" Add ignorance of whitespace to diff
set diffopt+=vertical,filler

set scrolloff=8         " Number of lines from vertical edge to start scrolling
set sidescrolloff=15 " Number of cols from horizontal edge to start scrolling
set sidescroll=5       " Number of cols to scroll at a time

"set mousehide
set mouse=a
set timeoutlen=300
"Switch between buffers without saving
set hidden
set ignorecase
set noinf
set smartcase
set noswapfile
"updatetime 1sec ,writes swap file ;-)
set updatetime=1000
set ssop-=folds      " do not store folds
" Height of the command bar
set cmdheight=1
" Disable blinking cursor

" Comma as Leader
let mapleader = ","

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=
" Don't redraw while executing macros (good performance config)
set lazyredraw

let g:user_emmet_expandabbr_key = '<c-e>'
let g:user_emmet_install_global = 1
"let g:user_emmet_next_key = '<c-w>'
"let g:user_emmet_prev_key = '<c-q>'
let g:use_emmet_complete_tag = 1

" let terminal resize scale the internal windows
autocmd VimResized * :wincmd =
command! -nargs=* ST split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

"disable Entering Ex Mode
:map Q <Nop>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Ctrl+S save
map <C-s> <esc>:w!<CR>

imap <C-o> <CR><Esc>O
" move between buffers with arrows
map <C-right> :bn<cr>
map <C-left> :bp<cr>

set completeopt-=preview
" Use deoplete.
let g:deoplete#enable_at_startup = 1

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

nmap <leader>bc :Bdelete<CR>
"Make Y behave like other capitals
map Y y$
" yanking does not move the cursor now!
vnoremap y myy`y
vnoremap Y myY`y

"Made D delete to the end of line
nnoremap D d$


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

"Remove the Windows ^M - when the encodings gets messed up
noremap <F6> mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

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

"ACK/SilverSearcher config
"nnoremap <C-a> :Ag 
"
let g:ag_working_path_mode='r'

"persistent undo file
" undodir OS dependent
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

au BufNewFile,BufRead *.less set filetype=less
"autosave on focuslost with silent ignore of buffers without filename
au FocusLost * silent! wa
"
" automatically leave insert mode after 'updatetime' milliseconds of inaction
au CursorHoldI * stopinsert
" set 'updatetime' to 5 seconds when in insert mode
au InsertEnter * let updaterestore=&updatetime | set updatetime=5000
au InsertLeave * let &updatetime=updaterestore

set complete=.,w,b,u,U,t,i,d
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete

autocmd FileType sass,scss setlocal omnifunc=csscomplete#CompleteCSS

" tabs for makefiles
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0


" PHP Generated Code Highlights (HTML & SQL)
let php_sql_query=1
let php_htmlInStrings=1

"Helpeful abbreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

set pastetoggle=<F2>

" put under/over with indentation
nnoremap <silent> <leader>pu :pu<CR>`[=`]
nnoremap <silent> <leader>po :pu!<CR>`[=`]

"Bubble single lines (kicks butt)
nmap <C-k> ddkP
nmap <C-j> ddp
"Bubble multiple lines reuires unimpaired plugin
vmap <C-k> xkP`[V`]
vmap <C-j> xp`[V`]

let g:ctrlp_cmd = 'CtrlP'
map <leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = '<leader><Space>'

" jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

"let g:ctrlp_cmdpalette_execute = 1
"better vertical split
map :vs :vsplit<cr><c-w>l
" Resize windows quickly
"" reset with <c-w>=
"nmap <c-w>l :vertical res +10<cr>
"nmap <c-w>h :vertical res -10<cr>
"nmap <c-w>j :res +10<cr>
"nmap <c-w>k :res -10<cr>

" Split line (sister to [J]oin lines above)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

"Shortcut for NERDTreeToggle
"nmap <leader>nt :NERDTreeToggle<cr>
"view the current buffer in NERDTree
map <leader>r :NERDTreeFind<cr>
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
let NERDTreeHijackNetrw=1
let NERDTreeMinimalUI=1
"Show hidden files in NerdTree
let NERDTreeShowHidden=1
let NERDTreeChDirMode=2
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\~$']
let NERDTreeHightlightCursorline=1
let NERDTreeIgnore=['\.\.$', '\.$', '\~$','\env','\.vim$', '\~$', 
            \'\.pyc$', '\.swp$', '\.egg-info$',
            \ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$','\.DS_Store$',
            \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
            \ '\.embed\.manifest$', '\.embed\.manifest.res$',
            \ '\.intermediate\.manifest$', '^mt.dep$' ]


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
nmap <leader>s :Gstatus<CR>

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
let g:yankring_history_dir = '~/.config/nvim'

" change directory to current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" completion popup
imap <leader><tab> <C-x><C-o>
"reforam paragraph
nnoremap <leader>q gqip

"Next/previous in quickfix list
" if D does not work replace with M meta/command
nnoremap <D-n> :cnext<CR>
nnoremap <D-p> :cprevious<CR>

"Map escape key to smash jk -- much faster
inoremap jk <Esc>
inoremap kj <Esc>
nmap <space> :

" console remaps
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <M-b>  <S-Left>
:cnoremap <M-f>  <S-Right>
:cnoremap <M-d>  <S-right><Delete>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <Esc>d <S-right><Delete>
:cnoremap <C-g>  <C-c>

"no GUI
set guioptions=

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"

" Tern js
nmap <leader>td :TernDef<CR>
nmap <leader>tt :TernDoc<CR>
nmap <leader>tr :TernRename<CR>
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
" toggle gundo
nnoremap <leader>u :MundoToggle<CR>

autocmd BufLeave *.css,*.less,*scss normal! mS
autocmd BufLeave *.js,*.coffee      normal! mJ
autocmd BufLeave */test/*,*/spec/*  normal! mT

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" nested syntax highlighting for *.md
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0
" should the browser window pop-up upon previewing
let g:livedown_open = 1
" the port on which Livedown server will run
let g:livedown_port = 1337

" yo angular generator settings
let g:angular_source_directory = 'app/scripts'
let g:angular_test_directory = 'test/spec'

au FileType javascript set dictionary+=~/.config/nvim/bundle/vim-node-dict/dict/node.dict

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

let g:jiracomplete_format = 'v:val.abbr . " - " . v:val.menu'

"so ~/local.vim

let g:airline_powerline_fonts=1
let g:terminal_scrollback_buffer_size=100000

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ww :e %%
map <leader>ws :sp %%
map <leader>wv :vsp %%

" NEOVIM
if has('nvim')
	set termguicolors
	tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
	"This maps Leader + e to exit terminal mode.
	tnoremap <leader>e <C-\><C-n>
	" move from the neovim terminal window to somewhere else
	tnoremap <C-h> <C-\><C-n><C-w>h
	tnoremap <C-j> <C-\><C-n><C-w>j
	tnoremap <C-k> <C-\><C-n><C-w>k
	tnoremap <C-l> <C-\><C-n><C-w>l
	"nmap <BS> <C-W>h
endif

" execute macro over visual selection
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

augroup pencil
  autocmd!
	  autocmd FileType markdown,mkd call pencil#init()
	"\ | call lexical#init()
	\ | call litecorrect#init()
	\ | call textobj#quote#init()
	\ | call textobj#sentence#init()
  autocmd FileType text         call pencil#init()
augroup END

"MACROS

"Refactor function to fat arrow ES6
let @e='dwf)a => '
