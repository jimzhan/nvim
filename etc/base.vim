" ---------------------------------------------------------------------------
"  Settings
" ---------------------------------------------------------------------------
let g:config = {}
let g:config.root = $HOME . "/.config/nvim"
let g:config.tempdir = g:config.root . "tmp/"
let g:config.plugins = {}
let g:config.plugins.initialized = 1

" ---------------------------------------------------------------------------
"  General
" ---------------------------------------------------------------------------
syntax on                                       " Syntax highlighting
filetype plugin indent on                       " Automatically detect file types.
set autoread                                    " Set to auto read when a file is changed from the outside
set autowrite                                   " Automatically write a file when leaving a modified buffer
set shortmess+=filmnrxoOtT                      " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore                         " Allow for cursor beyond last character
set history=1000                                " Store a ton of history (default is 20)
"set spell                                       " Spell checking on
set hidden                                      " Allow buffer switching without saving
set iskeyword-=.                                " '.' is an end of word designator
set iskeyword-=#                                " '#' is an end of word designator
set iskeyword-=-                                " '-' is an end of word designator
set modelines=0
" No annoying sound on errors
set noeb vb t_vb=

" Setting up the directories
set backup                                      " Backups are nice ...
if has('persistent_undo')
  set undofile                                  " So is persistent undo ...
  set undolevels=100                            " Maximum number of changes that can be undone
  set undoreload=1000                           " Maximum number lines to save for undo on a buffer reload
endif

set ffs=unix,dos
"call nvim.RestoreCursor()


" To disable views add the following to your init.vim file:
" ---------------------------------------------------------------------------
"  let g:config.no_views = 1
" ---------------------------------------------------------------------------
if !exists('g:config.no_views')
  " Add exclusions to mkview and loadview
  " eg: *.*, svn-commit.tmp
  let g:skipview_files = [
\   '\[example pattern\]'
\ ]
endif


" ---------------------------------------------------------------------------
"  User Interface
" ---------------------------------------------------------------------------
set background=dark             " Assume a dark background
set t_Co=256                    " Enable 256 colors (stop CSApprox warning and make xterm vim shine)
set tabpagemax=15               " Only show 15 tabs
set showmode                   " Display the current mode
set cursorline                 " Highlight current line
set colorcolumn=100             " Enable Vertical Color Column at 80.
if has('gui_running')
  set shell=/bin/bash           " Use basic bash ONLY.
  set guioptions-=T             " Remove the toolbar
  set guioptions-=L             " Remove the scollbar
  set guifont=Monaco\ for\ Powerline:h14
  set transparency=15
endif

highlight clear SignColumn              " SignColumn should match background
highlight clear LineNr                  " Current line number row will have same background color in relative mode
highlight clear CursorLineNr            " Remove highlight color from current line number
highlight ExtraWhitespace ctermbg=166   " Highlight extra whitespace in specific color

if has('cmdline_info')
  set ruler                     " Show the ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
  set showcmd                   " Show partial commands in status line and Selected characters/lines in visual mode
endif

set laststatus=2                " For vim-airline
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set winminheight=0              " Windows can be 0 line high
set wildmenu                    " Show list instead of just completing
set wildignore=*.o,*~,*.pyc     " Ignore copmiled files
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace


" ---------------------------------------------------------------------------
"  Search
" ---------------------------------------------------------------------------
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set gdefault                    " :%s/foo/bar/  =>   :%s/foo/bar/g


" ---------------------------------------------------------------------------
"  Formatting
" ---------------------------------------------------------------------------
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set matchpairs+=<:>             " Match, to be used with %
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks


" ---------------------------------------------------------------------------
"  File loader
" ---------------------------------------------------------------------------
function! Load()
  exec 'source ' . g:config.root . '/etc/' . a:filename
endfunction
