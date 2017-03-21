set fileencodings=utf-8,iso-2022-jp,euc-jp,ucs-2le,ucs-2,cp932
set foldmethod=marker
set runtimepath+=/opt/brew/share/vim/vim74/vimfiles
set runtimepath+=/opt/brew/share/vim/vim74
set runtimepath+=/opt/brew/share/vim/vim74/vimfiles/after

if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

" コード補完
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'marcus/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'

" 静的解析
"NeoBundle 'scrooloose/syntastic'

" ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'

" メソッド定義元へのジャンプ
NeoBundle 'szw/vim-tags'

" 自動で閉じる
NeoBundle 'tpope/vim-endwise'

" Cofee Script
NeoBundle 'kchmck/vim-coffee-script'

call neobundle#end()

NeoBundleCheck

" -------------------------------
" Rsense
" -------------------------------
let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1

" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" --------------------------------
" rubocop
" --------------------------------
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

" --------------------------------
" 基本設定
" --------------------------------
" vim内部で使われる文字エンコーディングをutf-8に設定する
set encoding=utf-8

" 想定される改行コードの指定する
set fileformats=unix,dos,mac

" ハイライトを有効化する
syntax enable

" 挿入モードでTABを挿入するとき、代わりに適切な数の空白を使う
set expandtab

" 新しい行を開始したとき、新しい行のインデントを現在行と同じにする
set autoindent

" ファイル形式の検出の有効化する
" ファイル形式別プラグインのロードを有効化する
" ファイル形式別インデントのロードを有効化する
filetype plugin indent on

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

    autocmd FileType yaml :set tabstop=2
    autocmd FileType yaml :set shiftwidth=2
    autocmd FileType yaml :set softtabstop=2

    autocmd FileType xml :set tabstop=2
    autocmd FileType xml :set shiftwidth=2
    autocmd FileType xml :set softtabstop=2

    autocmd FileType html :set tabstop=2
    autocmd FileType html :set shiftwidth=2
    autocmd FileType html :set softtabstop=2

    autocmd FileType coffee :set tabstop=2
    autocmd FileType coffee :set shiftwidth=2
    autocmd FileType coffee :set softtabstop=2

    autocmd FileType make :set noexpandtab

    autocmd FileType scss :set tabstop=2
    autocmd FileType scss :set shiftwidth=2
    autocmd FileType scss :set softtabstop=2

    autocmd FileType haml :set tabstop=2
    autocmd FileType haml :set shiftwidth=2
    autocmd FileType haml :set softtabstop=2

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

autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Podfile set filetype=ruby


noremap <C-a> ^
noremap <C-e> $

set showmatch

if !exists('loaded_matchit')
  " matchitを有効化
  runtime macros/matchit.vim
endif
