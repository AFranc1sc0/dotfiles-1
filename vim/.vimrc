:autocmd!

" Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
                autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
                        endif

call plug#begin('~/.vim/bundle')

Plug 'OmniSharp/omnisharp-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/unicode.vim'
Plug 'tpope/vim-dispatch'
" Plug 'honza/vim-snippets'
" Plug 'Shougo/deoplete.nvim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'

call plug#end()

let g:deoplete#enable_at_startup = 1


if version >=700
    " Antialias fonts
"    set nomacatsui anti enc=utf-8 termencoding=macroman gfn=Monaco:h12
"    set antialias
    " Cursor Line Hightlight
"    set cursorline
"    set guifont=Monaco:h14.00
    set guifont=M+\ 2m:h14.00
    set printfont=Monaco:h12.00
"    set tags+=~/eng/trunk/timbre/tags
    "autocmd Filetype verilog
"    set omnifunc=ccomplete#Complete
else
    "Set a small font
    set guifont=Terminal:h6:cOEM
endif

"let &t_Co=256

"Show white space type things visually.
set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
set listchars=tab:➞\ ,extends:›,precedes:‹,nbsp:·,trail:•
set ruler
set nowrap

" Shut off the stupid bell
set vb t_vb=

"Always set auto indent
set ai

"Make , the mapleader
let mapleader=","
let maplocalleader=","

"Always have a cool status line
set laststatus=2
set statusline=%{getcwd()}\ \ [%02n]\ %(%M%R%H%)\ %f\ %=<%l,%c%V>\ %P
"set statusline=[%02n]\ \ %F\ %=<%l,%c%V>\ %P

"Follow search occurences as they are typed
set incsearch

"Tabs are actually spaces. Tab indents 4 spaces.
set ts=4
set sw=4
set sta
set et
set sts=4

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

"Cool.  This will try to complete a command when <TAB> is hit
set wildmenu

"Allow backspace backup over end-of-line and start-of-line
set backspace=2

"Allow hidden buffers
set hidden

"Extended regular expressions
set magic

"Show the current uncompleted command
set showcmd

"Show the matching bracket
"set showmatch

"Show current mode
set showmode

" Scrolling starts 1 line before top and bottom of the screen
set scrolloff=1

"Set the dictionary location
set dictionary=/usr/share/dict/words

"Ignore filenames with the following suffixes when using edit
"Mostly LaTex stuff
set suffixes=.aux,.bak,.dvi,.gz,.idx,.log,.tar,.swp

"Don't scroll so far left
set sidescroll=5

"Ignore case in searches
set ignorecase

"Set folding to automatically close when the cursor is moved away
"Set some fold options to play with
"set foldmethod=indent
"set foldnestmax=2
"set foldlevel=2
"set nofoldenable
"set foldclose=all

"This makes it possible to source .vimrc files from any directory.
"This is usefull for adding relative paths to "path". i.e. ../design/
set exrc


" Cursor Line Hightlight
"set cursorline

"Use spaces in python.  Had trouble in windows with tabs/spaces combo, grrr.
au BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
au BufRead *.py set ts=4 sw=4 sta et sts=4 ai
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
au InsertEnter *.py match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave *.py match ExtraWhitespace /\s\+$/
au ColorScheme *
    \ highlight ExtraWhitespace ctermbg=red guibg=darkred
" Remove traling white spaces
"au BufWritePre *.py :%s/\s\+$//e

"C code
au BufRead,BufNewFile *.c set smartindent
au BufRead,BufNewFile *.c set ts=8 sw=8 sts=8 sta noet ai
au BufRead,BufNewFile *.h set smartindent
au BufRead,BufNewFile *.h set ts=8 sw=8 sts=8 sta noet ai

"Verilog
au BufRead *.v set ts=4 sw=4 sta et sts=4 ai smartindent cinwords=always,if,else,begin,for
"au BufRead *.py set ts=8 noet sts=0 sw=8
" Remove traling white spaces
"au BufWritePre *.v normal m`:%s/\s\+$//e ``
"au BufWritePre *.v :%s/\s\+$//e

au BufRead *.vh set ts=4 sw=4 sta et sts=4 ai filetype=cpp

" Tex and LaTeX
au BufRead *.tex syn spell toplevel set spell spelllang=en_us

"Make real tabs when editing a Makefiles and shell scripts
au BufRead,BufEnter *.sh set ts=8 noet sts=0 sw=8

"Make real tabs when editing a Makefiles and shell scripts
au BufRead,BufEnter *akefile set ts=8 noet sts=0 sw=8
au BufLeave *akefile set ts=8 et   sts=4 sw=4

"Make real tabs when editing a Makefile
au BufEnter *.mak set ts=8 noet sts=0 sw=8
au BufLeave *.mak set ts=8 et   sts=4 sw=4

"Same for tag files
au BufEnter tags set ts=8 noet sts=0 sw=8
au BufLeave tags set ts=8 et   sts=4 sw=4

"CMake
au BufRead CMakeLists.txt set filetype=cmake
au BufRead CMakeCache.txt set filetype=cmake

" c#
au BufRead *.cs set ts=4 sw=4 sta et sts=4 ai

"journal files have a fixed width
au BufEnter *.j set tw=79
au BufLeave *.j set tw=0
"au VimEnter *.j so /home/tweaver/test.vim

".stm files should look like C not html
au BufEnter *.stm set filetype=c
"au BufLeave *.stm set filetype=

".log files should display with not highlight
au BufEnter *.log set filetype=text

".markdown files should auto wrap at 79 chars
au BufEnter *.md set filetype=markdown
au BufEnter *.markdown set tw=79
au BufLeave *.markdown set tw=0

"SConstruct and SConscript files should display with python syntax highligting
au BufRead SCons* set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
au BufRead SCons* set ts=4 sw=4 sta et sts=4 ai
au BufEnter SCons* set filetype=python

" Set nu when editing .php files
au BufEnter *.php set nu
"au BufLeave *.php set nonu

" NGC filetype
"au BufEnter *.ngc set filetype=nc

" PBasic
au BufEnter *.bpe set filetype=basic

" Textile
au BufEnter *.textile set filetype=textile lbr wrap

" AsciiDoc
autocmd BufEnter,BufRead,BufNewFile *.adoc.txt
        \ setlocal ts=4 sw=4 sta et sts=4 ai lbr filetype=asciidoc
        \ formatoptions=tcqn
        \ formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*<\\d\\+>\\s\\+\\\\|^\\s*[a-zA-Z.]\\.\\s\\+\\\\|^\\s*[ivxIVX]\\+\\.\\s\\+
        \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>
" au BufEnter *.adoc set filetype=asciidoc  lbr wrap
" au BufEnter *.adoc.txt set filetype=asciidoc  lbr wrap

" .Love files
au BufReadCmd *.love call zip#Browse(expand("<amatch>"))

au BufRead,BufNewfile *.kit set filetype=yaml

syntax enable
"hi      SpecialKey  ctermfg=gray ctermbg=black guifg=DarkRed
"hi      Directory   ctermfg=Brown	                        guifg=Brown
"hi      Comment	    ctermfg=darkgreen	                    guifg=darkgreen
"hi      PreProc	    ctermfg=Brown		                    guifg=Brown
""hi    Constant	  ctermfg=LightRed
"hi      Constant    ctermfg=Gray		                    guifg=Darkgreen
"hi      Special	    ctermfg=White		                    guifg=Black
"hi      Search	    ctermfg=Black       ctermbg=Yellow	    guibg=Yellow
"hi      CursorLine  ctermfg=darkgrey    ctermbg=lightcyan	guibg=Gray12
"hi      CursorColumn ctermfg=Yellow     ctermbg=Yellow	    guibg=Yellow

"map <F2> o<CR>Entry Time:<Esc>:r!date +\%T<CR>kJo
"map <F3> <Esc>kzz0<S-v>
"map <F4> <Esc>jzz0<S-v>

map <F5> :SyntasticCheck<CR>
map <F7> :set hlsearch <CR>
map <F8> :set nohlsearch <CR>

" Surround word with backticks ``
map <Leader>` ysW`

"colorscheme slate
"Map ^T to start aspell on the file
"map  :w!<CR>:!aspell check %<CR>:e! %<CR>

" Fill the screen vertically
"set columns=80

"syntax on
"filetype on
"filetype plugin indent on

"function! SuperCleverTab()
"    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
"        return "\<Tab>"
"    else
"        if &omnifunc != ''
"            return "\<C-X>\<C-O>"
"        elseif &dictionary != ''
"            return "\<C-K>"
"        else
"            return "\<C-N>"
"        endif
"    endif
"endfunction

"inoremap <Tab> <C-R>=SuperCleverTab()<cr>
"inoremap <C-F6> :ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"inoremap map <C-space> <C-x><C-o>

" Open .vimrc to edit
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr> :echo "sourced" $MYVIMRC<cr>

set textwidth=79
set lbr

" Don't let CTRL-n search through included files. Takes too long
" set complete=.,w,b,u,t,i <-- remove the i
set complete=.,w,b,u,t

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"call togglebg#map("<F6>")

" Silver Searcher
"let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ackprg = 'ag --vimgrep'

"MacVim specific options
"Turn off the toolbar
set guioptions-=T

"let g:solarized_contrast="high"
"set transparency=5
"colorscheme blackboard
set background=dark
let g:solarized_termcolors=256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1

augroup MyColors
    autocmd!
"    autocmd ColorScheme * highlight SpecialKey term=bold cterm=italic ctermfg=242 gui=italic guifg=#586e75
"    autocmd ColorScheme * highlight SpecialKey term=bold  cterm=none ctermfg=242 gui=italic guifg=#586e75
    autocmd ColorScheme * highlight SpecialKey term=bold cterm=none
augroup END
colorscheme solarized8


" Make comments italic
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic
highlight MatchParen cterm=bold ctermbg=none ctermfg=red

"colorscheme slate

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" OmniSharp
"let g:syntastic_cs_checkers = ['code_checker']

let g:OmniSharp_server_stdio = 1
let g:OmniSharp_timeout = 5
set completeopt=longest,menuone,preview
set previewheight=5
let g:OmniSharp_highlight_types = 2

augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

"hi      SpecialKey  ctermfg=gray ctermbg=black guifg=DarkRed
