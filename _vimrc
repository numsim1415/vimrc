""" To be put into ~/.vimrc or C:\Users\NAME\_vimrc
""" See https://github.com/numsim1415/vimrc 
"#### settings that work WITHOUT ANY PLUGINS #### 

source $VIMRUNTIME/mswin.vim
behave mswin       "yes, I *do* like it.

" set gfn=Monospace\ 10 " a setting for gvim GUI - put that in .gvimrc

set noswapfile    " disable swap file, u should not enable this as or root !
syntax enable     " enable syntax processing
set tabstop=2     " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
"set expandtab    " tabs are spaces (don't use this in Makefiles!)
" set number      " show line numbers, enable via :set number
set showcmd       " show command in bottom bar
set cursorline    " highlight current line
set wildmenu      " visual autocomplete for command menu
set lazyredraw    " redraw only when we need to.
" let loaded_matchparen = 1    " disable highlighting of matching ()
set noshowmatch   " disable jumping cursor between ( and )

" Movement
""""""""""
" move vertically by visual line
nnoremap j gj
nnoremap k gk
nnoremap <Up> gk
nnoremap <Down> gj

" highlight last inserted text
nnoremap gV `[v`]

let mapleader=","  " leader is comma

" Searching
"""""""""""
" With these two you get case-sensitive search as soon as you use Capital letters
set ignorecase 
set smartcase 
set incsearch    " search as characters are entered
set hlsearch     " highlight matches

" Turn off search highlight with ,<space>
nnoremap <leader><space> :nohlsearch<CR> 
" Toggle syntax enable and showing of tab character with ,y
nnoremap <leader>y :if exists("syntax_on") <BAR> syntax off <BAR> set nolist <BAR> else <BAR> syntax enable <BAR> set list <BAR> endif <CR>

"######[ Search-Replace with Ctrl-H ]###
"######[ No more typing of %s/old/new/g ]###
" case insensitive search with confirmation
nnoremap <C-H> :%s///gci<LEFT><LEFT><LEFT><LEFT><LEFT>

" Make naughty characters visible, with unicode u may use more fancy stuff chars
" (uBB is right double angle, uB7 is middle dot, u2423 is open box)
" on windows, you might have issues with reading these unicode chars in the vimrc
set lcs=tab:->,trail:-,nbsp:~

"## note: when pasting with Ctrl Shift V in terminal, this will give you too much indentation
set autoindent                              "Retain indentation on next line
set smartindent                             "Turn on autoindenting of blocks

"## no modelines
set modelines=0

"######[ Make Visual modes work better ]######
"Lorin: Note this conflicts the mswin Ctrl V stuff.. Ctrl V is mapped to Ctrl Q by mswin so use that here
" Visual Block mode is far more useful that Visual mode (so swap the commands)...
"nnoremap v <C-V>
"nnoremap <C-V> v

nnoremap v <C-Q>
nnoremap <C-Q> v

"vnoremap v <C-V>
"vnoremap <C-V> v

vnoremap v <C-Q>
vnoremap <C-Q> v

"Square up visual selections and allow cursur to go one behind last character!!
set virtualedit=block,onemore

" Make BS/DEL work as expected in visual modes (i.e. delete the selected text)...
vmap <BS> x

" Match angle brackets...
set matchpairs+=<:>,?:?

"           +--Disable hlsearch while loading viminfo
"           | +--Remember marks for last 500 files
"           | |    +--Remember up to 10000 lines in each register
"           | |    |      +--Remember up to 1MB in each register
"           | |    |      |     +--Remember last 1000 search patterns
"           | |    |      |     |     +---Remember last 1000 commands
"           | |    |      |     |     |
"           v v    v      v     v     v
set viminfo=h,'500,<10000,s1000,/1000,:1000

set wildmode=list:longest,full      "Show list of completions
                                    "  and complete as much as possible,
                                    "  then iterate full completions
set infercase                       "Adjust completions to match case
set scrolloff=2                     "Scroll when 2 lines from top/bottom

"######[ Configure change-tracking ]######
let g:changes_hl_lines=1
let g:changes_verbose=0
let g:changes_autocmd=1

"######[ Make netrw more instantly useful ]######
let g:netrw_sort_by='time'
let g:netrw_sort_direction='reverse'

"#####[ statusline http://got-ravings.blogspot.de/2008/08/vim-pr0n-making-statuslines-that-own.html ###################
set laststatus=2
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
