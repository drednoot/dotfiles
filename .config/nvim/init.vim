set number
set relativenumber
set autowrite
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nobackup
set scrolloff=5
" set sidescroll=5
" set nowrap
" set wrapmargin=4
set ignorecase
set smartcase
set showmode
set showmatch
set nohls
set history=1000
set wildmenu
set cursorline
set autochdir

au ColorScheme * hi Normal ctermbg=none 

nmap <S-j> :bnext<cr>
nmap <S-k> :bprev<cr>
nmap <S-q> :bp <bar> bd #<cr>
nmap <C-t> :NERDTreeToggle<cr>
nmap <C-b> :enew<cr>

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-=> 2<C-w>+
nmap <C--> 2<C-w>-
nmap <C-.> 3<c-w>>
nmap <C-,> 3<c-w><
nmap <C-s>s <C-w>s
nmap <C-s><S-s> <C-w>v


set clipboard=unnamedplus

syntax enable
filetype plugin indent on

" haskell
au FileType haskell setlocal tabstop=2 shiftwidth=2 expandtab

" dotfiles test
au BufWritePost init.vim,.xbindkeysrc,.xinitrc,.Xresources,.zshrc,vifmrc,mpv.conf silent :exe "!~/Documents/arch_dotfiles/copy_dot.sh"

nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

" :ColorHighlight
let g:neovide_transparency=0.9
set guifont=Fira\ Code:h12
set mouse=a

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'https://github.com/rstacruz/vim-closer'
Plug 'https://github.com/tpope/vim-endwise'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/dawikur/base16-vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'https://github.com/preservim/nerdtree'
Plug 'akinsho/toggleterm.nvim'
Plug 'norcalli/nvim-colorizer.lua'
" Plug 'norcalli/nvim-terminal.lua'

Plug 'https://github.com/neovimhaskell/haskell-vim'
Plug 'rust-lang/rust.vim'

" nvim-cmp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

call plug#end()

set termguicolors
let base16colorspace=256
colorscheme base16-seti

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '

lua require("toggleterm").setup({size = 15,	open_mapping = [[<c-\>]],hide_numbers = true,shade_filetypes = {},shade_terminals = true,shading_factor = 1,start_in_insert = true,	insert_mappings = true,	persist_size = true,direction = "float",close_on_exit = "true",	float_opts = {border = "curved",winblend = 0,highlights = {border = "Normal",background = "Normal",},},})

lua require("user/cmp")
nnoremap <silent> gd <cmd> lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr <cmd> lua vim.lsp.buf.references()<CR>
nnoremap <silent> gq <cmd> cclose <CR>

lua require'colorizer'.setup()
" lua require'terminal'.setup()

" lua require("lspconfig").pyright.setup{}
" source $HOME/.config/nvim/plug-config/coc.vim
"
