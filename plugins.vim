" ------------------------------------------------------------
" *  @author     Jim Zhan <jim.zhan@me.com>
" *
" Copyright © 2016 Jim Zhan.
" ------------------------------------------------------------
" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at
"
"     http://www.apache.org/licenses/LICENSE-2.0
"
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.
" ---------------------------------------------------------------------------
" Plugins Settings: Custom Plugins Settings.
" ---------------------------------------------------------------------------
Plug 'moll/vim-bbye'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'Shougo/vimshell.vim' | Plug 'Shougo/vimproc.vim', { 'do': 'make' } "{
  let g:vimshell_enable_smart_case   = 1
  let g:vimshell_prompt              = '➤ '
  let g:vimshell_user_prompt         = 'fnamemodify(getcwd(), ":~")'
  let g:vimshell_temporary_directory = "/tmp/vimshell"
  let g:vimshell_right_prompt        = 'system("date")'
"}


" ---------------------------------------------------------------------------
"  Plugins: Color Themes
" ---------------------------------------------------------------------------
Plug 'chriskempson/base16-vim' "{
  let base16colorspace=256
"}
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline-themes' | Plug 'vim-airline/vim-airline' "{
  let g:airline_powerline_fonts=1
  let g:airline_theme='murmur'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamemod = ':t'
"}


" ---------------------------------------------------------------------------
"  Plugins: File Manager
" ---------------------------------------------------------------------------
Plug 'junegunn/fzf.vim' | Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "{
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting
  nnoremap <silent> <leader>f :Files<CR>
  nnoremap <silent> <leader>a :Buffers<CR>
  nnoremap <silent> <leader>A :Windows<CR>
  nnoremap <silent> <leader>; :BLines<CR>
  nnoremap <silent> <leader>o :BTags<CR>
  nnoremap <silent> <leader>O :Tags<CR>
  nnoremap <silent> <leader>? :History<CR>
  nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
  nnoremap <silent> <leader>. :AgIn 

  nnoremap <silent> K :call SearchWordWithAg()<CR>
  vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
  nnoremap <silent> <leader>gl :Commits<CR>
  nnoremap <silent> <leader>ga :BCommits<CR>
  nnoremap <silent> <leader>ft :Filetypes<CR>

  imap <C-x><C-f> <plug>(fzf-complete-file-ag)
  imap <C-x><C-l> <plug>(fzf-complete-line)

  function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
  endfunction

  function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
  endfunction

  function! SearchWithAgInDirectory(...)
    call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
  endfunction
  command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
"}

Plug 'scrooloose/nerdtree' "{
  map <leader>b :Bookmark<CR>
  map <C-o> :NERDTreeToggle<CR>

  let NERDTreeChDirMode = 2
  let NERDTreeShowBookmarks=1
  let NERDTreeIgnore = ['\.py[cd]$',
\   '\~$', '\.scssc$', '\.swo$', '\.swp$', '.sass-cache',
\   '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$', '.DS_Store',
\   'node_modules']
  let NERDTreeMinimalUI = 0
  let NERDTreeQuitOnOpen = 1
  let NERDTreeMouseMode = 2
  let NERDTreeShowHidden = 1
  let NERDTreeKeepTreeInNewTab = 1

  let g:NERDTreeDirArrowExpandable = '▸'
  let g:NERDTreeDirArrowCollapsible = '▾'

  let g:nerdtree_tabs_open_on_gui_startup=0
  let g:nerdtree_tabs_open_on_console_startup = 0

  " direct shortcuts for CRUD without marking.
  autocmd FileType NERDTree nmap <buffer> <silent>dd   m-d
  autocmd FileType NERDTree nmap <buffer> <silent><Leader>d   m-d
  autocmd FileType NERDTree nmap <buffer> <silent><Leader>n   m-a
  autocmd FileType NERDTree nmap <buffer> <silent><Leader>c   m-c
  autocmd FileType NERDTree nmap <buffer> <silent><Leader>m   m-m
"}
