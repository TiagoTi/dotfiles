let vimsettings = '~/.vim/settings'
let uname = system("uname -s")

for fpath in split(globpath(vimsettings, '*.vim'), '\n')

  if (fpath == expand(vimsettings) . "/yadr-keymap-mac.vim") && uname[:4] ==? "linux"
    continue " skip mac mappings for linux
  endif

  if (fpath == expand(vimsettings) . "/yadr-keymap-linux.vim") && uname[:4] !=? "linux"
    continue " skip linux mappings for mac
  endif

  exe 'source' fpath
endfor


set relativenumber
set cursorline

"Enable: Auto Ident
set ai

"enable ç to enter in command mode
:map ç :

"Show (partial) command in the last line of the screen.
set showcmd

"Auto load NERDTRee
"autocmd vimenter * NERDTree

"Show hidden files in NERDTRee
let NERDTreeShowHidden=1

"Per-directory .vimrc files
set exrc
set secure
"Ok
