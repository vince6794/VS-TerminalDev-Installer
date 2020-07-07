"
"____   ____.__
"\   \ /   /|__| ____   ____  ____   ____ ____________
" \   Y   / |  |/    \_/ ___\/ __ \ /    \\___   /  _ \
"  \     /  |  |   |  \  \__\  ___/|   |  \/    (  <_> )
"   \___/   |__|___|  /\___  >___  >___|  /_____ \____/
"                   \/     \/    \/     \/      \/
"                             _________.__
"                            /   _____/|__| _____   ____  ____   ____   ____
"                            \_____  \ |  |/     \_/ __ \/  _ \ /    \_/ __ \
"                            /        \|  |  Y Y  \  ___(  <_> )   |  \  ___/
"                           /_______  /|__|__|_|  /\___  >____/|___|  /\___  >
"                                   \/          \/     \/           \/     \/
"
"
""

" Plugin Manager {{{
call plug#begin("~/.vim/plugged")
""Plugin Section
" Code intellisense
 Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Prettify code
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
 Plug 'sbdchd/neoformat'
 Plug 'jiangmiao/auto-pairs'

" cTags support
 "Plug 'ludovicchabant/vim-gutentags'

" Git Support
 Plug 'tpope/vim-fugitive'

""Utils
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'junegunn/fzf.vim'
 Plug 'norcalli/nvim-colorizer.lua'
 Plug 'mbbill/undotree'
 Plug 'mhinz/vim-startify'

""Language Support
 Plug 'sheerun/vim-polyglot'

" Styles
 Plug 'gruvbox-community/gruvbox'
 Plug 'sainnhe/gruvbox-material'
 Plug 'phanviet/vim-monokai-pro'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'frazrepo/vim-rainbow'
 Plug 'ryanoasis/vim-devicons'

call plug#end()

""Plugin Configurations

"}}}

" Theme {{{
if has('termguicolors')
  set termguicolors
endif

let g:rainbow_active = 1

lua require'colorizer'.setup()
let g:airline_theme = 'gruvbox_material'

" For dark version.
set background=dark

let g:gruvbox_material_background = 'soft'
colorscheme gruvbox-material
" }}}

" Formatting {{{
 let g:neoformat_try_formatprg = 1
" }}}

" Symbols Management {{{

" coc extensions
let g:coc_global_extensions = [
      \ 'coc-tslint-plugin',
      \ 'coc-tsserver',
      \ 'coc-emmet',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-snippets',
      \]



" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" Mappings for CoCList
" Show all diagnostics.
noremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

"}}}

" Language specific configuration {{{

  "NodeJS {{{
  "Ignoring node_modules
  let $FZF_DEFAULT_COMMAND = 'ag -g ""'
  set wildignore+=**/node_modules/**
"}}}

"}}}

" File browsing {{{
"" FILE BROWSING:
" Finding Files
" Search down into subfolders
" Provides tab-completion fo all file-related tasks
set path+=**

" Tweaks for browsing
let g:netrw_altv=1
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize=30
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

noremap <silent> <C-e> :call ToggleNetrw()<CR>
"}}}

"Custom mapping {{{
"Set leader
let mapleader = " "
" Error switching
nnoremap <leader>Ep <Plug>(coc-diagnostic-prev)
nnoremap <leader>En <Plug>(coc-diagnostic-next)

" Switching Between panels
" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <leader>u :UndotreeToggle<CR>

"Custom Mapping
"Insert newLine without enter in INSERT mode
"nnoremap o o<Esc>
"nnoremap O O<Esc>

nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>

"List buffers
nnoremap <leader>b :ls<cr>:b

"}}}

"Autocmd {{{
"augroup remember_folds
"  autocmd!
"  autocmd BufWinLeave ?* mkview
"  autocmd BufWinEnter ?* silent! loadview
"augroup END
"set viewoptions-=options

" Formatting
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
"}}}

"Native Configuration {{{
set nocompatible
syntax on
filetype plugin on
set noerrorbells
set noshowmatch
set nohlsearch
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu rnu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.nvim/undodir
set undofile
set incsearch
set hidden
"set foldmethod=syntax
set colorcolumn=80
"highlight ColorColumn ctermbg=0 guibg=lightgrey

if executable('rg')
    let g:rg_derive_root='true'
endif


fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

"Display all matching files when we tab complete
set wildmenu
"}}}
