" INSTALL ------------------------------------------------------------------ {{{
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Change cursor in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
" }}}
" PLUGINS ------------------------------------------------------------------ {{{
call plug#begin('~/.config/nvim/plugged')

" Plug: General
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'w0rp/ale'
Plug 'roxma/nvim-completion-manager'
" Plug 'Valloric/YouCompleteMe', {'do': './install.py --gocode-completer --tern-completer'}
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-dispatch'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-conflicted'

" Language Server
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}



" Plug: Syntax
" HTML
Plug 'evidens/vim-twig'

" Javascript
" Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }

" Coffee-script
" Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

" Python
" Plug 'hdima/python-syntax', { 'for': 'python' }
" Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }

" Go
" Plug 'fatih/vim-go'
" Plug 'zchee/deoplete-go', { 'do': 'make'}

" Plug: Themes
Plug 'jdkanani/vim-material-theme'
Plug 'jscappini/material.vim'
Plug 'morhetz/gruvbox'
Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plug 'jordwalke/flatlandia'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jacoborus/tender'
Plug 'MaxSt/FlatColor'
Plug 'iCyMind/NeoSolarized'
Plug 'aunsira/macvim-light'
Plug 'ayu-theme/ayu-vim'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

call plug#end()
" }}}
" GENERAL ------------------------------------------------------------------ {{{
" set nocompatible

syntax on

" ColorScheme
set background=light
let g:one_allow_italics = 1
colorscheme one

set relativenumber
set number

" Disable Backup
set nobackup
set noswapfile
set nowritebackup

" Fix backspace
set backspace=indent,eol,start
set showmatch
set ruler
set hlsearch
set incsearch
set smartcase
set smarttab
set noerrorbells
set visualbell
set tabstop=4
set shiftwidth=4
set shiftround
set autoindent
set smartindent
set expandtab
set cursorline
set linespace=6
set noequalalways
set wildmenu

" Enable mouse
set mouse=a

" Autoload file on external changes
set autoread

" Hide abandoned buffers
set hidden

if has("linebreak")
set linebreak                 " Wrap lines at word boundaries
set showbreak=...
if exists("+breakindent")
  set breakindent             " Indent soft-wrapped lines
endif
endif
set nowrap

set fillchars+=vert:\ ,diff:\    " Use space for vertical split, diff fill char

" Set Invisble characters
set listchars=tab:>\ ,extends:>,precedes:<,nbsp:+
if &termencoding ==# "utf-8" || &encoding ==# "utf-8"
" let &fillchars = "vert:\u2502,diff: "
let &fillchars = "vert: ,diff: "
let &listchars = "tab:\u25b8 ,extends:\u276f,precedes:\u276e,nbsp:\u2334"
if has("linebreak")
  let &showbreak = "\u21aa"
endif
endif

" Global ignore pattern
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,__pycache__

filetype plugin on
filetype plugin indent on
" }}}
" KEYMAPS ------------------------------------------------------------------ {{{
noremap <F1> :NERDTreeToggle<CR>
noremap <F2> :set list!<cr>
noremap <F3> <ESC>:Ag<CR>
noremap <F4> <ESC>:Ag <C-R><C-W> *<CR>
noremap <F5> :terminal<cr>

" FZF
map <silent> <C-a> :Buffers<CR>
map <silent> <C-p> :Files<CR>
map <silent> <C-s> :Ag<CR>

" use jj to return to normal mode
imap jj <Esc>

" Use Shift Tab to unindent
nmap <Tab> a<C-t><Esc>
nmap <S-Tab> a<C-d><Esc>
" nmap <Tab> >>
" nmap <S-Tab> <<
" imap <Tab> <C-t>
" imap <S-Tab> <C-d>
vmap <Tab> :><CR>gv
vmap <S-Tab> :<<CR>gv

" Pane resize
map <silent> <S-Right> <C-w><
map <silent> <S-Down> <C-W>-
map <silent> <S-Up> <C-W>+
map <silent> <S-Left> <C-w>>

" Enable . command in visual mode
vnoremap . :normal .<cr>

" switch between current and last buffer
" nmap <c-Tab> <c-^>

map <silent> <C-h> <C-w>h
map <silent> <C-j> <C-w>j
map <silent> <C-k> <C-w>k
map <silent> <C-l> <C-w>l

" map <silent> <C-h> :call WinMove('h')<cr>
" map <silent> <C-j> :call WinMove('j')<cr>
" map <silent> <C-k> :call WinMove('k')<cr>
" map <silent> <C-l> :call WinMove('l')<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Esc-Esc to exit terminal mode
tnoremap <Esc><Esc> <C-\><C-n>

" Raise privileges
cmap w!! w !sudo tee >/dev/null %

" Toogle fold open/close in normal mode. Create fold in Visual mode
nnoremap <silent> <space> @=(foldlevel('.')?'za':"\<space>")<CR>
vnoremap <space> zf

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F6> :call LanguageClient#textDocument_rename()<CR>

" Deoplete tab-complete
" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : deoplete#manual_complete()
" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-n>" : "<S-Tab>"

" " Deoplete close popup and save indent with Enter
" inoremap <silent><expr><CR> pumvisible() ? deoplete#smart_close_popup() : "\<CR>"
" }}}
" LEADER ------------------------------------------------------------------- {{{
" map leader to ,
let mapleader = ","

",w to save
nmap <leader>w :w!<cr>

",t to create a new tab
nmap <leader>t :tabnew<cr>

" ,. to select next/previous buffer
"nmap <leader>- :bn<cr>
"nmap <leader>. :bp<cr>

" Search with Ack
" nmap <leader>s <Esc>:Ack!

" Strip whitespace
nnoremap <leader>l :Strip<cr>

" Fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>ga :Gcommit --amend<CR>
nnoremap <leader>gt :Gcommit -v -q %<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gk :Gpush<CR>
nnoremap <leader>gj :Gpull<CR>

if isdirectory(expand("~/.config/nvim/plugged/tabular"))
    nmap <Leader>a& :Tabularize /&<CR>
    vmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    nmap <Leader>a=> :Tabularize /=><CR>
    vmap <Leader>a=> :Tabularize /=><CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a,, :Tabularize /,\zs<CR>
    vmap <Leader>a,, :Tabularize /,\zs<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
endif
" }}}
" FUNCTIONS ---------------------------------------------------------------- {{{
" Strip whitespace --------------------------------------------------------- {{{
function! StripWhitespace()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
command! Strip call StripWhitespace()<cr>
" }}}
" Window Movement ---------------------------------------------------------- {{{
" move to the window in the direction shown, or create a new window
"
" https://github.com/nicknisi/dotfiles/blob/master/vim/vimrc.symlink
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction
" }}}
" Clipboard - -------------------------------------------------------------- {{{
" Copy from and to Mac Clipboard
let os = substitute(system('uname'), "\n", "", "")
function! ClipboardYank()
  if os == "Linux"
    call system('xclip -i -selection clipboard', @@)
  elseif os == "Darwin"
    system('pbcopy', @@)
  endif
endfunction
function! ClipboardPaste()
  if os == "Linux"
    let @@ = system('xclip -o -selection clipboard')
  elseif os == "Darwin"
    let @@ = system('pbpaste')
  endif
endfunction

" function! ClipboardYank()
"   call system('pbcopy', @@)
" endfunction
" function! ClipboardPaste()
"   let @@ = system('pbpaste')
" endfunction

vnoremap <silent> <leader>y y:call ClipboardYank()<cr>
vnoremap <silent> <leader>d d:call ClipboardYank()<cr>
nnoremap <silent> <leader>p :call ClipboardPaste()<cr>p
" }}}
" Space2Tab/Tabs2Space ----------------------------------------------------- {{{
" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endfunction

command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)
" }}}
" }}}
" PLUGIN SETTINGS ---------------------------------------------------------- {{{
" NERDTree ----------------------------------------------------------------- {{{
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
" }}}
" AIRLINE ------------------------------------------------------------------ {{{
" let g:tender_airline = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'one'
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
" }}}
" JEDI --------------------------------------------------------------------- {{{
" Do not show docstring on completion
" autocmd FileType python setlocal completeopt-=preview
" }}}
" DEOPLETE ----------------------------------------------------------------- {{{
" let g:deoplete#enable_at_startup = 1
" if !exists('g:deoplete#omni#input_patterns')
"   let g:deoplete#omni#input_patterns = {}
" endif

" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" }}}
" NEOVIM COMPLETION MANAGER ------------------------------------------------ {{{
  inoremap <expr> <Tab> pumvisible() ? "<C-n>" : "<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "<C-p>" : "<S-Tab>"
  " imap <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>")
  " imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-U>":"\<CR>")
  inoremap <expr> <CR> (pumvisible() ? "<c-y>" : "<CR>")
" }}}
" LANGSERVER --------------------------------------------------------------- {{{
  let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ }
  let g:LanguageClient_autoStart = 1
  set omnifunc=LanguageClient#complete
" }}}
" ALE ---------------------------------------------------------------------- {{{
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_sign_error = '⨉ '
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

hi ALEError guifg=#dc322f guibg=none
hi ALEWarning guifg=#df5f00 guibg=none

" }}}
" FZF ---------------------------------------------------------------------- {{{
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" }}}
" CONFLICTED --------------------------------------------------------------- {{{
let g:diffget_local_map = 'gl'
let g:diffget_upstream_map = 'gu'

set stl+=%{ConflictedVersion()}
" }}}
" }}}
" MISC SETTINGS ------------------------------------------------------------ {{{
" Trim Whitespace on save
"autocmd FileType php,ruby,python,coffee,js,java,css
autocmd BufWritePre * :call StripWhitespace()
" -------------------------------------------------------------------------------------------------

" Remember last location in file
" -------------------------------------------------------------------------------------------------
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
    " au ColorScheme * highlight VertSplit cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
endif
" -------------------------------------------------------------------------------------------------

" FileType Specific settings
" -------------------------------------------------------------------------------------------------
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 expandtab
au BufNewFile,BufReadPost *.yaml setl shiftwidth=2 tabstop=2 expandtab
au BufNewFile,BufReadPost *.yml setl shiftwidth=2 tabstop=2 expandtab
" -------------------------------------------------------------------------------------------------
" }}}
" vim: fdm=marker:sw=2:sts=2:et
