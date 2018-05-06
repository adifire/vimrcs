set nocompatible              " be iMproved, required

" set the runtime path to include vim-plug and initialize
call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-fugitive'

Plug 'altercation/vim-colors-solarized'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" For Neocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

"Plug 'sjl/gundo.vim'
Plug 'mbbill/undotree'

Plug 'itchyny/lightline.vim'

Plug 'edkolev/tmuxline.vim'

" used for repeating operator actions via "."
Plug 'tpope/vim-repeat'

" Interactive scratchpad for hackers.. ;) https://github.com/metakirby5/codi.vim
Plug 'metakirby5/codi.vim'

" Vim grep. https://github.com/mhinz/vim-grepper
Plug 'mhinz/vim-grepper'

" Surround.vim
Plug 'tpope/vim-surround'

" Gitgutter.vim
Plug 'airblade/vim-gitgutter'

" vim-unimpaired
Plug 'tpope/vim-unimpaired'

" vim-expand-region
Plug 'terryma/vim-expand-region'

" Additional Syntax
Plug 'motus/pig.vim'

" jshint/lint
" Plug 'wookiehangover/jshint.vim'

" markdown preview
Plug 'suan/vim-instant-markdown'

" Better substitutions
Plug 'tpope/vim-abolish'

" Yankstack
Plug 'maxbrunsfeld/vim-yankstack'

" Dash plugin
Plug 'rizzatti/dash.vim'

" go related
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" python related
Plug 'zchee/deoplete-jedi'

" All of your Plugs must be added before the following line
call plug#end()
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" PlugInstall [name ...] [#threads] Install plugins
" PlugUpdate [name ...] [#threads]  Install or update plugins
" PlugClean[!]  Remove unused directories (bang version will clean without prompt)
" PlugUpgrade Upgrade vim-plug itself
" PlugStatus  Check the status of plugins
" PlugDiff  Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path] Generate script for restoring the current
" snapshot of the plugins
"
let mapleader=","

" always show the status bar
set noshowmode

set hidden

let g:solarized_termcolors=256
"let g:rehash256 = 1
syntax enable
set background=dark
"let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

set nowrap        " don't wrap lines
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set smartindent
set autoindent    " always set autoindenting on
set shiftwidth=2  " number of spaces to use for autoindenting
set expandtab     " actually converts tabs to spaces.
set tabstop=2     " a tab is two spaces.
set softtabstop=2 " not sure, but does the job well.
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch
set incsearch
set magic

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set noswapfile
set nobackup
set nowritebackup

" short ttimeoutlen to lower latency to show current mode
:set ttimeoutlen=50

" Start scrolling before my cursor reaches the bottom of the screen
set scrolloff=4

" Toggle cursor highlighting
:nmap <leader>h :set cursorline! cursorcolumn!<CR>

" Save
nmap <leader>w :w<CR>

" Reload vimrc
nmap <leader>rv :source $MYVIMRC<CR>

" Make Y act like D and C
nnoremap Y y$

" Unmap ex mode
nnoremap Q <nop>

" Quick access to edit config files
nmap <leader>ev :edit ~/.vim_runtime/first.vim<CR>

" Select whole buffer
nnoremap vaa ggvGg_

" Highlight current line
:set cursorline

" Highlight current column
:set cursorcolumn

" Leave insert mode with hh
:inoremap hh <ESC>

" Close preview window
nmap <leader>pc :pc<CR>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Remap VIM 0 to first non-blank character
map 0 ^

" Related to search.
nmap <space> /

" Enable and disable search highlighting
nmap <leader>q :set hlsearch!<CR>

" Related to tabs
nmap <silent> <leader>tn :tabnew<CR>
nmap <silent> <leader>tc :tabclose<CR>

" Gundo
"if has("python3")
"  let g:gundo_prefer_python3 = 1
"endif
"map <silent> <leader>u :GundoToggle<CR>

" Undotree
" e.g. using 'd' instead of 'days' to save some space.
if !exists('g:undotree_ShortIndicators')
  let g:undotree_ShortIndicators = 1
endif
" if set, let undotree window get focus after being opened, otherwise
" focus will stay in current window.
if !exists('g:undotree_SetFocusWhenToggle')
  let g:undotree_SetFocusWhenToggle = 1
endif
" tree node shape.
if !exists('g:undotree_TreeNodeShape')
  let g:undotree_TreeNodeShape = '*'
endif
map <silent> <leader>u :UndotreeToggle<cr>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" <Tab> to cycle through splits
:noremap <Tab> <C-w>w

" Close the current split
:nmap <leader>x <C-w>c

" Copy to clipboard
vnoremap <leader>y "*y
" vnoremap <C-c> :w !pbcopy<CR><CR> 
" noremap <C-v> :r !pbpaste<CR><CR>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Pretty print JSON
nmap <leader>,, :%!python -m json.tool<CR>

" Vim expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Enable deoplete
let g:deoplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""
" NERDTree Customizations
""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
nmap <silent> <leader>nn :NERDTreeToggle<CR>
nmap <silent> <leader>nf :NERDTreeFind<CR>
let NERDTreeShowHidden=0
let g:NERDTreeWinSize=35

""""""""""""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""""""""""""
" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

nmap <silent> <leader>j :CtrlP<CR>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee\|^vendor'
let g:ctrlp_max_height = 15

" Use ag in CtrlP for listing files. Lightning fast and respects
" .gitignore
let g:ctrlp_user_command = 'ag -Q -l --nocolor -g "" %s'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

""""""""""""""""""""""""""""""
" YankStack
""""""""""""""""""""""""""""""
nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-P> <Plug>yankstack_substitute_newer_paste

"""""""""""""""""""""""""""""
" Vim go
"""""""""""""""""""""""""""""
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_get_update = 0
let g:go_gocode_autobuild = 0
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)

""""""""""""""""""""""""""""""""""""""""
" lightline
""""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
      \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
" "  means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("persistent_undo")
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-grepper
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime plugin/grepper.vim
nnoremap \ :Grepper<cr>
let g:grepper.tools = 
      \ ['rg', 'ag', 'ack', 'grep', 'git']
let g:grepper.side = 1
autocmd FileType GrepperSide
      \  silent execute 'keeppatterns v#'.b:grepper_side.'#>'
      \| silent normal! ggn
let g:grepper.next_tool = '<leader>g'

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Refresh all buffers
nmap <leader>la :bufdo e!<CR>

""""""""""""""""""""""""""""""""""""""""
" gotagbar config
""""""""""""""""""""""""""""""""""""""""
nmap <leader>gt :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
      \ },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
      \ }

"""""""""""""""""""""""""""""
" File specific properties
"""""""""""""""""""""""""""""
" Javascript
au FileType javascript setl sw=4 sts=4 et

" Golang
au FileType go setl noexpandtab

" Use github-flavored markdown
:aug markdown
:au!
:au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
:aug END

"""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""
function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? branch : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return expand('%')
endfunction

" Doesn't work! Use above
function! LightLineFilename2()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
    call CmdLine("Ag \"" . l:pattern . "\" " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For tmuxline, few things need to be done. First open vim in tmux. 
" Then enter command :Tmuxline <theme> <preset>. I chose theme=lightline_insert and preset=crosshair, 
" but you can check it out at https://github.com/edkolev/tmuxline.vim.
" Then do :TmuxlineSnapshot! [file].
" Now add this to tmux.conf -> if-shell "test -f [file]" "source [file]"
" After that open a new tmux session and you are good to go.
" Here I added few changes to separator, apparently it doesn't work well with
" vim powerline fonts.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmuxline_powerline_separators = 0
let g:tmuxline_separators = {
      \ 'left' : '',
      \ 'left_alt': '>',
      \ 'right' : '',
      \ 'right_alt' : '<',
      \ 'space' : ' '}

" Go crazy!
if filereadable(expand("~/.vimrc.local"))
  " In your .vimrc.local, you might like:
  "
  " set autowrite
  " set nocursorline
  " set nowritebackup
  " set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines
  "
  " autocmd! bufwritepost .vimrc source ~/.vimrc
  " noremap! jj <ESC>
  source ~/.vimrc.local
endif
