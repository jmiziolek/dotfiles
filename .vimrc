" THINGS TODO ON NEW INSTALL
" git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
" run: brew install the_silver_searcher ctags
" paste ultisnips in appropriate files/folders or use :UltiSnipsEdit
" cd ~/.vim/bundle/YouCompleteMe" ./install.sh
" cd .vim/bundle/tern_for_vim/ && npm install
set nocompatible
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
  set rtp+=~/.vim/bundle/Vundle.vim/
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

"neovim TrueColor support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

Plugin 'VundleVim/Vundle.vim'
Plugin 'sjl/gundo.vim'
Plugin 'jiangmiao/auto-pairs'
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
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'mattn/webapi-vim'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'scrooloose/syntastic'
Plugin 'honza/vim-snippets'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'mattn/emmet-vim'
Plugin 'bling/vim-airline'
Plugin 'marijnh/tern_for_vim'
Plugin 'koron/nyancat-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'rking/ag.vim'
Plugin 'dhruvasagar/vim-vinegar'
Plugin 'junegunn/goyo.vim'
Plugin 'mtth/scratch.vim'
Plugin 'szw/vim-g'
Plugin 'ZoomWin'
Plugin 'sickill/vim-pasta'
Plugin 'mnpk/vim-jira-complete'
Plugin 'rizzatti/dash.vim'
Plugin 'wincent/ferret'
Plugin 'terryma/vim-expand-region'
Plugin 'morhetz/gruvbox'
Plugin 'mattn/gist-vim'


" Plugins that don't play well with the terminal
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'

" VCS
Plugin 'mhinz/vim-signify'
Plugin 'vim-scripts/vcscommand.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'

"Filetype Specific
Plugin 'ashisha/image.vim'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'mephux/vim-jsfmt'
Plugin 'burnettk/vim-angular'
Plugin 'matthewsimo/angular-vim-snippets'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'moll/vim-node'
Plugin 'guileen/vim-node-dict'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'elzr/vim-json'
Plugin 'shime/vim-livedown'
Plugin 'othree/jspc.vim'
Plugin 'francoiscabrol/ranger.vim'
Plugin 'rbgrouleff/bclose.vim'

call vundle#end()
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
"colorscheme solarized
colorscheme gruvbox
set background=light
set autoread
set backspace=indent,eol,start
set number
set nobackup
set history=1000
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set expandtab
"set guifont=Source\ Code\ Pro:h11
set guifont=Sauce\ Code\ Powerline:h14
set smartindent
set smarttab
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
set wildignore+=*.sass-cache                     "sass tmp
set wildignore+=*node_modules                    "nodejs modules

set colorcolumn=120
set synmaxcol=180

" expand-region remaps
"map K <Plug>(expand_region_expand)
"map J <Plug>(expand_region_shrink)

let g:snips_author = 'Jakub Miziołek'
let g:startify_lists = ['sessions', 'files', 'dir', 'bookmarks']
let g:startify_files_number = 5
let g:startify_custom_indices = ['a','s','d','f']

" ariline  custom fonts
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
let g:syntastic_warning_symbol = '•'
let g:syntastic_style_warning_symbol = '≈'
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "se-']
let g:used_javascript_libs = 'underscore,angularjs,angularui,react,chai,jasmine'

"let g:js_fmt_fail_silently = 1
let g:js_fmt_autosave = 0
"let g:js_fmt_command = "jsfmt"
"let g:js_fmt_options = '--no-format'

" signify enable by :SignifyToggle
let g:signify_disable_by_default = 1
let g:signify_vcs_list = ['git']

" disable <C-l> as jsdoc mapping
let g:jsdoc_default_mapping = 0

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


" remove fugitive scratch buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

"prevents some security exploits
set modelines=0
" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" better systen clipboard integration
set clipboard=unnamed

" When completing by tag, show not just the function name
set showfulltag
" Add ignorance of whitespace to diff
set diffopt+=iwhite,vertical,filler

set scrolloff=8         " Number of lines from vertical edge to start scrolling
set sidescrolloff=15 " Number of cols from horizontal edge to start scrolling
set sidescroll=5       " Number of cols to scroll at a time

"set mousehide
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

"disable Entering Ex Mode 
:map Q <Nop>

" Map Goyo toggle to <Leader> + spacebar
nnoremap <Leader><Space> :Goyo<CR>  
let g:goyo_width = 120
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
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

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

let g:syntastic_enable_signs=1

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

"Shortcut for NERDTreeToggle
nmap <leader>nt :NERDTreeToggle<cr>
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
            \ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
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

nmap <silent> <leader>d <Plug>DashSearch
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

let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"

augroup vimrc_linenumbering
    autocmd!
    autocmd WinLeave *
                \ if &number |
                \   set norelativenumber |
                \ endif
    autocmd BufWinEnter *
                \ if &number |
                \   set relativenumber |
                \ endif
    autocmd VimEnter *
                \ if &number |
                \   set relativenumber |
                \ endif
augroup END


"JS Beautify buffer npm install -g js-beautify
nnoremap <leader>js :%!js-beautify -j -q -B -f -<CR>

"JS Beautify buffer npm install -g js-beautify
nnoremap <leader>es :%!esformatter<CR>
" Tern js
nmap <leader>td :TernDef<CR>
nmap <leader>tr :TernRename<CR>
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1

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

au FileType javascript set dictionary+=~/.vim/bundle/vim-node-dict/dict/node.dict

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

so ~/local.vim

let g:airline_powerline_fonts=1
let g:terminal_scrollback_buffer_size=100000
" NEOVIM
if !has('nvim')

	let g:ctrlp_map = '<c-Space>'
else 
	let g:ctrlp_map = '<leader>p'
	"This maps Leader + e to exit terminal mode. 
	tnoremap <leader>e <C-\><C-n>
	" move from the neovim terminal window to somewhere else
	tnoremap <C-h> <C-\><C-n><C-w>h
	tnoremap <C-j> <C-\><C-n><C-w>j
	tnoremap <C-k> <C-\><C-n><C-w>k
	tnoremap <C-l> <C-\><C-n><C-w>l
	"nmap <BS> <C-W>h
endif
