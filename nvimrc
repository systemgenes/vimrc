" Specify a directory for plugins                                                                                           
" - For Neovim: ~/.local/share/nvim/plugged                                                                                 
" - Avoid using standard Vim directory names like 'plugin'                                                                  
                                                                                                                            
" Initialize plugin system                                                                                                  
if has('vim_starting')                                                                                                      
  set nocompatible               " Be iMproved                                                                              
endif                                                                                                                       
                                                                                                                            
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')                                                               
                                                                                                                            
let g:vim_bootstrap_langs = "c,c++,elixir,go,python"                                                                        
let g:vim_bootstrap_editor = "nvim"                             " nvim or vim                                               
                                                                                                                            
if !filereadable(vimplug_exists)                                                                                            
  echo "Installing Vim-Plug..."                                                                                             
  echo ""                                                                                                                   
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim    
  let g:not_finish_vimplug = "yes"                                                                                          
                                                                                                                            
  autocmd VimEnter * PlugInstall                                                                                            
endif                                                                                                                       
                                                                                                                            
" Setup vim-plug                                                                                                            
call plug#begin('~/.config/nvim/plugged/')                                                                                  
Plug 'WolfgangMehner/c-support'                                                                                             
Plug 'vim-airline/vim-airline'                                                                                                                                                                                 
Plug 'elixir-editors/vim-elixir'                                                                                            
Plug 'scrooloose/nerdtree'                                                                                                  
Plug 'scrooloose/syntastic'                                                                                                 
Plug 'vim-scripts/grep.vim'                                                                                                 
Plug 'beyondgrep/ack2'                                                                                                      
Plug 'neoclide/coc.nvim', {'branch': 'release'}                                                                             
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }                                                           
Plug 'junegunn/fzf.vim'                                                                                                     
Plug 'dyng/ctrlsf.vim'                                                                                                      
Plug 'kien/ctrlp.vim'                                                                                                       
Plug 'ggreer/the_silver_searcher'                                                                                           
Plug 'sheerun/vim-polyglot'                                                                                                 
Plug 'tpope/vim-obsession'                                                                                                  
Plug 'tpope/vim-fugitive'                                                                                                   
call plug#end()                                                                                                             
                                                                                                                            
set enc=utf-8                                                                                                               
set fenc=utf-8                                                                                                              
set termencoding=utf-8                                                                                                      
" set line number                                                                                                           
set number                                                                                                                  
" disable vi compatibility (emulation of old bugs)                                                                          
set nocompatible                                                                                                            
" configure tabwidth and insert spaces instead of tabs                                                                      
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab                                                                 
" Using 120 line marking, as 80 is somewaht antiquated with nowadays displays.                                                                  
set colorcolumn=120                                                                                                         
" turn syntax highlighting on                                                                                               
set t_Co=256                                                                                                                
syntax on                                                                                                                   
                                                                                                                            
" Enhanced keyboard mappings
"                                                                                                                       
" in normal mode F2 will save the file                                                                                  
nmap <F2> :w<CR>                                                                                                        
" in insert mode F2 will exit insert, save, enters insert again                                                         
imap <F2> <ESC>:w<CR>i                                                                                                  
" recreate tags file with F5                                                                                            
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>                                                          
" goto definition with F12                                                                                              
map <F12> <C-]>                                                                                                         
" NERDTreeToggle with Ctrl+n                                                                                            
map <C-n> :NERDTreeToggle<CR>                                                                                           
                                                                                                                        
" CtrlSF Maps - search keywords                                                                                        
nnoremap <C-F>f :CtrlSF                                                                                                 
nnoremap <C-F><CR> :CtrlSF<CR>                                                                                          
nnoremap <C-F>o :CtrlSFOpen<CR>                                                                                         
nnoremap <C-F>t :CtrlSFToggle<CR>                                                                                       
let g:ctrlsf_position = 'right'                                                                                         
let g:ctrlsf_winsize = '30%'                                                                                            
let g:ctrlsf_regex_pattern = 1                                                                                          
let g:ctrlsf_auto_focus = {                                                                                             
    \ "at": "start"                                                                                                     
    \ }                                                                                                                 
let g:ctrlsf_search_mode = 'async'                                                                                      
let g:ctrlsf_context = '-C 0'                                                                                           
                                                                                                                        
" CtrlP Maps - Search file names                                                                                         
nnoremap <C-p> :CtrlP                                                                                                   
                                                                                                                        
" Vim Tabs mappings                                                                                                     
nnoremap m<Left> :tabprevious<CR>                                                                                       
nnoremap m<Right> :tabnext<CR>                                                                                          

" vim fugitive mappings for git
nnoremap <S-g>d :Gdiffsplit<CR>                                                                         
                                                                                                                        
let g:airline#extensions#tabline#left_sep = ' '                                                                     
let g:airline#extensions#tabline#left_alt_sep = '>'
