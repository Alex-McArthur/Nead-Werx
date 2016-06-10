" This file installs all the Neadwerx vimrc setings, augroups, etc...

" What you see below is known as a 'fold', to open and close it press <SPACE>
" You can learn more about folding from :help folding

" 'Set'ings ---------------------------- {{{
set ts=4                           " tab spacing is 4 spaces
set sw=4                           " shift width is 4 spaces
set expandtab                      " expand all tabs to spaces
set ai                             " autoindent a file based on filetype
set si                             " smartindent while typing
set background=dark                " our backdrop is dark
set ruler                          " show row,col count on bottom bar
set backspace=eol,start,indent     " backspace wraps around indents, start of lines, and end of lines
set ignorecase                     " ignore case when searching
set smartcase                      " ...unless we have at least 1 capital letter
set incsearch                      " search incrementally
set formatoptions=tcqronj          " see :help fo-table for more information
set pastetoggle=<F12>              " sets <F12> to toggle paste mode
set hlsearch                       " highlight search results
set wrap                           " wrap lines
set scrolloff=10                   " leave at least 10 lines at the bottom/top of screen when scrolling
set sidescrolloff=15               " leave at least 15 lines at the right/left of screen when scrolling
set sidescroll=1                   " scroll sidways 1 character at a time
set lazyredraw                     " redraw the screen lazily
" Wildmenu completion {{{

set wildmenu " turn on globing for opening files
set wildmode=list:longest " see :help wildmode for more information

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

" }}}

" }}}
" Misc --------------------------------- {{{

" turn on syntax coloring and indentation based on the filetype
syntax on
filetype on
filetype indent on

" keep search pattern in center of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" move in split windows with ctrl+hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" move up/down on wrapped lines !!BEWARE OF MACROS!!
nnoremap j gj
nnoremap k gk

" more intuitive increment/decrement with +/-
nnoremap + <C-a>
nnoremap - <C-x>

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

" Leader
let mapleader = ","
let maplocalleader = "\\"

" Allow saving of files as sudo when you forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" }}}
" AuGroups ----------------------------- {{{

" Paste mode {{{

" disable paste mode when leaving insert mode
au InsertLeave * set nopaste

" }}}

" Return to line {{{

" return to same line when reopening a file
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}

" Folding Fix {{{

" Don't update folds in insert mode 
aug NoInsertFolding 
    au! 
    au InsertEnter * let b:oldfdm = &l:fdm | setl fdm=manual 
    au InsertLeave * let &l:fdm = b:oldfdm 
aug END 

" }}}

" }}}
" Functions ---------------------------- {{{

" Persistant undo {{{

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory(expand('~/.vim/undo/')) == 0
    exec 'silent !mkdir -p ~/.vim/undo/ > /dev/null 2>&1'
  endif
  set undodir=~/.vim/undo/
  set undofile
endif

" }}}

" Neadwerx Example {{{

let g:neadwerx_example_file_regex_hash =
\ {
\     'perl\/generate_.*\.pl' : {
\         '_default' : [ '/perl/generate_project_history_csv.pl', 1 ],
\         'generate' : [ '/perl/generate_project_history_csv.pl', 1 ],
\         'reports?' : [ '/perl/generate_project_history_csv.pl', 1 ],
\     },
\     '.*\.js': {
\         '_default' : [ '/project/js/stores_tab.js', 1 ],
\     },
\     '\(reports\)\@<!\/.*\.php': {
\         '_default'    : [ '/dashboard/project_central.php', 1 ],
\         'handlebars?' : [ '/dashboard/templates/project_central_columns_partial.php', 1 ],
\         'partial'     : [ '/dashboard/templates/project_central_columns_partial.php', 1 ],
\         'reports?'    : [ '/reports/execution_status_report.php', 90 ],
\     },
\     'reports\/.*\.php' : {
\         '_default' : [ '/reports/execution_status_report.php', 90 ],
\     },
\     '.*\/templates\/.*\.php' : {
\         '_default' : [ '/dashboard/templates/project_central_columns_partial.php', 1 ],
\     },
\     'api\/.*' : {
\         '_default'                                   : [ '/api/controllers/orders.php', 1 ],
\         'controllers?'                               : [ '/api/controllers/orders.php', 1 ],
\         'doc\(block\)?'                              : [ '/api/controllers/orders.php', 10 ],
\         'get'                                        : [ '/api/controllers/orders.php', 57 ],
\         '\(put\|update\)'                            : [ '/api/controllers/orders.php', 415 ],
\         'delete'                                     : [ '/api/controllers/orders.php', 564 ],
\         'search'                                     : [ '/api/controllers/orders.php', 178 ],
\         '\(search_\)?filters?'                       : [ '/api/controllers/orders.php', 244 ],
\         '\(post\|new\|create\)'                      : [ '/api/controllers/orders.php', 322 ],
\         'views?'                                     : [ '/api/views/orders.php', 1 ],
\         '\(https?\|status\(_codes?\|es\)?\|codes?\)' : [ '/api/api_lib.php', 1 ],
\     },
\     'config\/.*\.json' : {
\         '_default'         : [ '/config/role/role_update_allow.json', 1 ],
\         'allows?'          : [ '/config/role/role_update_allow.json', 1 ],
\         'tabs?\(_order\)?' : [ '/config/project/project_view_project_php_tab_order.json', 1 ],
\         'uses?'            : [ '/config/project/project_space_count_use.json', 1 ],
\         'regexp?'          : [ '/config/buget_code/budget_code_validation_regex.json', 1 ],
\         'pks?'             : [ '/config/location_group_type/location_group_type_buying_office_pk.json', 1 ],
\         'columns?'         : [ '/config/location/store_projects_tab_php_columns.json', 1 ],
\     },
\ }

let g:neadwerx_example_split_vertical = 1

function! Example( ... )
    let current_file = expand( '%:p' )
    let search_file  = substitute( current_file, '\/var\/www\/vhosts\/[^/]\+\/', '', 'g' )
    let webroot_dir  = substitute( current_file, '\(\/var\/www\/vhosts\/[^/]\+\)\/.*', '\1', 'g' )

    if g:neadwerx_example_split_vertical == 0
        let split_command = 'sview'
    else
        let split_command = 'vert sview'
    endif

    " loop over the keys in the example regex hash
    for file_regex in keys( g:neadwerx_example_file_regex_hash )
        " if the regex matches the current file
        if match( current_file, file_regex ) >= 0
            let help_tag_hash = g:neadwerx_example_file_regex_hash[file_regex]

            " then loop through the given help tags and help_tags in the hash
            " and pick the correct key if one matches
            " This gives precedence to given tag ordering
            for given_tag in a:000
                for help_tag in keys( help_tag_hash )
                    if match( given_tag, help_tag ) >= 0
                        let example_file = help_tag_hash[help_tag][0]
                        let line_number  = help_tag_hash[help_tag][1]

                        " open the file on the correct line number
                        " in a new read only buffer
                        exe expand( split_command ) expand( '+' . line_number ) expand( webroot_dir . example_file )

                        " done
                        return
                    endif
                endfor
            endfor

            " we did not find a matching tag, look for the _default
            if has_key( help_tag_hash, '_default' )
                let example_file = help_tag_hash['_default'][0]
                let line_number  = help_tag_hash['_default'][1]

                " open the file on the correct line number
                " in a new read only buffer
                exe expand( split_command ) expand( '+' . line_number ) expand( webroot_dir . example_file )

                " done
                return
            else
                " we didn't find any example files :(
                echom 'Did not find any example files for file: ' . current_file
                return
            endif
        endif
    endfor

    " we didn't find any matches :(
    echom 'Did not find any matches for file: ' . current_file
    return

endfunction

command! -nargs=* Example call Example( <f-args> )

" }}}

" Neadwerx Standards {{{

let g:neadwerx_standards_file_regex_hash =
\ {
\     '.*\.p[lm]': {
\         '_default' : [ '/engineering/general/coding_standard.md', '#perl#' ],
\     },
\     '.*\.php': {
\         '_default' : [ '/engineering/general/coding_standard.md', '#php#' ],
\     },
\     '.*\.js': {
\         '_default' : [ '/engineering/general/coding_standard.md', '#JavaScript' ],
\     },
\ }

let g:neadwerx_standards_split_vertical = 1

function! Standards( ... )
    let current_file = expand( '%:p' )
    let search_file  = substitute( current_file, '\/var\/www\/vhosts\/[^/]\+\/', '', 'g' )
    let wiki_dir     = '/etc/neadwerx/wiki'

    if g:neadwerx_standards_split_vertical == 0
        let split_command = 'sview'
    else
        let split_command = 'vert sview'
    endif

    " loop over the keys in the standards regex hash
    for file_regex in keys( g:neadwerx_standards_file_regex_hash )
        " if the regex matches the current file
        if match( current_file, file_regex ) >= 0
            let help_tag_hash = g:neadwerx_standards_file_regex_hash[file_regex]

            " then loop through the given help tags and help_tags in the hash
            " and pick the correct key if one matches
            " This gives precedence to given tag ordering
            for given_tag in a:000
                for help_tag in keys( help_tag_hash )
                    if match( given_tag, help_tag ) >= 0
                        let standards_file = help_tag_hash[help_tag][0]
                        let search_term    = help_tag_hash[help_tag][1]

                        " open the file in a new read only buffer
                        " on the first line
                        exe expand( split_command ) expand( '+1' ) expand( wiki_dir . standards_file )

                        " search for the search term and goto the first result
                        exe expand( "normal! gg/" . search_term . "\<CR>" )

                        " clear the highlighting
                        exe ':noh'

                        " done
                        return
                    endif
                endfor
            endfor

            " we did not find a matching tag, look for the _default
            if has_key( help_tag_hash, '_default' )
                let standards_file = help_tag_hash['_default'][0]
                let search_term    = help_tag_hash['_default'][1]

                " open the file in a new read only buffer
                " on the first line
                exe expand( split_command ) expand( '+1' ) expand( wiki_dir . standards_file )

                " search for the search term and goto the first result
                exe expand( "normal! gg/" . search_term . "\<CR>" )

                " clear the highlighting
                exe ':noh'

                " done
                return
            else
                " we didn't find any standards files :(
                echom 'Did not find any standards files for file: ' . current_file
                return
            endif
        endif
    endfor

    " we didn't find any matches :(
    echom 'Did not find any matches for file: ' . current_file
    return

endfunction

command! -nargs=* Standards call Standards( <f-args> )

" }}}

" }}}
" Filetype-specific -------------------- {{{

" Bash {{{

augroup ft_bash
    au!

    " Make {<cr> insert a pair of brackets
    au Filetype bash inoremap <buffer> {<cr> {}<left><cr><cr><up><space><space><space><space>
    " }fixes syntax highlighting
augroup END

" }}}
" CSS and LessCSS {{{

augroup ft_css
    au!

    au BufNewFile,BufRead *.less setlocal filetype=less

    au Filetype less,css setlocal iskeyword+=-

    " Space to toggle folds.
    au Filetype less,css nnoremap <Space> zA
    au Filetype less,css vnoremap <Space> zA

    " Use <localleader>S to sort properties.  Turns this:
    "
    "     p {
    "         width: 200px;
    "         height: 100px;
    "         background: red;
    "
    "         ...
    "     }
    "
    " into this:

    "     p {
    "         background: red;
    "         height: 100px;
    "         width: 200px;
    "
    "         ...
    "     }
    au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

    " Make {<cr> insert a pair of brackets
    au Filetype css inoremap <buffer> {<cr> {}<left><cr><cr><up><space><space><space><space>
    " }fixes syntax highlighting

augroup END

" }}}
" Java {{{

augroup ft_java
    au!

    " Space to toggle folds.
    au Filetype java nnoremap <Space> zA
    au Filetype java vnoremap <Space> zA

    " Make {<cr> insert a pair of brackets
    au Filetype java inoremap <buffer> {<cr> {}<left><cr><cr><up><space><space><space><space>
    " }fixes syntax highlighting
augroup END

" }}}
" Javascript {{{

augroup ft_javascript
    au!

    " Space to toggle folds.
    au Filetype javascript nnoremap <Space> zA
    au Filetype javascript vnoremap <Space> zA

    " Make {<cr> insert a pair of brackets
    au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><cr><up><space><space><space><space>
    " }fixes syntax highlighting
augroup END

" }}}
" Perl {{{

augroup ft_perl
    au!

    " Don't search included files for completion in perl
    au FileType perl setlocal complete-=i

    " add perl syntax highlighting for the following words
    au FileType perl syn keyword perlStatement any all croak carp cluck confess Readonly

    " Make {<cr> insert a pair of brackets
    au Filetype perl inoremap <buffer> {<cr> {}<left><cr><cr><up><space><space><space><space>
    " }fixes syntax highlighting
augroup END

" }}}
" PHP {{{

augroup ft_php
    au!

    " Make {<cr> insert a pair of brackets
    au Filetype php inoremap <buffer> {<cr> {}<left><cr><cr><up><space><space><space><space>
    " }fixes syntax highlighting
augroup END

" }}}
" Vim {{{

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=80

" Folding ------------------------------ {{{

" enable folding and start folds with level-0 unfolded
au FileType vim setlocal foldenable
au FileType vim setlocal foldlevelstart=0

" Space to toggle folds.
au FileType vim nnoremap <Space> za
au FileType vim vnoremap <Space> za

" Make zO recursively open whatever fold we're in, even if it's partially open.
au FileType vim nnoremap zO zczO

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}

au FileType vim setlocal foldtext=MyFoldText()

" }}}
augroup END

" }}}
" XML {{{

augroup ft_xml
    au!

    " Use <localleader>f to fold the current tag.
    au FileType xml nnoremap <buffer> <localleader>f Vatzf

    " Indent tag
    au FileType xml nnoremap <buffer> <localleader>= Vat=
augroup END

" }}}
" ZSH {{{

augroup ft_zsh
    au!

    " Make {<cr> insert a pair of brackets
    au Filetype zsh inoremap <buffer> {<cr> {}<left><cr><cr><up><space><space><space><space>
    " }fixes syntax highlighting
augroup END

" }}}

" }}}
