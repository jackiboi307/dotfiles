"
"  NeoVim configuraton
"
"     ,;,         :.
"   ,::;::        :cc,
"  ::c:::::.      :cccc 
"  cccc:;;;;.     cllll 
"  ccccc';;;;;.   cllll 
"  ccccc  :;;;;.  coooo 
"  lllll   ':::::.loooo 
"  lllll    `::::::oooo 
"  ooooo      ':::::odd 
"  'oooo       ':::::o: 
"    'oc         :::::´
"      '          `:´  

set number
windo set scrolloff=1
" Exit terminal mode with escape instead of the stupid standard
tnoremap <Esc> <C-\><C-n>
set nofoldenable " Don't fold everything in new files
set noshowmode
" set linebreak

" set autochdir
autocmd BufEnter * silent! lcd %:p:h

" Tab settings:
filetype plugin on
filetype plugin indent on
set tabstop=4 " show existing tab with 4 spaces width
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab " On pressing tab, insert 4 spaces
set sw=4 sts=4 et

set laststatus=2

" inoremap <C-o> <Esc>:s/INS:/<CR>:s/INS:/\/<CR>:noh<CR> 2 a <INS:><Left>
" inoremap <C-o> <Esc>a<INS:><Left>
" inoremap <C-p> <Esc>:s/<INS:\(.*\)>/<\1>MID<\/\1><CR>/MID<CR>:noh<CR>ves
inoremap <C-o> <Esc>a<><><Left><Left><Left>
inoremap <C-p> <Esc>:s/<\(.*\)><>/<\1>MID<\/\1><CR>/MID<CR>:noh<CR>ves

" Plugins
call plug#begin('~/.vim/plugged')
    " Dunno
    Plug 'airblade/vim-rooter'
    Plug 'tpope/vim-commentary'
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-session'
    Plug 'kyazdani42/nvim-tree.lua'

    " Python
    " Plug 'vim-python/python-syntax'
    Plug 'tmhedberg/SimpylFold'

    " Folding
    Plug 'Konfekt/FastFold'
    Plug 'zhimsel/vim-stay'

    " Colorscemes
    Plug 'morhetz/gruvbox'
    " Plug 'mcombeau/monosplash.vim'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'dense-analysis/ale'
    " Plug 'mhinz/vim-startify'
    
    " Plug 'vim-crystal/vim-crystal'
call plug#end()

let g:session_autosave = 'no'
let g:session_autoload = 'no'

" Colorscheme, syntax highlightning, and other aesthetic stuff

" colorscheme jack
" colorscheme gruvbox
" colorscheme monosplash
colorscheme retrobox

" Gruvbox
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_transparent_bg = 1

" Monosplash
" let g:monosplash_no_bg = 1
" let g:monosplash_color = 'red'

" python-syntax
" let g:python_highlight_all = 0
" let g:python_highlight_indent_errors = 0
" let g:python_highlight_space_errors = 0
" let g:python_highlight_exceptions = 0
" let g:python_highlight_operators = 0
" let g:python_highlight_func_calls = 0

source /home/jack/.config/nvim/colors.vim
hi! Normal guibg=NONE ctermbg=NONE

augroup statusline
    autocmd!
    autocmd WinEnter,BufEnter * setlocal statusline=%#StatusActive#%F%r%m%=%3l:%-2c
    autocmd WinLeave,BufLeave * setlocal statusline=%#StatusInactive#%F%r%m%=%3l:%-2c
augroup end

" Custom functions

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Custom tab-title (from :h setting-tabline)
function MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s ..= '%#TabLineSel#'
        else
            let s ..= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        let s ..= '%' .. (i + 1) .. 'T'

        " the label is made by MyTabLabel()
        let s ..= ' %{MyTabLabel(' .. (i + 1) .. ')} '

        if i + 1 == tabpagenr()
            let s ..= '%m'
        endif
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s ..= '%#TabLineFill#%T'

    " right-align the label to close the current tab page
    "if tabpagenr('$') > 1
    "    let s ..= '%=%#TabLine#%999Xclose'
    "endif

    return s
endfunction

function MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)

    let name = bufname(buflist[winnr - 1])
    let splitted = split(name, "/")

    if len(splitted) > 0
        let name = splitted[-1]
    endif

    if name == ''
        return '[New]'
    else
        return name
    endif
endfunction

set tabline=%!MyTabLine()

" Custom fold text (from SO)
fu! CustomFoldText(string)
    " get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif
    let pat  = matchstr(&l:cms, '^\V\.\{-}\ze%s\m')
    " remove leading comments from line
    let line = substitute(line, '^\s*'.pat.'\s*', '', '')
    " remove foldmarker from line
    let pat  = '\%('. pat. '\)\?\s*'. split(&l:fmr, ',')[0]. '\s*\d\+'
    let line = substitute(line, pat, '', '')

"   let line = substitute(line, matchstr(&l:cms,
"	    \ '^.\{-}\ze%s').'\?\s*'. split(&l:fmr,',')[0].'\s*\d\+', '', '')

    if get(g:, 'custom_foldtext_max_width', 0)
	let w = g:custom_foldtext_max_width - &foldcolumn - (&number ? 8 : 0)
    else
	let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    endif
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = '+'. v:folddashes
    let lineCount = line("$")
    if exists("*strwdith")
	let expansionString = repeat(a:string, w - strwidth(foldSizeStr.line.foldLevelStr))
    else
	let expansionString = repeat(a:string, w - strlen(substitute(foldSizeStr.line.foldLevelStr, ' ', 'x', 'g')))
    endif
    return line . expansionString . foldSizeStr . foldLevelStr
endf

set foldtext=CustomFoldText('\ ')

" I don't remember what this is
augroup terminal_settings
    autocmd!

    " autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert

    " Ignore various filetypes as those will close terminal automatically
    " Ignore fzf, ranger, coc
    autocmd TermClose term://*
      \ if (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "ranger") && (expand('<afile>') !~ "coc") |
      \   call nvim_input('<CR>')  |
      \ endif
augroup END

" vim-session
let g:rooter_patterns = ['Session.vim']
let g:startify_custom_header = [
		\ '    _   _         __     ___           ',
		\ '   | \ | | ___  __\ \   / (_)_ __ ____ ',
		\ '   |  \| |/ _ \/ _ \ \ / /| | `_ ` _  \',
		\ '   | |\  |  __/ (_) \ V / | | | | | | |',
		\ '   |_| \_|\___|\___/ \_/  |_|_| |_| |_|',
		\]
let g:startify_bookmarks = ['~/.config/nvim/init.vim']
let g:startify_lists = [
			\ {'type': 'sessions',  'header': ['   Sessions']},
			\ {'type': 'bookmarks', 'header': ['   Bookmarks']}]

" Other bindings:

" Run file in terminal window
nnoremap <F5> :vsplit <bar> :term python ~/Programmering/vim-run-py.py % <CR> a
" inoremap <silent> <F5> <Esc> :execute ':vsplit <bar> :term python "~/Programmering/vim-run-py.py %"' <bar> :startinsert <CR> a

" Save
nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <Esc>:w<CR>a
" Bruh

" Better window navigation
" noremap  <A-h> <C-w>h
" noremap! <A-h> <C-w>h
" noremap  <A-j> <C-w>j 
" inoremap <C-l> <Right>

noremap <Tab> :tabnext<CR>
noremap <S-Tab> :tabprevious<CR>

" Look at that subtle off-white coloring...
nnoremap + $
vnoremap + $
onoremap + $

" ...the tasteful thickness of it...
nnoremap 0 ^
vnoremap 0 ^
onoremap 0 ^

" ...oh my god,
nnoremap = 0
vnoremap = 0
onoremap = 0

" it even has a watermark...
nnoremap H b
nnoremap L w
nnoremap K {k
nnoremap J }j
onoremap H b
onoremap L w
onoremap K {k
onoremap J }j
vnoremap H b
vnoremap L w
vnoremap K {k
vnoremap J }j

" Is something wrong, Patrick? You're sweating...
nnoremap <C-Space> viws
nnoremap <Space> viw
vnoremap <Space> viw
onoremap <Space> viw

" Random useful stuff:
nnoremap <C-CR> :noh<CR>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" vnoremap isd isddj

" nnoremap H vB
" nnoremap L vE
" nnoremap J vj
" nnoremap K vk

" vnoremap H B
" vnoremap L W
" vnoremap J j
" vnoremap K k

let s:chars = "[()[\\]{}<>'\"]"

function CharForward()
    call search(s:chars)
endfunction

function CharBackward()
    call search(s:chars, 'b')
endfunction

nnoremap ) <Cmd>call CharForward()<CR>
nnoremap ( <Cmd>call CharBackward()<CR>
vnoremap ) <Cmd>call CharForward()<CR>
vnoremap ( <Cmd>call CharBackward()<CR>
onoremap ) <Cmd>call CharForward()<CR>
onoremap ( <Cmd>call CharBackward()<CR>

vmap <Space> <Esc>(lv)h

nnoremap Q @q

" Plugin bindings
" nnoremap , gcc

" https://github.com/vim-scripts/Rename2
command! -nargs=* -complete=file -bang Rename :call Rename("<args>", "<bang>")
function! Rename(name, bang)
    let l:curfile = expand("%:p")
    let l:curfilepath = expand("%:p:h")
    let l:newname = l:curfilepath . "/" . a:name
    let v:errmsg = ""
    silent! exe "saveas" . a:bang . " " . l:newname
    if v:errmsg =~# '^$\|^E329'
        if expand("%:p") !=# l:curfile && filewritable(expand("%:p"))
            silent exe "bwipe! " . l:curfile
            if delete(l:curfile)
                echoerr "Could not delete " . l:curfile
            endif
        endif
    else
        echoerr v:errmsg
    endif
    e
endfunction

" CoCk
" use <tab> for trigger completion and navigate to the next complete item
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <C-Space>
"       \ pumvisible() ? "\<C-Space>" :
"       \ <SID>check_back_space() ? "\<C-Space>" :
"       \ coc#refresh()

" "inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" linting:

" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_linters = {'python': ['pylint']}
" \   'bandit',
" \   'jedils',
" \   'mypy',
" \   'prospector',
" \   'pycodestyle',
" \   'pydocstyle',
" \   'pyflakes',
" \   'pylama',
" \   'pylint',
" \   'pylsp',
" \   'pyre',
" \   'pyright',
" \   'vulture'

