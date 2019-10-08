
""""""""""""""""""""""""""""""""""""""""""
"set encoding                            "
""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8
""""""""""""""""""""""""""""""""""""""""""
"let vim different from vi               "
""""""""""""""""""""""""""""""""""""""""""
set nocompatible  
""""""""""""""""""""""""""""""""""""""""""
"set pathogen                            "
""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()
syntax enable
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""
"set color                               "
""""""""""""""""""""""""""""""""""""""""""
set t_Co=256

colorscheme molokai
hi Normal ctermfg=white ctermbg=NONE 
hi NonText ctermbg=NONE 
hi LineNr ctermbg=NONE 
hi VertSplit ctermbg=NONE 
hi FoldColumn ctermbg=NONE 
hi Comment ctermfg=cyan
hi String ctermfg =cyan
set cursorline
set cursorcolumn
set hlsearch
hi CursorLine cterm=none ctermbg=31 ctermfg=White
hi CursorColumn cterm=none ctermbg=31 ctermfg=White
hi Search cterm=reverse ctermbg=none ctermfg=none 

""""""""""""""""""""""""""""""""""""""""""
"set form                                "
""""""""""""""""""""""""""""""""""""""""""
set number
set relativenumber
set ruler
""""""""""""""""""""""""""""""""""""""""""
"for search                              "
""""""""""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase
set incsearch
""""""""""""""""""""""""""""""""""""""""""
"for smart indent                        "
""""""""""""""""""""""""""""""""""""""""""
set cindent
""""""""""""""""""""""""""""""""""""""""""
"for tab                                 "
""""""""""""""""""""""""""""""""""""""""""
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab

""""""""""""""""""""""""""""""""""""""""""
"other setting                           "
""""""""""""""""""""""""""""""""""""""""""
set confirm
set backspace=indent,eol,start

set history=500

set showcmd
set showmode
set wrap
set mouse=a
""""""""""""""""""""""""""""""""""""""""""
"search in visual mode                   "
""""""""""""""""""""""""""""""""""""""""""
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>
""""""""""""""""""""""""""""""""""""""""""
"Control c                               "
""""""""""""""""""""""""""""""""""""""""""
map <C-c> : silent call SwitchFullSimpleMode()<CR>
map! <C-c> <Esc>:call SwitchFullSimpleMode()<CR>
function SwitchFullSimpleMode()
	if (&mouse == "a")
    NERDTreeTabsClose
		let &mouse = ""
		set nocindent
		set nonumber norelativenumber
		set wrap
    set paste
		echo "Switch to simple mode.(nomouse, nonumber, nocindent, wrap, paste, NERDTreeTabsClose)"
	else
    "NERDTreeTabsOpen
		let &mouse = "a"
		set cindent
		set number relativenumber
		set wrap
    set nopaste
		echo "Switch to full mode.(mouse, number, cindent, wrap, nopaste)"
	endif
endfunction
""""""""""""""""""""""""""""""""""""""""""
"movement in line                        "
""""""""""""""""""""""""""""""""""""""""""
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
""""""""""""""""""""""""""""""""""""""""""
"widows navigation                       "
""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" maximize horizontal direction window
nnoremap [ <C-w>_
" maximize vertical direction window
nnoremap ] <C-w>\|
" equalize both horizontal vertical direction window
nnoremap = <C-w>=
" increase/ decrease horizontal direction window
nnoremap + <C-W>+
nnoremap - <C-W>-
" increase/ decrease vertical direction window
nnoremap ( <C-w><
nnoremap ) <C-w>>
set splitbelow
set splitright
""""""""""""""""""""""""""""""""""""""""""
" Tab control                            "
""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-n> gt
nnoremap <C-p> gT
noremap <F6> :-tabmove<cr>
noremap <F7> :+tabmove<cr>
noremap <F9> :tabclose<cr>
noremap <F9> : call CloseTab()<cr>
function CloseTab()
	if (tabpagenr("$") == 1)
    qa
	else
    tabclose
	endif
endfunction

autocmd BufEnter * call CheckLeftBuffers()
function! CheckLeftBuffers()
  let i = 1
  while i <= winnr('$')
    if getbufvar(winbufnr(i), '&buftype') == 'help' ||
        \ getbufvar(winbufnr(i), '&buftype') == 'quickfix' ||
        \ exists('t:NERDTreeBufName') &&
        \   bufname(winbufnr(i)) == t:NERDTreeBufName ||
        \ bufname(winbufnr(i)) == '__Tag_List__'
      let i += 1
    else
      break
    endif
  endwhile
  if i == winnr('$') + 1
    if tabpagenr('$') == 1
      qall
    else
      tabclose
    endif
  endif
  unlet i
endfunction
""""""""""""""""""""""""""""""""""""""""""
"set for foldmethod                      "
""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent
set foldnestmax=2
set foldcolumn=0
nnoremap <space> za
""""""""""""""""""""""""""""""""""""""""""
"set for vimdiff                         "
""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-g> ]c
nnoremap <C-o> [c
""""""""""""""""""""""""""""""""""""""""""
" Nerdcommenter                          "
""""""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
 let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
map <C-m> <leader>c<space>
""""""""""""""""""""""""""""""""""""""""""
" Nerdtree                               "
""""""""""""""""""""""""""""""""""""""""""
autocmd vimenter * silent NERDTree Home| wincmd p 
autocmd FileType nerdtree setlocal nocursorcolumn nocursorline
map <C-t> : silent call ToggleNerdTree()<CR>
function ToggleNerdTree()
  NERDTreeTabsToggle
  wincmd W
  NERDTreeTabsFind
  echo "Toggle Nerd Tree.(NERDTreeTabsToggle, NERDTreeTabsFind)"
endfunction
nnoremap <silent> <C-d> :NERDTreeTabsFind <CR>
let NERDTreeShowBookmarks=1
let g:NERDTreeWinSize=20
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_autofind=1
""""""""""""""""""""""""""""""""""""""""""
" Nerdtree Directory Highlighting        "
""""""""""""""""""""""""""""""""""""""""""
hi Directory cterm=bold ctermfg=Magenta
""""""""""""""""""""""""""""""""""""""""""
" NERDTree File Highlighting             "
""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
""""""""""""""""""""""""""""""""""""""""""
" NumbersToggle                          "
""""""""""""""""""""""""""""""""""""""""""
nnoremap <F3> :NumbersToggle<CR>
""""""""""""""""""""""""""""""""""""""""""
" Syntastic                              "
""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_cpp_checkers=[]
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_python_pyflakes_exec ='pyflakes3'
let g:syntastic_tex_checkers=[]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height= 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
""""""""""""""""""""""""""""""""""""""""""
" Tagbar                                 "
""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width=30
""""""""""""""""""""""""""""""""""""""""""
" Airline                                "
""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'
""""""""""""""""""""""""""""""""""""""""""
" Airline tabline                        "
""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
""""""""""""""""""""""""""""""""""""""""""
" Cpp syntax                             "
""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
""""""""""""""""""""""""""""""""""""""""""
" Easymotion                             "
""""""""""""""""""""""""""""""""""""""""""
map  <C-u> <Plug>(easymotion-bd-w)
nmap <C-u> <Plug>(easymotion-overwin-w)
" map  f <Plug>(easymotion-bd-f)
" nmap f <Plug>(easymotion-overwin-f)
" nmap s <Plug>(easymotion-overwin-f2)
" map <Leader>L <Plug>(easymotion-bd-jk)
" nmap <Leader>L <Plug>(easymotion-overwin-line)
""""""""""""""""""""""""""""""""""""""""""
" Fugitive                               "
""""""""""""""""""""""""""""""""""""""""""
set diffopt+=vertical
""""""""""""""""""""""""""""""""""""""""""
" Gutentags                              "
""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>f <C-]>
nnoremap <leader>t <C-t>
""""""""""""""""""""""""""""""""""""""""""
" Vimtex                                 "
""""""""""""""""""""""""""""""""""""""""""
" change vimtex/autoload/vimtex/qf.vim : 84
" from
" botright cwindow
" to
" botright cwindow 2
let g:vimtex_view_method = 'zathura'
""""""""""""""""""""""""""""""""""""""""""
" YCM                                    "
""""""""""""""""""""""""""""""""""""""""""
set completeopt-=preview
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
""""""""""""""""""""""""""""""""""""""""""
" Ctrl p                                 "
""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = 'z'
