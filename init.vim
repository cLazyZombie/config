call plug#begin('~/.config/nvim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'projekt0n/github-nvim-theme'
Plug 'github/copilot.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

colorscheme github_dark

nnoremap <SPACE> <Nop>
let mapleader=" "

set encoding=utf-8
set mouse=nv
set nu rnu
au TextYankPost * silent! lua vim.highlight.on_yank{timeout=500}
set nobackup
set nowritebackup
set updatetime=300

"terminal 에서는 insert mode가 기본으로 설정
autocmd TermOpen,BufWinEnter,WinEnter term://* startinsert
"autocmd TermOpen term://* startinsert
" open terminal bottom 
nnoremap <silent><nowait> <leader>c :botright split term://zsh<CR>

let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

"COC
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <TAB>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent><C-t>  :<C-u>CocList -I symbols<cr>
nmap <silent><S-F8> <Plug>(coc-diagnostic-prev)
nmap <silent><F8> <Plug>(coc-diagnostic-next)
nmap <silent><F2> <Plug>(coc-rename)
nmap <silent><c-space> <Plug>(coc-codeaction)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>qf  <Plug>(coc-fix-current)
nnoremap <silent><leader>t :Ctest --workspace<CR>
nnoremap <silent> gh :<C-u>call CocAction('doHover')<CR>
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"NERD Tree
"nnoremap <silent><leader>n :NERDTreeToggle<CR>
nnoremap <silent><leader>n :NERDTreeFind<CR>
"nnoremap <silent><nowait> <leader>n "g:NERDTree.IsOpen()" ? "\:NERDTreeClose<CR>" : "bufexists(expand('%'))" ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
let NERDTreeQuitOnOpen=1

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

"vimairline smarter tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nnoremap <silent><nowait> <leader>] :bn<CR>
nnoremap <silent><nowait> <leader>[ :bp<CR>
"nnoremap <silent><nowait> <leader>q :bd<CR>
nnoremap <silent><nowait> <leader><Tab> :tabNext<CR>

"CtrlP
set wildignore+=*/target/*

"FZF
nnoremap <silent><nowait> <leader>f :<C-u>FZF<CR>
