call plug#begin()

" utility plugins
Plug 'akinsho/nvim-toggleterm.lua'
Plug 'bfredl/nvim-miniyank'
Plug 'editorconfig/editorconfig-vim'
Plug 'glepnir/galaxyline.nvim', { 'branch': 'main' }
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'lewis6991/gitsigns.nvim'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'
Plug 'mfussenegger/nvim-dap'
Plug 'neovim/nvim-lspconfig'
Plug 'neovimhaskell/haskell-vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
Plug 'peitalin/vim-jsx-typescript'
Plug 'ray-x/lsp_signature.nvim'
Plug 'rust-lang/rust.vim'
Plug 'scalameta/nvim-metals'
Plug 'steelsojka/pears.nvim'
Plug 'styled-components/vim-styled-components', { 'branch': 'develop' }
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vifm/vifm.vim'
Plug 'vimwiki/vimwiki'

" colorschemes
Plug 'arzg/vim-colors-xcode'
Plug 'folke/tokyonight.nvim'
Plug 'haishanh/night-owl.vim'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'navarasu/onedark.nvim'
Plug 'pacokwon/onedarkpaco.vim'
Plug 'pacokwon/panic.vim'
Plug 'Shatur95/neovim-ayu'
Plug 'savq/melange'
Plug 'srcery-colors/srcery-vim'

call plug#end()

filetype plugin indent on
set termguicolors
set background=dark
syntax on

lua require('init')

" ========== Editor Configurations ==========
set number
set relativenumber
set ruler
set expandtab " Expands tabs to space
set smarttab
set shiftwidth=4
set tabstop=4
set smartindent
set autoindent
set backspace=indent,eol,start
set wildmenu
set list
set listchars=eol:¬,tab:⍿·,space:·,trail:␠,nbsp:⎵
set foldmethod=manual
set lazyredraw " improves macro speed
set hidden

" search related stuff
set nohlsearch
set incsearch
set inccommand=split
set ignorecase
set smartcase

" enable mouse
set mouse=a
" block cursor; also reduces latency
set guicursor=

set formatoptions-=a    " No autoformatting
set formatoptions+=c    " Respect textwidth
set formatoptions+=r    " Do continue on enter

set nowrap
set splitbelow
set splitright
set scrolloff=8
set updatetime=500      " == CursorHold delay (default 4000)

if has("clipboard")
    set clipboard=unnamedplus
endif

" set leader to comma
let mapleader=' '
let g:mapleader=' '

" semicolon remap
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" for visual block yanking
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

" Move line mappings
nnoremap <S-Down> :m .+1<CR>==
nnoremap <S-Up> :m .-2<CR>==
inoremap <S-Down> <Esc>:m .+1<CR>==gi
inoremap <S-Up> <Esc>:m .-2<CR>==gi
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv

" delete and not cut
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
nnoremap c "_c
nnoremap C "_C
nnoremap s "_s
vnoremap d "_d
vnoremap c "_c
vnoremap s "_s
vnoremap p "_dP
inoremap π <C-R>+

" alternative for cut
nnoremap <leader>d "+d
nnoremap <leader>D "+D
vnoremap <leader>d "+d
nnoremap <leader>c "+c
nnoremap <leader>C "+C
vnoremap <leader>c "+c

" keybinding for efficient vertical navigation
nnoremap <C-J> 10j
nnoremap <C-K> 10k
vnoremap <C-J> 10j
vnoremap <C-K> 10k

" keybinding for tab navigation
nnoremap <C-N> gt
nnoremap <C-P> gT

" cursor position after yank
vnoremap y y`]

" open vimrc
nnoremap <leader>ve :vsplit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>

" shorthand commands for languages
autocmd FileType python nnoremap <silent> <buffer> <F9> :vsplit \| terminal python %<CR>:startinsert<CR>
autocmd FileType python nnoremap <silent> <buffer> <F10> :vsplit \| terminal python -i %<CR>:startinsert<CR>
autocmd FileType java nnoremap <silent> <buffer> <F9> :vsplit \| terminal javac % && java %<<CR>:startinsert<CR>
autocmd FileType c nnoremap <silent> <buffer> <F9> :vsplit \| terminal gcc % -o %< && ./%< <CR>:startinsert<CR>
autocmd FileType cpp nnoremap <silent> <buffer> <F9> :vsplit \| terminal g++ -std=c++17 -Wall -Wextra % -o %< && ./%< <CR>:startinsert<CR>
autocmd FileType go nnoremap <silent> <buffer> <F9> :w<CR>:!clear; go run % <CR>
autocmd FileType scala nnoremap <silent> <buffer> <F9> :w<CR>:!clear; scala % <CR>
autocmd FileType javascript nnoremap <silent> <buffer> <F9> :vsplit \| terminal node %<CR>:startinsert<CR>
autocmd FileType sh nnoremap <silent> <buffer> <F9> :split \| terminal ./%<CR>:startinsert<CR>
autocmd FileType rust nnoremap <silent> <buffer> <F9> :split \| terminal rustc % && ./%<<CR>:startinsert<CR>
autocmd BufRead,BufNewFile *.fsx nnoremap <silent> <buffer> <F9> :vsplit \| terminal dotnet fsi %<CR>:startinsert<CR>

" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us | set complete+=kspell
autocmd BufWinEnter,BufNewFile * setlocal formatoptions-=o
autocmd BufNewFile,BufRead *.fs,*.fsx,*.fsi set filetype=fsharp

" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

autocmd FileType csv set noexpandtab
autocmd FileType gitcommit setlocal spell spelllang=en_us | set complete+=kspell
autocmd FileType jsonc syntax match Comment +\/\/.\+$+

autocmd TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false}

" ========== Plugin Configurations ==========
" ====== netrw ======
let g:netrw_banner=0        " disable banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide='.*\.swp$'
let g:netrw_localrmdir='rm -r'

" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
" https://github.com/tpope/vim-vinegar/issues/13#issuecomment-47133890
autocmd FileType netrw setl bufhidden=delete

" ====== colorizer ======
nnoremap <silent> <leader>tc :ColorToggle<CR>

" ====== commentary ======
autocmd FileType jsonc setlocal commentstring=//%s
autocmd FileType fsharp setlocal commentstring=//%s
autocmd FileType asm setlocal commentstring=#%s

" ====== fugitive ======
" launch Git status
nnoremap <leader>gg :vertical Git<CR>
nnoremap <leader>go :tab Git<CR>
nnoremap <leader>gp :Git push<CR>

" open terminal
nnoremap <silent> <leader>tv :vsp term://zsh<CR>
nnoremap <silent> <leader>tn :tabe term://zsh<CR>

" ====== emmet-vim ======
let g:user_emmet_mode='i'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" ====== vim-vue-plugin ======
let g:vim_vue_plugin_load_full_syntax = 1

" ====== vimwiki ======
let g:vimwiki_list = [
    \{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}
\]
let g:vimwiki_conceallevel = 0
nnoremap <leader>wf :Files ~/vimwiki<CR>
nmap <C-h> <Plug>VimwikiDiaryPrevDay
nmap <C-l> <Plug>VimwikiDiaryNextDay

" ====== vifm.vim ======
let g:loaded_netrw          = 1
let g:loaded_netrwPlguin    = 1
let g:vifm_replace_netrw    = 1
nnoremap <silent> <leader>vi :Vifm<CR>

" ====== diagnostic nvim ======
nnoremap <silent>K   :Lspsaga hover_doc<CR>
nnoremap <silent>gl  :Lspsaga show_line_diagnostics<CR>
nnoremap <silent>gn  :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent>gp  :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent>gd  :lua vim.lsp.buf.definition()<CR>
nnoremap <silent>gi  :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent>ge  :lua vim.lsp.buf.references()<CR>
nnoremap <silent>ga  :Lspsaga code_action<CR>
nnoremap <silent>go  :lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent>gr  :Lspsaga rename<CR>
nnoremap <silent>gff :lua vim.lsp.buf.formatting()<CR>
nnoremap <silent>gfe :lua require'telescope.builtin'.lsp_references()<CR>

nnoremap <silent><C-f> :lua require'lspsaga.action'.smart_scroll_with_saga(1)<CR>
nnoremap <silent><C-b> :lua require'lspsaga.action'.smart_scroll_with_saga(-1)<CR>

" Hint Related Highlight Groups. Underline must be linked manually. see :h hl-LspDiagnosticsUnderlineHint
hi LspDiagnosticsDefaultHint guifg=#FF8E24 gui=undercurl
hi! link LspDiagnosticsUnderlineHint LspDiagnosticsDefaultHint

" Warning Related Highlight Groups
hi LspDiagnosticsDefaultWarning guifg=#FFAE2B gui=undercurl
hi! link LspDiagnosticsUnderlineWarning LspDiagnosticsDefaultWarning

" Error Related Highlight Groups
hi LspDiagnosticsDefaultError guifg=#F74848 gui=undercurl
hi! link LspDiagnosticsUnderlineError LspDiagnosticsDefaultError

set completeopt=menu,menuone,noselect

let g:vim_vue_plugin_use_typescript = 1
let g:vim_vue_plugin_use_scss = 1

" ====== nvim-compe ======
inoremap <silent><expr> <C-f> compe#complete()
inoremap <silent><expr> <C-e> compe#close('<C-e>')

" ====== nvim-telescope ======
nnoremap <expr> <silent> <leader>ff (len(system('git rev-parse')) ? ':lua require"telescope.builtin".find_files()' : ':lua require"telescope.builtin".git_files()')."\<CR>"
nnoremap <silent> <leader>fs :lua require'telescope.builtin'.grep_string{ shorten_path = true, word_match = "-w", only_sort_text = true, search = '' }<CR>
nnoremap <silent> <leader>fe :Telescope file_browser<CR>
nnoremap <leader>fgb :lua require'telescope.builtin'.git_branches()<CR>
nnoremap <leader>fgs :lua require'telescope.builtin'.git_status()<CR>

" ====== fzf & fzf.vim ======
" Terminal buffer options for fzf
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu nornu

let g:fzf_commits_log_options = '--all --decorate --oneline --graph'

if has('nvim') && exists('&winblend') && &termguicolors
    set winblend=20

    hi NormalFloat guibg=None
    if exists('g:fzf_colors.bg')
        call remove(g:fzf_colors, 'bg')
    endif

    if stridx($FZF_DEFAULT_OPTS, '--border') == -1
        let $FZF_DEFAULT_OPTS .= ' --border'
    endif

    function! FloatingFZF()
        let width = float2nr(&columns * 0.9)
        let height = float2nr(&lines * 0.9)
        let opts = { 'relative': 'editor',
                    \ 'row': (&lines - height) / 2,
                    \ 'col': (&columns - width) / 2,
                    \ 'width': width,
                    \ 'height': height }

        call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    endfunction

    let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

set rtp+=/usr/local/opt/fzf

" Rg command settings
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '~'),
  \   <bang>0)

" search
nnoremap <leader>ft :Rg<CR>
nnoremap <leader>fr :Rg!<CR>

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" ====== vim-startify ======
function! StartifyEntryFormat() abort
  return 'v:lua.webDevIcons(absolute_path) . " " . entry_path'
endfunction

" ====== nvim-tree ======
nnoremap <leader>nt :NvimTreeToggle<CR>

" ====== nvim-dap ======
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <S-F5> :lua require'dap'.stop()<CR>
nnoremap <silent> <F6> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F7> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F8> :lua require'dap'.step_out()<CR>

" Toggle
nnoremap <silent> <leader>bt :lua require'dap'.toggle_breakpoint()<CR>
" Conditional
nnoremap <silent> <leader>bc :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>
" REPL
nnoremap <silent> <leader>br :lua require'dap'.repl.toggle()()<CR>
" Last
nnoremap <silent> <leader>bl :lua require'dap'.run_last()<CR>

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
