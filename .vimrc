source /etc/profile.d/vim/neadwerx_vimrc

nmap ; :

set number
set relativenumber

set showcmd

set showmatch

set scrolloff=4

set incsearch
set hlsearch

"Automatic inserting of delimiters
Plugin 'Raimondi/delimitMate'

"Best colorscheme NA
Plugin 'ywjno/vim-tomorrow-theme'

"vim-airline/vim-airline: Vim Airline"
Plugin 'vim-airline/vim-airline'

"Make commenting easier
Plugin 'tpope/vim-commentary'

syntax enable
let g:solarized_termcolors=256
colorscheme Tomorrow-Night

"Deletes all trailing white space on save
autocmd BufWritePre * :%s/\s\+$//e


"vim-airline setting"
set laststatus=2

"set encoding"
set encoding=utf-8

" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256

" YouCompleteMe
if !exists('g:ycm_semantic_triggers')
      let g:ycm_semantic_triggers = {}
  endif
  let g:ycm_semantic_triggers.tex = [
        \ 're!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*'
        \ ]

 " Syntastic
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list            = 1
  let g:syntastic_check_on_open            = 1
  let g:syntastic_auto_jump                = 3
  let g:syntastic_check_on_wq              = 0
  let g:syntastic_auto_jump                = 1
  let g:syntastic_error_symbol             = "✗"
  let g:syntastic_style_error_symbol       = "✗"
  let g:syntastic_warning_symbol           = "⚠"
  let g:syntastic_style_warning_symbol     = "⚠"
  let g:syntastic_typescript_checkers      = ["tslint"]
  let g:syntastic_typescript_tslint_args   = "--config ~/.tslint.json"
  let g:syntastic_mode_map = {
      \ "mode": "passive",
      \ "active_filetypes": ["typescript"] }
  let g:syntastic_eruby_ruby_quiet_messages =
      \ {'regex': 'possibly useless use of a variable in void context'}

" EasyAlign
vmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters =
    \ {
    \ 's': {
    \       'pattern': '\C[a-z]',
    \       'left_margin': 1,
    \       'right_margin': 0,
    \       'align': 'r'
    \      },
    \ '[': {
    \       'pattern':       ']',
    \       'left_margin':   0,
    \       'right_margin':  0,
    \       'stick_to_left': 0
    \      },
    \ ']': {
    \       'pattern':       ']',
    \       'left_margin':   1,
    \       'right_margin':  0,
    \       'stick_to_left': 0
    \      },
    \ '(': {
    \       'pattern':       ')',
    \       'left_margin':   0,
    \       'right_margin':  0,
    \       'stick_to_left': 0
    \      },
    \ ')': {
    \       'pattern':       ')',
    \       'left_margin':   1,
    \       'right_margin':  0,
    \       'stick_to_left': 0
    \      },
    \ '{': {
    \       'pattern':       '}',
    \       'left_margin':   0,
    \       'right_margin':  0,
    \       'stick_to_left': 0
    \      },
    \ '}': {
    \       'pattern':       '}',
    \       'left_margin':   1,
    \       'right_margin':  0,
    \       'stick_to_left': 0
    \      },
    \ '?': {
    \       'pattern':       '?',
    \       'left_margin':   1,
    \       'right_margin':  0,
    \       'stick_to_left': 0
    \      },
    \ '<': {
    \       'pattern':       '<',
    \       'left_margin':   1,
    \       'right_margin':  0,
    \       'stick_to_left': 0
    \      },
    \ '>': {
    \       'pattern':       '>',
    \       'left_margin':   1,
    \       'right_margin':  0,
    \       'stick_to_left': 0
    \      }
    \ }
