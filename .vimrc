set fileencodings=utf-8,iso-2022-jp,euc-jp,ucs-2le,ucs-2,cp932
set foldmethod=marker

"if has('iconv')
"  set fileencodings+=iso-2022-jp
"  set fileencodings+=utf-8,ucs-2le,ucs-2
"  if &encoding ==# 'euc-jp'
" set fileencodings+=cp932
"  else
" set fileencodings+=euc-jp
"  endif
"endif
"set enc=japan fencs=iso-2022-jp,cp932,euc-jp,sjis

set smartindent
" ------------------------------------------------------------------------
set ignorecase
set smartcase
set wrapscan
set noincsearch

" -----------------------------------------------------------------------

set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent

set ruler
set showcmd
set number
set backspace=2
set nobackup
set expandtab
sy on

if has("autocmd")
    autocmd FileType ruby :set tabstop=2
    autocmd FileType ruby :set shiftwidth=2
    autocmd FileType ruby :set softtabstop=2

    autocmd FileType javascript :set tabstop=2
    autocmd FileType javascript :set shiftwidth=2
    autocmd FileType javascript :set softtabstop=2

    autocmd FileType yaml :set tabstop=2
    autocmd FileType yaml :set shiftwidth=2
    autocmd FileType yaml :set softtabstop=2
 
    autocmd FileType json :set tabstop=2
    autocmd FileType json :set shiftwidth=2
    autocmd FileType json :set softtabstop=2

    autocmd FileType xml :set tabstop=2
    autocmd FileType xml :set shiftwidth=2
    autocmd FileType xml :set softtabstop=2

    autocmd FileType html :set tabstop=2
    autocmd FileType html :set shiftwidth=2
    autocmd FileType html :set softtabstop=2

    autocmd FileType make :set noexpandtab
endif


set showmatch
set hlsearch
set laststatus=2

if &filetype == 'ruby'
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
endif

"------------------------------------------------------------------------
" plugins
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

"------------------------------------------------------------------------
" omini compelete

if has("autocmd") && exists("+omnifunc")
    autocmd FileType php        :set omnifunc=phpcomplete#CompletePHP
    autocmd FileType html       :set omnifunc=htmlcomplete#CompleteTags
    
    autocmd FileType javascript :set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType xml        :set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType css        :set omnifunc=csscomplete#CompleteCSS
    autocmd Filetype * 
                \   if &omnifunc == "" |
                \           setlocal omnifunc=syntaxcomplete#Complete |
                \   endif
endif


function InsertTabWrapper()
           if pumvisible()
                 return "\<c-n>"
           endif
           let col = col('.') - 1 
           if !col || getline('.')[col - 1] !~ '\k\|<\|/'
                   return "\<tab>"
           elseif exists('&omnifunc') && &omnifunc == ''
                   return "\<c-n>"
           else    
                   return "\<c-x>\<c-o>"
           endif
endfunction

inoremap <CTRL-p> <c-r>=InsertTabWrapper()<cr>
setlocal omnifunc=syntaxcomplete#Complete
noremap <C-a>   ^
noremap <C-e>   $
