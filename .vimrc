" nastavení set
set nocompatible
set history=1000
set viminfo='50,"500
set incsearch
"set langmap=š3 - namapuje v normální režimu š na 3
set ruler
set showcmd
set wildmenu
set number
set tabstop=4
set shiftwidth=4
filetype indent on
filetype plugin indent on
set autoindent
set smartindent
" zruší ikony
set guioptions-=T
" nastav grafické zobrazení záložek
set foldcolumn=4
set foldlevel=10
set foldmethod=indent	
set laststatus=2
set ignorecase " case insensitive search.
set shiftround
"set clipboard=unnamed

"imap <C-h> <Left>
"imap <C-j> <Down>
"imap <C-k> <Up>
"imap <C-l> <Right>

call pathogen#infect()
" comment in yellow
syntax enable
"hi comment ctermfg=5
hi comment ctermfg=yellow
"hi number ctermfg=red



" automatické příkazy
	autocmd BufNewFile *.html r /home/knezi/Documents/sablony/html.html | call Priprav_soubor()
	autocmd BufNewFile *.php r /home/knezi/Documents/sablony/php.php | call Priprav_soubor()
	autocmd BufNewFile *.tex r /home/knezi/Documents/sablony/tex.tex | call Priprav_soubor() | call Nastav_make()
	autocmd BufNewFile */ksp_ulohy/*.tex %d | r /home/knezi/Documents/sablony/ksp.tex | call Priprav_soubor()
	autocmd BufNewFile */mks_ulohy/*.tex %d | r /home/knezi/Documents/sablony/mks.tex | call Priprav_soubor()
	autocmd BufNewFile */brkos_ulohy/*.tex %d | r /home/knezi/Documents/sablony/brkos.tex | call Priprav_soubor()
	autocmd BufNewFile */mam/*.tex %d | r /home/knezi/Documents/sablony/mam.tex | call Priprav_soubor()
	autocmd BufNewFile /*.py %d | r /home/knezi/Documents/sablony/python.py | call Priprav_soubor() | call Nastav_py()
	autocmd BufNewFile /*.pyw %d | r /home/knezi/Documents/sablony/python.pyw | call Priprav_soubor() | call Nastav_py()
	autocmd BufNewFile /*.sh %d | r /home/knezi/Documents/sablony/shell.sh | call Priprav_soubor()
	autocmd BufReadPre *.py call Nastav_py()
	autocmd BufReadPre *.pyw call Nastav_py()
	autocmd BufNewFile *.coffee call Nastav_make_coffee()
	autocmd BufReadPre *.coffee call Nastav_make_coffee()
	autocmd BufNewFile *.c call Nastav_make_c()
	autocmd BufReadPre *.c call Nastav_make_c()
	autocmd BufNewFile *.cpp call Nastav_make_cpp() | r /home/knezi/Documents/sablony/cpp.cpp | call Priprav_soubor()
	autocmd BufReadPre *.cpp call Nastav_make_cpp()
	autocmd BufReadPre *.sh call Nastav_make_shell()
	autocmd BufNewFile *.sh call Nastav_make_shell()
	autocmd BufReadPre *.tex call Nastav_make()
	autocmd BufReadPre *.html,*.php call Zkratky()
	autocmd BufReadPre,BufNewFile *.html,*.css call Zkratky_css()
	" autocmd BufWritePost *.tex call Preklad_TeX("texxxx")

function Nastav_py()
	set makeprg=./%\ zadani.txt
	map <F5> :w<CR>:make<CR>
	map! <F5> <esc>:w<CR>:make<CR>
	map <F6> :w<CR>:!./% < input<CR>
	map! <F6> <esc>:w<CR>:!./% < input<CR>
	map M :s@^\(\s*\)\(\S\)@\1\# \2@<CR>
	map m :s@^\(\s*\)# @\1@<CR>
endfunction

function Nastav_make_coffee()
	" set makeprg=coffee\ -b\ -c\ %
	map M :s@^\(\s*\)\(\S\)@\1\# \2@<CR>
	map m :s@^\(\s*\)# @\1@<CR>
	map <F5> :w<CR>:!/home/knezi/Documents/server/ffos/calc/make.sh<CR>
	map! <F5> <ESC>:w<CR>:!/home/knezi/Documents/server/ffos/calc/make.sh<CR>
endfunction

function Nastav_make_c()
	set makeprg=gcc\ %\ -g\ -o\ %.out
	map <f5> :w<cr>:make<cr>
	map! <f5> <esc>:w<cr>:make<cr>
	map <f6> :!./%.out < input<cr>
	map! <f6> :!./%.out < input<cr>
	map <f7> :!gdb\ %.out<cr>
	map! <f7> :!gdb\ %.out<cr>
endfunction

function Nastav_make_cpp()
	set makeprg=g++\ %\ -o\ %.out
	map <f5> :w<cr>:make<cr>:!./%.out<cr>
	map! <f5> <esc>:w<cr>:make<cr>:!./%.out<cr>
	map <f6> :w<cr>:make<cr>:!./%.out < input<cr>
	map! <f6> <esc>:w<cr>:make<cr>:!./%.out < input<cr>
endfunction

function Nastav_make()
	set makeprg=pdfcsplain\ %
	map <f5> :w<cr>:make<cr><cr>
	map! <f5> <esc>:w<cr>:make<cr><cr>
endfunction

function Nastav_make_shell()
	set makeprg=./%
	map <f5> :w<cr>:make<cr><cr>
	map! <f5> <esc>:w<cr>:make<cr><cr>
endfunction

function Priprav_soubor()
	1d 
	" aby najel na správný řádek, najde kde je a pak ho smaže
	/buffer
	.d
endfunction

" pro nejefektivnější použití mačkej za zkratkami " resp. mezeru
function Zkratky()
	" databáze MySQL
	abbr db_in mysql_query("INSERT INTO
	abbr db_out mysql_query("SELECT
	abbr db_con mysql_connect("localhost", "root", "12345");mysql_query("set names utf8");date_default_timezone_set("Europe/Prague");mysql_select_db(
	abbr db_up mysql_query("UPDATE
	abbr db_del mysql_query("DELETE
	abbr db_row mysql_num_rows(
	abbr db_get mysql_fetch_array(
	abbr kde WHERE

	"HTML
	abbr <a <a href=
	abbr <d <div id=

	" PHP
	abbr fce function
endfunction

function Zkratky_css()
	abbr bg background
	abbr url url("..
endfunction

" pro zrušení menu zakomentuj všechny řádky $VIMRUNTIME/menu.vim
" edituj .vimrc soubor
" nmap  :e\ /home/knezi/.vimrc
