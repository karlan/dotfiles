" ~/.vimrc (configuration file for vim only)
" show current time in status

"set ruler
"set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
" more useful status line:
" http://stackoverflow.com/questions/5375240/a-more-useful-statusline-in-vim
" status line color


" skeletons
function! SKEL_spec()
	0r /usr/share/vim/current/skeletons/skeleton.spec
	language time en_US
	if $USER != ''
	    let login = $USER
	elseif $LOGNAME != ''
	    let login = $LOGNAME
	else
	    let login = 'unknown'
	endif
	let newline = stridx(login, "\n")
	if newline != -1
	    let login = strpart(login, 0, newline)
	endif
	if $HOSTNAME != ''
	    let hostname = $HOSTNAME
	else
	    let hostname = system('hostname -f')
	    if v:shell_error
		let hostname = 'localhost'
	    endif
	endif
	let newline = stridx(hostname, "\n")
	if newline != -1
	    let hostname = strpart(hostname, 0, newline)
	endif
	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
	setf spec
endfunction
autocmd BufNewFile	*.spec	call SKEL_spec()
iab xdate <c-r>=strftime("20%y年%m月%d日 %H:%M:%S")<cr>
iab ename Zhang Shan
iab cname 张三
" filetypes
filetype plugin on
filetype indent on
imap zsj <c-r>=strftime("20%y-%m-%d %H:%M:%S")<cr>
" ~/.vimrc ends here
set hlsearch
set ignorecase
set si
set shiftwidth=4
set nocompatible

" colorscheme
colorscheme elflord

" input <F5> in normal mode or insert mode to write the current time
:nnoremap <F5> "=strftime("%c")<CR>P
:inoremap <F5> <C-R>=strftime("%c")<CR>

" change font quickly (from vim wiki site, google it)
" two command    :LargerFont and :SmallerFont

let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16
function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()

" vimwiki-configure
filetype plugin on
filetype indent on
syntax on
" vimwiki
 
"     是否在词条文件保存时就输出html  这个会让保存大词条比较慢
      "所以我默认没有启用  有需要的话就把这一行复制到下面去
"     \ 'auto_export': 1,
 
" 多个维基项目的配置
"let g:vimwiki_list = [{'path': '/home/karlan/vimwiki/',
"      \ 'html_header': '/home/karlan/vimwiki_template/header.htm',
"      \ 'html_footer': '/home/karlan/vimwiki_template/footer.htm',
"      \ 'diary_link_count': 5},
"      \{'path': 'Z:\demo\qiuchi\wiki'}]
 
" 对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
let g:vimwiki_camel_case = 0
 
" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked = 1
 
" 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义
let g:vimwiki_menu = ''
 
" 是否开启按语法折叠  会让文件比较慢
"let g:vimwiki_folding = 1
 
" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1
 
" 详见下文...
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'

if has("autocmd")
    au BufReadPost * if line("`\"") > 1 && line("`\"") <= line("$") | exe "normal! g`\"" | endif
    " for simplicity, "  au BufReadPost * exe "normal! g`\"", is Okay.
endif


if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
