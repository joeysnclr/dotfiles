" ==============================================
"
"                   .VIMRC
"
" ==============================================


" --- install plugins ---
call plug#begin('~/.vim/plugged')
" color schemes
Plug 'arcticicestudio/nord-vim' 
Plug 'gruvbox-community/gruvbox' 
" visuals
Plug 'vim-airline/vim-airline' " bottom status bar
Plug 'junegunn/goyo.vim' " zen mode
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " color boxes!
" utilities
Plug 'tpope/vim-surround' " SURROUND VIM!!!
Plug 'neoclide/coc.nvim', {'branch': 'release'} " auto complete, jump to definition, renaming
Plug 'prettier/vim-prettier', { 'do': 'yarn install' } " prettify js/html/css/react etc... files
Plug 'tell-k/vim-autopep8' " python formatter
Plug 'tpope/vim-commentary' " easy comments
Plug 'mattn/emmet-vim' " emmet, html auto complete
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy file search
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
" misc
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
call plug#end()

" --- basic config ---
syntax on
set belloff=all 
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent
set autoindent
set nowrap
set ignorecase
set smartcase
set hlsearch
set incsearch
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set number
set relativenumber
set noshowmode
set timeoutlen=1000 ttimeoutlen=0
set lazyredraw " stop flashing when running macros and keybindings
set splitbelow " h splits open below
set splitright " v splits open to the right


" _              _     _           _     
" | |            | |   (_)         | |    
" | | _____ _   _| |__  _ _ __   __| |___ 
" | |/ / _ \ | | | '_ \| | '_ \ / _` / __|
" |   <  __/ |_| | |_) | | | | | (_| \__ \
" |_|\_\___|\__, |_.__/|_|_| |_|\__,_|___/
"            __/ |                        
"           |___/

" - LEADER - 
let mapleader = " "

" - MOVEMENT/NAVIGATION KEYBINDS - 
" semi colon to open command prompt
nnoremap ; :
" colon to go to next f/t occurence
nnoremap : ;
" beggining of line
nnoremap H ^
" end of line
nnoremap L $
" down a paragraph, center line
nnoremap J }zz
" up paragraph, center line
nnoremap K {zz
" redo (opposite of undo)
nnoremap U <c-r>


" - BUFFERS, SPLITS, ETC... -
" save buffer
nnoremap <leader>w :w<cr>
" quit buffer
nnoremap <leader>q :q<cr>
" move between splits
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l
" resize splits
nnoremap <c-l> :vertical resize +3<cr>
nnoremap <c-h> :vertical resize -3<cr>
nnoremap <c-k> :resize +3<cr>
nnoremap <c-j> :resize -3<cr>

" - VIMRC RELATED -
" vimrc edit
nnoremap <leader>ev :vsplit ~/dfm/.vimrc<cr>
" vimrc source
nnoremap <leader>sv :source ~/.vimrc<cr>

" - FZF -
" Find File open fuzzy file search
nnoremap <leader>ff :FZF<cr>
" Fine Line open fuzzy line search
nnoremap <leader>fl :Ag<cr>
" Find Buffer
nnoremap <leader>fb :Buffers<cr>

" - COC -
" coc go to definition
nnoremap <leader>gd <Plug>(coc-definition)
" coc rename definition
nnoremap <leader>rn <Plug>(coc-rename)

" - AUTO PAIR -
inoremap { {}<esc>i
inoremap [ []<esc>i
inoremap ( ()<esc>i

" - SHELL COMMANDS -
nnoremap <leader>tc :!touch 
nnoremap <leader>mk :!mkdir 

" - FILE SPECIFIC
augroup filespecific
    autocmd!
    autocmd FileType python nnoremap <leader>rr :!python3 %<cr>
    autocmd FileType python autocmd BufWritePre <buffer> Autopep8 " py formatting, format on save
augroup END

" - MISC -
" emmit complete <C-e>,
let g:user_emmet_leader_key='<C-e>'
" distraction free mode
nnoremap <leader>df :Goyo<cr>:set relativenumber!<cr>:echom ""<cr>
" open undotree
nnoremap <leader>ut :UndotreeToggle<cr>
" VIMBEGOOD
nnoremap <leader>vbg :VimBeGood<cr>
" update dotfiles on save
augroup jdfm
    autocmd!
    autocmd BufWritePost ~/dfm/* :!jdfm update
augroup END


" -- visual config ---
colorscheme gruvbox
set termguicolors
let g:Hexokinase_highlighters = ['virtual']
:autocmd InsertEnter * set cul " changes current line color in insert mode
:autocmd InsertLeave * set nocul " ^^
let g:fzf_layout = {'window': {'width': 0.8, 'height': 0.8 }} " fzf window
let $FZF_DEFAULT_OPTS = '--reverse' " fzf window

" --- utilities config ---
let g:prettier#autoformat = 1 " auto save all prettier files
let g:prettier#autoformat_require_pragma = 0 " auto save all prettier files
let g:autopep8_disable_show_diff=1 " py formatting, hide change window
" coc tab through autocomplete menu
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" fzf open file in horzintal split on enter
let g:fzf_action = { 'alt-enter': 'vsplit' }


