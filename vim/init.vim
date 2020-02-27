" For Plugins to work, copy this file into
" [For vim] --> ~/.vimrc 
" [For neovim] --> ~/.config/nvim/init.vim 
"
" Generating config with GUI
" https://vimconfig.com

"  --- Required fonts ---
" powerline-fonts
" ttf-nerd-fonts-symbols

set nocompatible " Don't bother to be compatible with vi or something else
filetype off

" <C> = Ctrl
" <A> = Alt
" <S> = Shift
" <Leader> = \

source "./plugins/plugins.vim"

source "./defaults.vim"

source "./coc/coc.vim"

source "./airline/airline.vim"

source "./quickscope/quickscope.vim"

source "./easymotion/easymotion.vim"

source "./gruvbox/gruvbox.vim"

source "./indentline/indentline.vim"

source "./nerdtree/nerdtree.vim"

source "./nerdcommenter/nerdcommenter.vim"

source "./ctrlp/ctrlp.vim"

source "./move/move.vim"

" Tmuxline config ===============================================================================================================
" let g:tmuxline_preset = {
"     \ 'a': '#S',
"     \ 'win': '#I:#W#F',
"     \ 'cwin': '#I:#W#F',
"     \ 'x': '%a',
"     \ 'y': ['%b %d', '%R'],
"     \ 'z': '#H',
"     \ 'options': {
"     \'status-justify': 'left'}
"     \}

" Fix: tmuxline not changing colors when mode changes https://github.com/edkolev/tmuxline.vim/issues/90
" if exists('$TMUX')
"     au InsertEnter * Tmuxline airline_insert
"     au InsertLeave * Tmuxline airline
" endif

" Codi ScratchPad ===============================================================================================================

" For aligning output to the left
" Note: if you align right it will render ugly indent lines
" let g:codi#rightalign = 0
" Width for the output panel
" let g:codi#width = 50

