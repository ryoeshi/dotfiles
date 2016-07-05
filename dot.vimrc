set nocompatible
filetype off

"" .vim以下の設定ファイルを読み込み
set rtp+=${HOME}/.vim/
runtime! rc/*.vim

filetype plugin indent on

NeoBundleCheck

" 基本的な設定
syntax on
colorscheme inkpot

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=0
set number
set smartindent
set incsearch
" タブページを常に表示
set showtabline=2

autocmd FileType make setlocal noexpandtab

" バッファリスト表示
"nnoremap <F2> :Unite buffer<CR> 
"nnoremap <C-p> :previous<CR>
"nnoremap <C-n> :next<CR>
nnoremap <C-C> :bdelete<CR>
nnoremap <C-K> d$
nnoremap + <C-A>
nnoremap - <C-X>
" quickfixの修正
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>
" 画面分割 (<C-w>系のバインドをそのまま利用) 
"nnoremap <C-\> :vsplit<CR>
"nnoremap <C--> :split<CR>
" ファイラーオープン
nnoremap f <Nop>
nnoremap ff :NERDTreeToggle<CR>
" タブ設定
nnoremap s <Nop>
nnoremap sn gt
nnoremap sp gT
nnoremap st :<C-u>tabnew<CR>
nnoremap sq :<C-u>tabclose<CR>

" バッファ設定
nnoremap <silent>bp :bprevious<CR>
nnoremap <silent>bn :bnext<CR>
nnoremap <silent>bd :bdelete<CR>

" 閉じる系の操作
nnoremap zz :q<CR>
nnoremap zd :bd<CR>
nnoremap <C-d> :bd<CR>

" 行頭・行末移動方向をキーの相対位置にあわせる
nnoremap 0 $ 
nnoremap 1 0 
nnoremap <C-A> <HOME>
nnoremap <C-E> <END>

" insertモードで行頭・行末移動キーを設定
inoremap <silent> <C-A> <HOME>
inoremap <silent> <C-E> <END>
" 挿入モードでのカーソル移動
inoremap <silent> <C-B> <LEFT>
inoremap <silent> <C-F> <RIGHT>

" insertモードでのカーソル移動
inoremap <silent> <C-d> <Del>

""" 引用符, 括弧の設定
""inoremap { {}<Left>
""inoremap [ []<Left>
""inoremap ( ()<Left>
""inoremap " ""<Left>
""inoremap ' ''<Left>
""inoremap <> <><Left>

" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

