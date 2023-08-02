" REPLACED by init.lua
" THINGS TODO ON NEW INSTALL
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" n
" paste ultisnips in appropriate files/folders or use :UltiSnipsEdit
" pip3 install --upgrade neovim
" :UpdateRemotePlugins
set nocompatible

" Install vim-plug automatically if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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

Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'adelarsq/vim-matchit' " % operator improved
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dadbod'
Plug 'vim-scripts/YankRing.vim'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'moll/vim-bbye' " Bdelete
Plug 'ntpeters/vim-better-whitespace'
Plug 'simnalamburt/vim-mundo' " Gundo fork
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nelstrom/vim-visual-star-search'
Plug 'koron/nyancat-vim'
Plug 'dhruvasagar/vim-vinegar'
Plug 'godlygeek/tabular' "filtering and alignment
Plug 'mtth/scratch.vim'
Plug 'sickill/vim-pasta' " better pasting
Plug 'wincent/ferret'  " :Ack and Acks that in fact use rg or ag
Plug 'terryma/vim-expand-region'
Plug 'wellle/targets.vim' " additional text-objects
Plug 'cohama/lexima.vim'
Plug 'kassio/neoterm'
Plug 'janko/vim-test'
Plug 'dpelle/vim-LanguageTool'
Plug 'sedm0784/vim-you-autocorrect'
Plug 'liuchengxu/vim-which-key'
Plug 'terryma/vim-expand-region'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ggandor/leap.nvim'
Plug 'github/copilot.vim'

" Colors
Plug 'morhetz/gruvbox'
Plug 'dylanaraps/wal.vim'
Plug 'ericbn/vim-solarized'

" VCS
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'mazubieta/gitlink-vim'
Plug 'sjl/splice.vim' " Merge conflicts

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'wsdjeg/vim-fetch'

"Filetype Specific
Plug 'ianks/vim-tsx', { 'for': 'javascript' }
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
Plug 'othree/html5.vim', {'for': 'html'}
Plug 'mxw/vim-jsx', { 'for': 'jsx' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'plasticboy/vim-markdown', { 'for': 'markdown'}
Plug 'moll/vim-node', { 'for': 'javascript,typescript,ts' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript,ts' }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript,typescript,ts' }
Plug 'guileen/vim-node-dict', {'for': 'javascript,typescript,ts'}
Plug 'leafgarland/typescript-vim', { 'for': 'typescript,ts' }
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql', { 'for': 'typescript,ts' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

call plug#end()
filetype plugin indent on

"set langmenu=none
"language messages en
set encoding=utf-8
set termencoding=utf-8
augroup TerminalStuff
   au!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
set selectmode=
"colors in terminal
set t_Co=256

" get rid of the silly characters in separators
set fillchars = ""

syntax on
colorscheme solarized
set background=dark
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
		set termguicolors
endif
"let g:gruvbox_invert_selection='0'
"let g:gruvbox_italic=1
"let g:gruvbox_contrast_dark = 'hard'
set autoread
set spell
"set spelllang=en_us,pl
set spelllang=pl
set backspace=indent,eol,start
set eol
set number relativenumber
"au TermOpen * setlocal nonumber norelativenumber
"au TermEnter * setlocal nonumber norelativenumber
"au TermLeave * setlocal nonumber norelativenumber
set nobackup
set history=1000
set tabstop=2
set shiftwidth=2
set softtabstop=2
"set expandtab
set guifont=Sauce\ Code\ Powerline:h14
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
set nrformats-=octal
set incsearch
set inccommand="nosplit"

set nowrap
set title
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.out,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*/node_modules/*								 " nodejs modules
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

"set switchbuf=useopen " switch to the open buffer in another split?!
let g:dirvish_mode = ':sort ,^.*[\/],'

set colorcolumn=80
set synmaxcol=200
set winheight=30
set winwidth=80


au FocusLost,BufLeave * :call SaveIfUnsaved()

" neovim terminal cursor highlight
:hi! TermCursorNC ctermfg=15 guifg=#fdf6e3 ctermbg=14 guibg=#93a1a1 cterm=NONE gui=NONE

"non-login shell used inside terminal mode
"let &shell='/bin/bash --login'
let g:snips_author = 'Jakub Miziołek'
let g:startify_lists = ['sessions', 'files', 'dir', 'bookmarks']
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let daystill = systemlist('~/dotfiles/deadline.sh')[0]
" Lexima does not double spaces
let g:lexima_enable_space_rules=0

nmap <leader>md <Plug>MarkdownPreview

set sessionoptions-=options
let g:startify_custom_header = [ daystill ]
let g:startify_files_number = 5

let g:startify_lists = [
			\ { 'header': ['   Sessions'],       'type': 'sessions' },
			\ { 'header': ['   Bookmarks'],            'type': 'bookmarks' },
			\ { 'header': ['   MRU'],            'type': 'files' },
			\ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
			\ ]

let g:startify_bookmarks = [
				\ { 'c': '~/.config/nvim/init.vim' },
				\ { 'd': '~/www/jmdocs/' },
				\ { 't': '~/Documents/todo.md' },
				\ { 'n': '~/Documents/notes.md' },
				\ ]

" ariline  custom fonts
" airline don't chect whitespace
let g:airline#extensions#whitespace#checks = []
" change vertical to horizontal with -
noremap <c-w>-  <c-w>t<c-w>K

" change horizontal to vertical with |
noremap <c-w>\|  <c-w>t<c-w>H

nmap <leader>nu :set rnu!<cr>

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

let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'typescript', 'ts=typescript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']
let g:vim_markdown_follow_anchor = 1

let g:FerretExecutableArguments = {
	\   'rd': '--vimgrep --no-heading --no-config --max-columns 4096 --smart-case'
	\ }

let g:javascript_plugin_jsdoc = 1

let g:ale_linters = { 'javascript': ['eslint', 'prettier'], 'yaml': ['jamllint'], 'json': ['prettier', 'jsonlint'], 'typescript': ['eslint', 'prettier', 'tslint'], 'typescriptreact': ['eslint', 'prettier', 'tslint'] }
let g:ale_fixers = { 'javascript': ['prettier', 'eslint'], 'html': ['prettier'], 'typescript': ['prettier', 'eslint'], 'typescriptreact': ['prettier', 'eslint', 'tslint'], 'json': ['prettier', ], 'css': ['prettier'], 'markdown': ['prettier'], 'yaml': ['prettier'], 'sql': ['pgformatter'],}
"let g:prettier#autoformat = 0 from vim-prettier
"let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_typescript_tslint_use_global = 0
let g:ale_lint_on_save = 1
let g:ale_sign_column_always = 0
let g:ale_statusline_format = ['? %d', '? %d', '? ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"nmap <silent> <C-b> <Plug>(ale_next_wrap)

" :GitLink for github link cmd + click to open
command! GitLink :echo gitlink#GitLink()
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

" disable <C-l> as jsdoc mapping
let g:jsdoc_default_mapping = 0
let g:jsdoc_enable_es6 = 1

" remove fugitive scratch buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd BufReadPost term://* set bufhidden=delete

"prevents some security exploits
set modelines=0
" better systen clipboard integration
set clipboard=unnamed
" When completing by tag, show not just the function name
set showfulltag
" Add ignorance of whitespace to diff
set diffopt+=vertical,filler
set scrolloff=8         " Number of lines from vertical edge to start scrolling
set sidescrolloff=15 " Number of cols from horizontal edge to start scrolling
set sidescroll=5       " Number of cols to scroll at a time
set mouse=a
set timeoutlen=300
"Switch between buffers without saving
set hidden
set ignorecase
set noinf
set smartcase
set noswapfile
"updatetime 1sec, writes swap file ;-)
set updatetime=1000
set ssop-=folds " do not store folds
set foldmethod=indent
set foldnestmax=3
set nofoldenable
" Height of the command bar
set cmdheight=1

" Comma as Leader
let mapleader = ","

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=
" Don't redraw while executing macros (for performance)
set lazyredraw

" let terminal resize scale the internal windows
autocmd VimResized * :wincmd =
command! -nargs=* ST split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>
command! -nargs=* VV :vert Tnew tq<CR>

"disable Entering Ex Mode
:map Q <Nop>

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR

" search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

imap <C-o> <CR><Esc>O
" move between buffers with arrows
map <C-right> :bn<cr>
map <C-left> :bp<cr>

" Arrow and spaces with ctrl + a
imap <c-a> <space>=><space>

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
noremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
" Same when jumping around
nnoremap <silent> g; g;zz
nnoremap <silent> g, g,zz

" Easy buffer navigation
noremap <leader>bp :bprevious<cr>
noremap <leader>bn :bnext<cr>

 " When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif
augroup END

" Autoindent for PHP and Javascript
"au! BufNewFile,BufRead *.php set filetype=php.html.javascript.css
au BufNewFile,BufRead *.php set cindent
au BufNewFile,BufRead *.js set cindent

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

"Searcher config
nnoremap <C-s> :Ack<space>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>

let g:ag_working_path_mode='r'

if has('path_extra')
	setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

"persistent undo file
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

"augroup ILoveCorrections
 "autocmd!
 "autocmd FileType markdown,txt EnableAutocorrect
"augroup END

" PHP Generated Code Highlights (HTML & SQL)
let php_sql_query=1
let php_htmlInStrings=1

"Helpeful abbreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
cabbrev A Ack
cabbrev Ag Ack
let g:pasta_paste_before_mapping = 'gP'
map <leader>* :Ggrep --untracked <cword><CR><CR>
let g:pasta_paste_after_mapping = 'gp'

" put under/over with indentation
nnoremap <silent> <leader>pu :pu<CR>`[=`]
nnoremap <silent> <leader>po :pu!<CR>`[=`]

" Bubbling lines
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

"better vertical split
"map :vs :vsplit<cr><c-w>l
" Resize windows quickly
" reset with <c-w>=
nmap <C-w>l :vertical res +20<cr>
nmap <C-w>h :vertical res -20<cr>
nmap <C-w>j :res +20<cr>
nmap <C-w>k :res -20<cr>

" Split line (sister to [J]oin lines above)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=0
let NERDTreeHijackNetrw=1
let NERDTreeMinimalUI=1
"Show hidden files in NerdTree
let NERDTreeShowHidden=1
let NERDTreeChDirMode=1
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\~$']
let NERDTreeHightlightCursorline=1
let NERDTreeIgnore=['\.\.$', '\.$', '\~$','\env','\.vim$', '\~$', 
						\'\.pyc$', '\.swp$', '\.egg-info$','\.DS_Store$' ]

" I can't netrw I can't
"let g:netrw_banner       = 1
"let g:netrw_keepdir      = 1
"let g:netrw_liststyle    = 3 " 1 or 3
"let g:netrw_sort_options = 'i'
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
":nnoremap <space>e :CocCommand explorer<CR>
" clear search highlight
nmap <silent> <leader>/ :nohlsearch<CR>

nmap <leader>F :!open %:p:h<CR>
nmap <leader>t :!open -a iTerm.app %:p:h<CR>
nmap <leader>ch :!open -a "Google Chrome" %<CR>
nmap <leader>s :Git<CR>
nmap <leader>d :Gdiff<CR>
nmap <leader>c :Git commit<CR>
nmap <leader>p :Git push<CR>
nmap <leader>x :ALEFix<CR>
nmap <silent> <C-b> <Plug>(ale_next_wrap)

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
inoremap <C-U> <C-G>u<C-U>

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
"let g:SuperTabDefaultCompletionType = "<c-n>"
"let g:SuperTabContextDefaultCompletionType = "<c-n>"

let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-db', 'coc-word', 'coc-ultisnips', 'coc-explorer', 'coc-spell-checker', 'coc-yaml', 'coc-sh', 'coc-sql', 'coc-cspell-dicts']
" :CocCommand cSpell.addWordToUserDictionary to add word to dictionary
"


let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"

nmap <silent> <leader>td <Plug>(coc-definition)
nmap <silent> <leader>tt <Plug>(coc-type-definition)
nmap <silent> <leader>ti <Plug>(coc-implementaton)
nmap <silent> <leader>tf <Plug>(coc-references)
nmap <silent> <leader>tr  <Plug>(coc-rename)
"nmap <silent> <C-b>  <Plug>coc-diagnostic-prev

nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>
" CR selects first completion
  inoremap <silent><expr> <C-Space> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"
" tab and shift+tab to navigate completions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" toggle gundo
nnoremap <leader>u :MundoToggle<CR>

let g:jsx_ext_required = 1

" Automatically mark files for quick access
autocmd BufLeave *.css,*.less,*scss normal! mS
autocmd BufLeave *.js,*.coffee      normal! mJ
autocmd BufLeave */test/*,*/tests/*,*.test.js,*.spec.js  normal! mT

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
let g:test#javascript#runner = 'jest'
let g:test#preserve_screen = 1


autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" nested syntax highlighting for *.md
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']


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

nnoremap <leader>tc :<c-u>exec v:count.'Tclear'<cr>

nnoremap viz v[zo]z$

command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
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


" FUNCTIONS

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Make sure pasting in visual mode doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

function! SwitchWindow(count)
    if a:count == 0
        let windownumber = 1
    else
        let windownumber = a:count
    endif
    let l:current_buf = winbufnr(0)
    exe "buffer" . winbufnr(windownumber)
    exe windownumber."wincmd w"
    exe "buffer" . l:current_buf
endfunction
nnoremap <leader>wx :<c-u>call SwitchWindow(v:count)<cr>

function! GoogleSearch()
     let searchterm = getreg("g")
     silent! exec "silent! !open \"https://google.com/search?q=" . searchterm . "\" &"
endfunction
vnoremap <leader>g "gy<Esc>:call GoogleSearch()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RemoveFancyCharacters COMMAND
" Remove smart quotes, etc.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RemoveFancyCharacters()
    let typo = {}
    let typo["“"] = '"'
    let typo["”"] = '"'
    let typo["‘"] = "'"
    let typo["’"] = "'"
    let typo["–"] = '--'
    let typo["—"] = '---'
    let typo["…"] = '...'
    :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()

function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" Create parent folder when saving file
function! s:MkNonExDir(file, buf)
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

"" Autosave only when there is something to save.
function! SaveIfUnsaved()
    if &modified
        :silent! w
    endif
endfunction

"function BEncode() range
  "echo system('echo -n '.shellescape(getline(a:firstline, a:lastline)).'| base64')
"endfunction

"function BDecode() range
  "echo system('echo -n '.shellescape(getline(a:firstline, a:lastline)).'| base64 -D')
"endfunction

"function Test() range
  "echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).'| pbcopy')
"endfunction
"

"xnoremap <leader>be <esc>:'<,'>:w !base64 -<CR>
"
vnoremap <leader>bd "by<Esc>:call system('base64 -d', @b)<CR>
vnoremap <leader>be "by<Esc>:call system('base64', @b)<CR>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

map <leader><space> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>a :Rg<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --dfa-size-limit 1G --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

if executable('rg')
    let g:rg_derive_root='true'
endif

"MACROS

"Refactor js function to fat arrow ES6
let @e='dwf)a => '
"Change to http and switch domain to localhost
let @w="fsxf/lldt/ilocalhost:3000"
