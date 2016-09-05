set nocompatible
" ---------------------------------------------------------------------------
"  environments
" ---------------------------------------------------------------------------
let g:dotvim = {}
let g:dotvim.root = $HOME . "/.config/nvim"
let g:dotvim.tempdir = g:dotvim.root . "tmp/"

let g:dotvim.plugins = {}
let g:dotvim.plugins.initialized = 1
let g:dotvim.plugins.root = g:dotvim.root . '/plugins'

" ---------------------------------------------------------------------------
"  foundations
" ---------------------------------------------------------------------------
runtime! etc/base.vim
runtime! etc/keymap.vim
runtime! etc/funtion.vim
runtime! etc/platform.vim
" ---------------------------------------------------------------------------
"  Package Manager
" ---------------------------------------------------------------------------
if !filereadable(expand('$HOME/.config/nvim/autoload/plug.vim'))
  echo "[*] Installing Vim-Plug..."
  silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:dotvim.plugins.initialized = 0
endif
call plug#begin(expand('$HOME/.config/nvim/plugins'))

" ---------------------------------------------------------------------------
" Plugins: Settings
" ---------------------------------------------------------------------------
runtime! ext/theme.vim
runtime! ext/java.vim

runtime! ext/editor.vim
runtime! ext/neomake.vim
runtime! ext/deoplete.vim

runtime! ext/fzf.vim
runtime! ext/vimfiler.vim


" ---------------------------------------------------------------------------
call plug#end()
if g:dotvim.plugins.initialized == 0
  :PlugInstall
endif
" ---------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" called only after plugins initialized.
" ---------------------------------------------------------------------------
colorscheme base16-solarized-dark
