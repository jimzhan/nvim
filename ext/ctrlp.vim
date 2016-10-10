Plug 'kien/ctrlp.vim'

let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_reuse_window = 'startify'
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'git ls-files --cached --others --exclude-standard %s'],
  \ },
  \ 'fallback': 'ag %s --ignore-case --nocolor --nogroup --nobreak --ignore "\.git$\|\.hg$\|\.svn$" -g "" %s'
\ }
