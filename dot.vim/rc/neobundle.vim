set rtp+=${HOME}/.vim/bundle/neobundle.vim

"" プラグインの設定
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
  \ 'build' : {
  \     'windows' : 'tools\\update-dll-mingw',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make',
  \     'linux' : 'make',
  \     'unix' : 'gmake',
  \    },
  \ }

function! s:meet_neocomplete_requirements()
    return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction

if s:meet_neocomplete_requirements()
    NeoBundle 'Shougo/neocomplete.vim'
    NeoBundleFetch 'Shougo/neocomplcache'
else
    NeoBundleFetch 'Shougo/neocomplete.vim'
    NeoBundle 'Shougo/neocomplcache'
endif

NeoBundle 'scrooloose/nerdtree'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neomru.vim'

NeoBundle 'ciaranm/inkpot'

call neobundle#end()

"set runtimepath+=~/.vim/dein/repos/dein.vim
"
"" プラグインの設定
"call dein#begin(expand('~/.vim/dein'))
"
"call dein#add('Shougo/dein.vim')
"call dein#add('Shougo/unite.vim')
""call dein#add('Shougo/neocomplete.vim')
"call dein#add('Shougo/neocomplcache')
"call dein#add('Shougo/neosnippet')
"call dein#add('Shougo/neomru.vim')
"
"call dein#end()

