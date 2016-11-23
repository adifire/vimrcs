set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'

Plugin 'altercation/vim-colors-solarized'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" For go env, additional plugins
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'ternjs/tern_for_vim'

" For Neocomplete
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

Plugin 'sjl/gundo.vim'

Plugin 'itchyny/lightline.vim'

Bundle 'edkolev/tmuxline.vim'

" used for repeating operator actions via "."
Plugin 'tpope/vim-repeat'

" Interactive scratchpad for hackers.. ;) https://github.com/metakirby5/codi.vim
Plugin 'metakirby5/codi.vim'

" Vim grep. https://github.com/mhinz/vim-grepper
Plugin 'mhinz/vim-grepper'

" Surround.vim
Plugin 'tpope/vim-surround'

" Gitgutter.vim
Plugin 'airblade/vim-gitgutter'

" vim-unimpaired
Plugin 'tpope/vim-unimpaired'

" vim-expand-region
Plugin 'terryma/vim-expand-region'

" Additional Syntax
Plugin 'motus/pig.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
let mapleader=","

" always show the status bar
set noshowmode

set hidden

let g:solarized_termcolors=16
"let g:rehash256 = 1
syntax enable
set background=dark
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
map <silent> <leader>u :GundoToggle<CR>

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

" NERDTree Customizations
let g:NERDTreeWinPos = "right"
nmap <silent> <leader>nn :NERDTreeToggle<CR>
nmap <silent> <leader>nf :NERDTreeFind<CR>
let NERDTreeShowHidden=0

" CtrlP
let g:ctrlp_working_path_mode = 0
nmap <silent> <leader>j :CtrlP<CR>
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

" lightline
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
      \   'fugitive': 'LightLineFugitive'
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
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The Silver Searcher
" Needs Silver Searcher on the host -> brew install ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
" if executable('ag')
"   " Use Ag over Grep
"   set grepprg=ag\ --nogroup\ --nocolor
" 
"   " Use ag in CtrlP for listing files. Lightning fast and respects
"   " .gitignore
"   let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'
" 
"   " ag is fast enough that CtrlP doesn't need to cache
"   let g:ctrlp_use_caching = 0
" 
"   if !exists(":Ag")
"     command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
"     nnoremap \ :Ag<SPACE>
"   endif
" endif
" 
" " bind K to grep word under cursor
" nnoremap <silent> <leader>a :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" 
" " bind \ (backward slash) to grep shortcut
" command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" nnoremap \ :Ag<SPACE>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-grepper
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap \ :Grepper<cr>

" Tagbar
" nmap <silent> <leader>z :TagbarToggle<CR>

" Use ag in CtrlP for listing files. Lightning fast and respects
" .gitignore
let g:ctrlp_user_command = 'ag -Q -l --nocolor -g "" %s'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

"""""""""""""""""""""""""""""
" Neocomplete
"""""""""""""""""""""""""""""
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Refresh all buffers
nmap <leader>la :bufdo e!<CR>

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
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)

" gotagbar config
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
    return branch !=# '' ? '⭠ '.branch : ''
  endif
  return ''
endfunction

function! LightLineFilename()
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

