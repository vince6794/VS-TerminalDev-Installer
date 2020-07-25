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


call plug#begin("~/.vim/plugged")

 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'jiangmiao/auto-pairs'

 Plug 'preservim/nerdtree'
 Plug 'zefei/vim-wintabs'
 Plug 'zefei/vim-wintabs-powerline'
 Plug 'mbbill/undotree'
 Plug 'mhinz/vim-startify'

 Plug 'gruvbox-community/gruvbox'
 Plug 'sainnhe/gruvbox-material'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'frazrepo/vim-rainbow'
 Plug 'norcalli/nvim-colorizer.lua'
 Plug 'ryanoasis/vim-devicons'

call plug#end()


let mapleader = " "

let g:coc_global_extensions = [
      \ 'coc-tslint-plugin',
      \ 'coc-tsserver',
      \ 'coc-emmet',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-snippets',
      \ 'coc-python',
      \ 'coc-java']

set termguicolors
let g:rainbow_active = 1
lua require'colorizer'.setup()

set background=dark
let g:airline_theme = 'gruvbox_material'
let g:airline_powerline_fonts = 1
map <C-W>o <Plug>(wintabs_only_window)
let g:gruvbox_material_background = 'soft'
colorscheme gruvbox-material

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
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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
nmap <leader>r <Plug>(coc-rename)

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

" Remap keys for applying codeAction to the current buffer.
nmap <leader>a :<C-u>CocAction<cr>

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

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-arg>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>E  :<C-u>CocList diagnostics<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>S  :<C-u>CocList -I symbols<cr>

" Error switching
nnoremap <leader>Ep <Plug>(coc-diagnostic-prev)
nnoremap <leader>En <Plug>(coc-diagnostic-next)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
set wildignore+=**/node_modules/**


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

" WinTabs
map <C-n> <Plug>(wintabs_previous)
map <C-p> <Plug>(wintabs_next)
map <C-N> gt
map <C-P> gT
map <C-T>x <Plug>(wintabs_close)
map <C-T>u <Plug>(wintabs_undo)

nnoremap <leader>u :UndotreeToggle<CR>

"List buffers
nnoremap <leader>b :ls<cr>:b

"Explorer
"autocmd vimenter * NERDTree
map <C-e> :NERDTreeToggle<CR>

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
set mouse=a

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
