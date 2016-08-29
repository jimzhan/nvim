" ---------------------------------------------------------------------------
"  Plugin Manager: Initialize dein.vim to manage plugins.
" ---------------------------------------------------------------------------
function! InitializePlugins()
  if !filereadable(expand('$HOME/.config/nvim/autoload/plug.vim'))
    echo "[*] Installing vim-plug...\n"
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let g:config.plugins.initialized = 0
  endif

  call plug#begin(expand('~/.config/nvim/plugins'))
  source ~/.config/nvim/plugins.vim
  call plug#end()

  if g:config.plugins.initialized == 0
    :PlugInstall
  endif
endfunction

call InitializePlugins()
