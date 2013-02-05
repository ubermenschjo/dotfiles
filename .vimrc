"======================================================================
"환상경의 VIM 설정 파일
"새로이 작성 : 2008년 4월 19일
"수정일 : 2010년 10월 17일 [ 중복 옵션 제거 ]
"수정일 : 2010년 10월 30일 [ et(extendtap 옵션 제거 = 탭을 스페이스바로
"수정일 : 2011년 04월 09일 [ 중복 옵션 제거 & bg=dark 옵션 추가 ]
"======================================================================

"vim 하단에 상태 표시줄 옵션
set laststatus=2
set statusline=%<%F%h%m%r%h%w%y\ %{strftime(\"%Y/%m/%d-%H:%M\")}%=\ col:%c%V\ ascii:%b\ pos:%o\ lin:%l\,%L\ %P

"오리지널 vi와의 호환성을 없애고 vim만의 기능을 쓰게 하는 옵션
set nocp

"명령어 히스토리 옵션
set hi=1000

"백스페이스 사용
set bs=indent,eol,start

"커서의 위치를 항상 보이게 함.
set ru

"여러가지 이동 동작시 줄의 시작으로 자동 이동
set sol

"사용자 괄호 찾기를 사용한다.
set mps+=<:>

"검색어 강조 기능
set hls

"똑똑한 대소문자 구별 기능 사용
set scs

" UTF-8, euc-kr 한글문서 그냥 열기
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set encoding=utf-8
    set fileencodings=utf-8,cp949
endif

"탭 크기 설정 / 탭 길이 / 들여쓰기 탭 간격
set ts=4    "tabstop
set sts=4   "softtabstop
set sw=4    "shiftwidth

"파일 형식에 따른 Syntax Highlighting 기능을 켠다
syntax on

"자동 들여쓰기를 한다.
set smartindent
set ai	    "autoindent

"C언어 자동 들여쓰기 옵션
set cindent

"붙여넣기시 들여쓰기 여부 선택 Ins키로 paste상태와 nopaste상태 전환
set pastetoggle=<Ins>

"vim Colorscheme
set bg=dark
"color desert
"color motus

"======================================================================
"폴딩 옵션 설정
"======================================================================

" 폴더 설정이 되어 있는 파일을 열었을때 폴더 되어 있는 레벨을 설정한다.
" 기본값 0이고 모두 폴딩된다.
set fdl=1

" 소스파일이 폴딩 되어 있을때 폴딩범위를 보여주는 컬럼의 수를 설정한다.
 set fdc=1

" 닫는 괄호")", 브라켓"}"을 입력시 매칭되는 여는 괄호, 브라켓에 잠시
" 커서가 위치했다가 다시 제자리로 돌아 온다.
set showmatch

"======================================================================
"gVim 설정
"======================================================================
"폰트 설정
if has("gui_running")
"   set guifont=DejaVu\ Sans\ Mono\ 11
"   set guifont=monospace\ 11
"   set guifont=DejaVu\ LGC\ Sans\ Mono\ 12
    set guifont=Monaco\ 9
"   set guifont=나눔고딕코딩\ 11 
"   set guifont=Monaco\ 10 
"   set guifont=monospace\ 10
"   set gfn=Fixedsys:h12:cHANGEUL
"   set gfn=굴림체:h9:cHANGEUL
endif

"gVim에서 마우스 작동 설정
if has("gui_running")
    " 마우스 모델을 popup 으로 함.
    set mousem=popup

endif

"스크롤바를 표시하지 않는다
if has("gui_running")
    set go-=l
    set go-=L
    set go-=r
    set go-=R
    set go-=b
endif

"툴바를 보이지 않게 한다.
if has("gui_running")
    set go-=T
endif

"gVim 화면 크기 설정
if has("gui_running")
    set lines=40
    set co=80
endif

"======================================================================
"파일 확장자에 따른 차별 옵션
"======================================================================
filetype on
filetype plugin indent on
au FileType perl,ruby,clojure,objc,python,java,c,cpp,cs,html,css,php,php4,js,css,jsp,sh set nu

"======================================================================
"vim-ruby Setting
"======================================================================
compiler ruby
au FileType ruby set tabstop=2
au FileType ruby set shiftwidth=2
au FileType ruby set softtabstop=2
au FileType ruby map <F2> : !ruby %

"======================================================================
"vimClojure Setting
"======================================================================
let clj_highlight_builtins = 1
let clj_highlight_contrib = 1
let clj_paren_rainbow = 1
let clj_want_gorilla = 1
let vimclojure#NailgunClient="/home/khmirage/Util/clojure/vimclojure/ng"

"======================================================================
"Key Mapping Setting
"======================================================================
"Whitespace Line Insert Mapping
"======================================================================
map .j o
map .k O
map .ti i	w

"======================================================================
"To HTML
"======================================================================
map .th : TOhtml<CR>

"======================================================================
"Shell Script Running
"======================================================================
au FileType sh map <F2> : !chmod +x %
au FileType sh map <F3> : !./%

"======================================================================
"C Compiler Mapping
"======================================================================
au FileType c map <F2> : !gcc -W -Wall -o %< %
au FileType c map <F3> : !./%<

"======================================================================
"C++ Compiler Mapping
"======================================================================
au FileType cpp map <F2> : !g++ -W -Wall -o %< %
au FileType cpp map <F3> : !./%<

"======================================================================
"Mono Compiler Mapping
"======================================================================
au FileType cs map <F2> : !mcs %
au FileType cs map <F3> : !mono %<.exe

"======================================================================
"Python Mapping
"======================================================================
au FileType python map <F2> : !python %
au FileType python set tabstop=8
au FileType python set shiftwidth=4
au FileType python set softtabstop=4

"======================================================================
"Java Compiler Mapping
"======================================================================
au FileType java map <F2> : !javac % 
au FileType java map <F3> : !java %<
au FileType java map <F4> : !appletviewer %<

"======================================================================
"JSP -> Firefox Launch Mapping
"======================================================================
au FileType jsp map <F2> : !firefox http://localhost:8180/lecture/%

"======================================================================
"Objective C Compiler Mapping
"======================================================================
au FileType objc map <F2> : !gcc -Wall -o %< % -lobjc
au FileType objc map <F3> : !./%<

"======================================================================
"Perl excute Mapping
"======================================================================
au FileType perl map <F2> : !perl -w %

