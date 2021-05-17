" Sets
set path+=**

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

set exrc
set relativenumber
set nu
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes

" Give more space for displaying messages
set cmdheight=2

set updatetime=50

call plug#begin('~/.vim/plugged')

"Git
Plug 'tpope/vim-fugitive'

"Fuzzy finder
Plug 'nvim-telescope/telescope.nvim'

" Undo hisory
Plug 'mbbill/undotree'

" Syntax Tree
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Language Server
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'

" Themes
Plug 'gruvbox-community/gruvbox'
call plug#end()

" Theme Configuration
let g:gruvbox_contrast_dark='soft'
colorscheme gruvbox
highlight Normal guibg=none

" Remapping
nnoremap <F5> :UndotreeToggle<CR>
nnoremap <leader> ps :lua require('telescope.builtin').grep_string({search = vim.fn.input("Grep For > ")})
