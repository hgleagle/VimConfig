    "this line should not be removed as it ensures that various options are
    " properly set to work with the Vim-related packages available in Debian.
    "debian.vim

    " Uncomment the next line to make Vim more Vi-compatible
    " NOTE: debian.vim sets 'nocompatible'. Setting 'compatible' changes numerous
    " options, so any other options should be set AFTER setting 'compatible'.
    set nocompatible

	"vundle管理
	filetype off
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'majutsushi/tagbar'
    Plugin 'mileszs/ack.vim'
    "Plugin 'Shougo/neocomplete.vim'
	Plugin 'Valloric/YouCompleteMe'
	Plugin 'ctrlpvim/ctrlp.vim'
	Plugin 'scrooloose/nerdtree'
	Plugin 'ervandew/supertab'
	Plugin 'easymotion/vim-easymotion'

	" Track the engine.
	Plugin 'SirVer/ultisnips'
	" Snippets are separated from the engine. Add this if you want them:
	Plugin 'honza/vim-snippets'

	"from <<practical vim>>
	Plugin 'bronson/vim-visual-star-search'
	Plugin 'tpope/vim-fugitive' "git wrapper
	" Plugin 'tpope/vim-commentary' "gc 
	Plugin 'tpope/vim-surround'
	Plugin 'tpope/vim-unimpaired' "[l [q [b [a [t
	Plugin 'tpope/tpope-vim-abolish' "super substitute，Subvert

	" Beautify
	Plugin 'plasticboy/vim-markdown'
	"Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'kien/rainbow_parentheses.vim'

	" for language
    Plugin 'fatih/vim-go'
	Plugin 'mattn/emmet-vim'
	Plugin 'vim-syntastic/syntastic'
	Plugin 'scrooloose/nerdcommenter'
	Plugin 'Yggdroot/indentLine' " vertical indentline
	"Plugin 'jiangmiao/auto-pairs'
	"Plugin 'vim-scripts/simple-pairs'
	Plugin 'Raimondi/delimitMate'

	"for python
	Plugin 'python-mode/python-mode'
	"Plugin 'nvie/vim-flake8' "PEP8 checking
	"Plugin 'vim-scripts/indentpython.vim'
	"Plugin 'tell-k/vim-autopep8'

	"scheme
	Plugin 'jnurmine/Zenburn'
	Plugin 'altercation/vim-colors-solarized'
	Plugin 'tomasr/molokai'

    " plugin from http://vim-scripts.org/vim/scripts.html
	Plugin 'python_match.vim'
	Plugin 'matchit.zip'

	call vundle#end()
	filetype plugin indent on

	"--pathogen插件管理--
	"call pathogen#infect()
	"call pathogen#helptags()
	
    "python
	let python_highlight_all=1
	" au BufNewFile,BufRead *.py
	"     \ set tabstop=4
	"     \ set softtabstop=4
	"     \ set shiftwidth=4
	"     \ set textwidth=79
	"     \ set expandtab
	"     \ set autoindent
	"     \ set fileformat=unix


	au BufNewFile,BufRead *.js, *.html, *.css
	    \ set tabstop=2
	    \ set softtabstop=2
	    \ set shiftwidth=2

    " Vim5 and later versions support syntax highlighting. Uncommenting the
    " following enables syntax highlighting by default.
    if has("syntax")
      syntax on            " 语法高亮
    endif
    colorscheme ron        " elflord ron peachpuff default 设置配色方案，vim自带的配色方案保存在/usr/share/vim/vim72/colors目录下

    " detect file type
	filetype on
	" 根据侦测到的不同类型加载对应的插件
    filetype plugin on
	"runtime macros/matchit.vim "keyword jump
	"packadd! matchit

    " If using a dark background within the editing area and syntax highlighting
    " turn on this option as well
    set background=dark

    " Uncomment the following to have Vim jump to the last position when
    " reopening a file
    if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
      "have Vim load indentation rules and plugins according to the detected filetype
      filetype plugin indent on
    endif

    " The following are commented out as they cause vim to behave a lot
    " differently from regular Vi. They are highly recommended though.

    "set ignorecase        " 搜索模式里忽略大小写
    "set smartcase        " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
    set autowrite        " 自动把内容写回文件: 如果文件被修改过，在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。
    set autoindent        " 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
    "set smartindent        " 智能对齐方式
    set tabstop=4        " 设置制表符(tab键)的宽度
    set softtabstop=4     " 设置软制表符的宽度    
    set shiftwidth=4    " (自动) 缩进使用的4个空格
    set cindent            " 使用 C/C++ 语言的自动缩进方式
    set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s     "设置C/C++语言的具体缩进方式
    "set backspace=2    " 设置退格键可用
    set showmatch        " 设置匹配模式，显示匹配的括号
    set linebreak        " 整词换行
    set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
    "set hidden " Hide buffers when they are abandoned
    set number            " Enable line number    "显示行号
	set relativenumber	  " 相对行号
    "set previewwindow    " 标识预览窗口
    set history=1000        " set command history to 1000    
	"set clipboard=unnamed


	"显示tab符号
	"set list
	set listchars=tab:>-,trail:-

    "--状态行设置--
    set laststatus=2 " 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
	set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P>
    set ruler            " 标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。

    "--命令行设置--
    set showcmd            " 命令行显示输入的命令
    set showmode        " 命令行显示vim当前模式

    "--find setting--
    set incsearch        " 输入字符串就显示匹配点
    set hlsearch        

	"--save cursor position
	augroup resCur
		autocmd!
		autocmd BufReadPost * call setpos(".", getpos("'\""))
	augroup END
	

	" if Command-Line Mode

	"----autocomplete menu like zsh
	set wildmenu
	set wildmode=longest,full

	"---filter the command history
	cnoremap <C-p> <Up>
	cnoremap <C-n> <Down>

	" 强行写入
	cnoremap w!! w !sudo tee >/dev/null % 

	" endif

	" if Insert Mode
	" --- allow backspacing over everthing in insert mode
	set backspace=indent,eol,start
	" endif

	"如上设置是vim可以识别utf-8和gbk的文件
	set encoding=utf-8
	set tenc=utf-8
	set fileencodings=utf-8,cp936 
	set scrolloff=18	"光标距离顶端18行移动屏幕
	" 当遇到没有行号的行时，gj/gk命令会使光标按虚拟行移动，而当遇到有行号的行时，光标则按物理行移动,和相对行号匹配
	noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
	noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

    "-----fold setting--
    "set foldmethod=syntax " 用语法高亮来定义折叠,跟neocomplete冲突
	set foldmethod=indent
    set foldlevel=100 " 启动vim时不要自动折叠代码
    set foldcolumn=5 " 设置折叠栏宽度

	"-------------- omnicppcomplete setting --
	"" 按下F8自动补全代码，注意该映射语句后不能有其他字符，包括tab；否则按下F8会自动补全一些乱码
	"imap <F8> <C-X><C-O>
	" 按下F2根据头文件内关键字补全
	"imap <F2> <C-X><C-I>
	set completeopt=menu,menuone " 关掉智能补全时的预览窗口
	let OmniCpp_MayCompleteDot = 1 " autocomplete with .
	let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
	let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
	let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
	let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
	let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
	let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
	let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
	"let OmniCpp_DefaultNamespaces=["std"]
	let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
	let OmniCpp_ShowAccess=1 

	"----------ctags setting--
	"" 按下F5重新生成tag文件，并更新taglist
	"map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
	"imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
	set tags=tags
	set tags+=./tags "add current directory's generated tags file
	"set tags+=~/openwrt/ap120-h/ "add new tags file(刚刚生成tags的路径，在ctags -R 生成tags文件后，不要将tags移动到别的目录，否则ctrl+］时，会提示找不到源码文件)
	
	"--------------- Cscope setting --
    if has("cscope")
        set csprg=/usr/bin/cscope        " 指定用来执行cscope的命令
        set csto=0                        " 设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库
        set cst                            " 同时搜索cscope数据库和标签文件
        set cscopequickfix=s-,c-,d-,i-,t-,e-    " 使用QuickFix窗口来显示cscope查找结果
        set nocsverb
        if filereadable("cscope.out")    " 若当前目录下存在cscope数据库，添加该数据库到vim
            cs add cscope.out
        elseif $CSCOPE_DB != ""            " 否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
            cs add $CSCOPE_DB
        endif
        set csverb
    endif
    "map <F9> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
    "imap <F9> <ESC>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
	
	"双击F8调出函数、变量等tags。
	"单击F8出现文件管理器（重复这个过程关闭）。以上产生的子区域都是通过Crtl+ww来相互跳转
	"单击F10生成这个目录及其子目录的tags以及cscope文件，并添加。
	"双击F10仅加载tags和cscope文件
	"将光标指向一些函数名或者变量名，使用Crtl+\+以下字母来跳转，并使用Crtl+O跳转回来
	"-- Taglist setting --
	let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
	let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边
	let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表
	let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
	let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
	"是否一直处理tags.1:处理;0:不处理
	let Tlist_Process_File_Always=1 "实时更新tags
	let Tlist_Inc_Winwidth=0

	"-- WinManager setting --
	let g:winManagerWindowLayout='FileExplorer|TagList' "
	let g:winManagerWidth = 30
	let g:defaultExplorer = 0
	nmap <C-W><C-F> :FirstExplorerWindow<cr>
	nmap <C-W><C-B> :BottomExplorerWindow<cr>
	nmap <silent> <leader>wm :WMToggle<cr> 
    "设置我们要管理的插件
    let g:persistentBehaviour=0 " 如果所有编辑文件都关闭了，退出vim
	"映射F7为功能键调出winmanager的文件浏览器
	"映射双击F7调出Taglist的符号浏览器
	map <F7> :WMToggle<cr>
	map <F7><F7> :TlistToggle<cr>
	
    "--ctags and cscope setting--
	function Do_CsTag()
		silent! execute "!ctags -R '.'"
		if (executable('cscope') && has("cscope"))
			silent! execute "!find -L `pwd` -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' -o -name '*.cxx' -o -name '*.hxx' -o -name '*.hpp' -o -name '*.py' > cscope.files" 
		endif
		silent! execute "!cscope -bq"
		silent! execute "call Add_CsTag()"
	endfun
	function Add_CsTag()
		if filereadable("cscope.out")
			execute "cs add cscope.out"
			execute "set tags+=./tags"
		endif
	endfun
	silent! execute "call Add_CsTag()"
	"映射F10为添加cscope和ctags
	map <F10> :call Do_CsTag()<CR>
	map <F10><F10> :call Add_CsTag()<CR>
	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
	nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
	nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>
	
    "------- QuickFix setting --
    " 按下F6，执行make clean
    "map <F6> :make clean<CR><CR><CR>
    " 按下F5，执行make编译程序，并打开quickfix窗口，显示编译信息
    "map <F5> :make<CR><CR><CR> :copen<CR><CR>
    " 按下F3，光标移到上一个错误所在的行,use unimpaired map [q
    " map <F3> :cp<CR>
    " 按下F4，光标移到下一个错误所在的行,use unimpaired map ]q 
    " map <F4> :cn<CR>
    map <F6> :cclose<CR>
    " 以上的映射是使上面的快捷键在插入模式下也能用
    "imap <F6> <ESC>:make clean<CR><CR><CR>
    "imap <F5> <ESC>:make<CR><CR><CR> :copen<CR><CR>
    "imap <F3> <ESC>:cp<CR>
    "imap <F4> <ESC>:cn<CR>
    imap <F6> <ESC>:cclose<CR>
	"nnoremap <leader>a :cclose<CR>
	"按F5运行python"
	" map <F5> :Autopep8<CR> :w<CR> :call RunPython()<CR>
	" function RunPython()
	" 	let mp = &makeprg
	" 	let ef = &errorformat
	" 	let exeFile = expand("%:t")
	" 	setlocal makeprg=python3\ -u
	" 	set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
	" 	silent make %
	" 	copen
	" 	let &makeprg = mp
	" 	let &errorformat = ef
	" endfunction
	
    " -- MiniBufferExplorer --
	let g:miniBufExplMapWindowNavVim = 1 " 按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口
	let g:miniBufExplMapWindowNavArrows = 1 " 按下Ctrl+箭头，可以切换到当前窗口的上下左右窗口
	let g:miniBufExplMapCTabSwitchBufs = 1 " 启用以下两个功能：Ctrl+tab移到下一个buffer并在当前窗口打开；Ctrl+Shift+tab移到上一个buffer并在当前窗口打开；ubuntu好像不支持
	"let g:miniBufExplMapCTabSwitchWindows = 1 " 启用以下两个功能：Ctrl+tab移到下一个窗口；Ctrl+Shift+tab移到上一个窗口；ubuntu好像不支持
	let g:miniBufExplModSelTarget = 1    " 不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer
	
	let mapleader = ","
	nmap <silent> <leader>e :edit ~/.vimrc<CR>
	nmap <silent> <leader>s :source ~/.vimrc<CR>

	"------copy file path------
	" copy current file name (relative/absolute) to system clipboard (Linux version)
	if has("gui_gtk") || has("gui_gtk2") || has("gui_gnome") || has("unix")
	" relative path (src/foo.txt)
	nnoremap <leader>cf :let @+=expand("%")<CR>

	" absolute path (/something/src/foo.txt)
	nnoremap <leader>cF :let @+=expand("%:p")<CR>

	" filename (foo.txt)
	nnoremap <leader>ct :let @+=expand("%:t")<CR>

	" directory name (/something/src)
	nnoremap <leader>ch :let @+=expand("%:p:h")<CR>
	endif
	
	"---- NERDTree -----
	"autocmd vimenter * NERDTree " 打开vim自动加载
	"map <F2> :NERDTreeToggle<CR>
	"map <C-F2> :NERDTreeFind<CR>
	nmap <leader>n :NERDTreeFind<CR>
	nmap <leader>m :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "nerdtree最后一个窗口自动关闭
	let NERDTreeShowBookmarks=1 "默认显示bookmark
	let NERDTreeShowHidden=1 "默认显示隐藏文件
	let NERDTreeQuitOnOpen=1 "打开文件时关闭树
	let NERDTreeChDirMode=2 "修改root时改变CWD目录		
	let NERDTreeHighlightCursorline=1 "高亮
	let NERDTreeIgnore = ['\.pyc$', '\~$']
	"设置tab的快捷键
	"Shift+t为跳转标签
	"map <S-t> :tabnext<CR>


	"USB and SX1257/SX1255 RF transceivers.CTRLP
	set runtimepath^=~/.vim/bundle/ctrlp.vim
	"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
	let g:ctrlp_working_path_mode = 'ra'
	let g:ctrlp_max_files = 0
	let g:ctrlp_max_depth = 40
	let g:ctrlp_mruf_max = 500
	let g:ctrlp_by_filename = 1
	nnoremap <silent> <leader>f :CtrlPMixed<CR>
	let g:ctrlp_custom_ignore = {
	  \ 'dir':  '\v[\/]\.(git|hg|svn|pc)$',
      \ 'file': '\v\.(exe|so|dll|o|cmd|swp|zip)$',
	  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
      \ }
	" Bind C-t for Clear all cache and open CtrlP
	" nnoremap <silent> <C-h> :ClearAllCtrlPCache<CR>\|:CtrlP<CR>


	" 粘贴模式，防止格式错乱
	set pastetoggle=<F2>

    " set mouse=a            " Enable mouse usage (all modes)    "使用鼠标
	set mouse=c		" command mode
	"{{{ Mouse Toggle
	let mouse_mode = 0 " 0 = c, 1 = a
	func! Mouse_on_off()
	   if g:mouse_mode == 0
	      let g:mouse_mode = 1
	      set mouse=c
	   else
	      let g:mouse_mode = 0
	      set mouse=a
	   endif
	   return
	endfunc
	"}}}
	nnoremap <C-m> :call Mouse_on_off()<CR>

	hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
	hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
	nnoremap <Leader>a :set cursorline! cursorcolumn!<CR>

	"golang vim-go
	" let g:go_disable_autoinstall = 0
	" set autowrite " writes the content of the file automatically if you call :make
	" let g:go_highlight_functions = 1
	" let g:go_highlight_methods = 1
	" let g:go_highlight_fields = 1
	" let g:go_highlight_types = 1
	" let g:go_highlight_operators = 1
	" let g:go_highlight_build_constraints = 1
	" au FileType go nmap <leader>r <Plug>(go-run)
	" au FileType go nmap <leader>b <Plug>(go-build)
	" au FileType go nmap <leader>t <Plug>(go-test)
	" au FileType go nmap <leader>c <Plug>(go-coverage)
	" au FileType go nmap <Leader>ds <Plug>(go-def-split)
	" au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
	" au FileType go nmap <Leader>dt <Plug>(go-def-tab)
	" au FileType go nmap <Leader>gd <Plug>(go-doc)
	" au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
	" au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
	" au FileType go nmap <Leader>gi <Plug>(go-info)
	" au FileType go nmap <Leader>gr <Plug>(go-rename)
	" au FileType go nmap <Leader>gp <Plug>(go-implements)
	
	"-----------YouCompleteMe
	let g:ycm_autoclose_preview_window_after_completion=1
	map <leader>jd  :YcmCompleter GoToDefinitionElseDeclaration<CR>
	let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
	let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
	" let g:ycm_key_list_stop_completion = ['<C-y>']

	"-----------UltiSnips
	" Trigger configuration. Do not use <tab> if you use
	" https://github.com/Valloric/YouCompleteMe.
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
	let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

	" If you want :UltiSnipsEdit to split your window.
	let g:UltiSnipsEditSplit="vertical"

	let g:snips_author = "heguilong"
	let g:snips_email = "hgleagle@gmail.com"
	let g:snips_github = "https://github.com/hgleagle"
	
	" "----------neocomplete
	" "Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
	" " Disable AutoComplPop.
	" let g:acp_enableAtStartup = 0
	" " Use neocomplete.
	" let g:neocomplete#enable_at_startup = 1
	" " Use smartcase.
	" let g:neocomplete#enable_smart_case = 1
	" " Set minimum syntax keyword length.
	" let g:neocomplete#sources#syntax#min_keyword_length = 3
	" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

	" " Define dictionary.
	" let g:neocomplete#sources#dictionary#dictionaries = {
	" 	\ 'default' : '',
	" 	\ 'vimshell' : $HOME.'/.vimshell_hist',
	" 	\ 'scheme' : $HOME.'/.gosh_completions'
	" 		\ }

	" " Define keyword.
	" if !exists('g:neocomplete#keyword_patterns')
	" 	let g:neocomplete#keyword_patterns = {}
	" endif
	" let g:neocomplete#keyword_patterns['default'] = '\h\w*'

	" " Plugin key-mappings.
	" inoremap <expr><C-g>     neocomplete#undo_completion()
	" inoremap <expr><C-l>     neocomplete#complete_common_string()

	" " Recommended key-mappings.
	" " <CR>: close popup and save indent.
	" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	" function! s:my_cr_function()
	"   return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
	"   " For no inserting <CR> key.
	"   "return pumvisible() ? "\<C-y>" : "\<CR>"
	" endfunction
	" " <TAB>: completion.
	" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" " <C-h>, <BS>: close popup and delete backword char.
	" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	" " Close popup by <Space>.
	" "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
	
	
	" " AutoComplPop like behavior.
	" "let g:neocomplete#enable_auto_select = 1

	" " Shell like behavior(not recommended).
	" "set completeopt+=longest
	" "let g:neocomplete#enable_auto_select = 1
	" "let g:neocomplete#disable_auto_complete = 1
	" "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

	" " Enable omni completion.
	" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

	" " Enable heavy omni completion.
	" if !exists('g:neocomplete#sources#omni#input_patterns')
	"   let g:neocomplete#sources#omni#input_patterns = {}
	" endif
	" "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
	" "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
	" "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

	" " For perlomni.vim setting.
	" " https://github.com/c9s/perlomni.vim
	" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'     


	"----------tagbar-----------------
	let g:tagbar_type_go = {
		\ 'ctagstype' : 'go',
		\ 'kinds'     : [
			\ 'p:package',
			\ 'i:imports:1',
			\ 'c:constants',
			\ 'v:variables',
			\ 't:types',
			\ 'n:interfaces',
			\ 'w:fields',
			\ 'e:embedded',
			\ 'm:methods',
			\ 'r:constructor',
			\ 'f:functions'
		\ ],
		\ 'sro' : '.',
		\ 'kind2scope' : {
			\ 't' : 'ctype',
			\ 'n' : 'ntype'
		\ },
		\ 'scope2kind' : {
			\ 'ctype' : 't',
			\ 'ntype' : 'n'
		\ },
		\ 'ctagsbin'  : 'gotags',
		\ 'ctagsargs' : '-sort -silent'
	\ }
	nmap <F8> :TagbarToggle<CR>

	"--------------syntastic

	" Syntastic {{{

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 0
	let g:syntastic_check_on_open = 0
	let g:syntastic_check_on_wq = 1
	" let g:syntastic_enable_signs = 1
	" let g:syntastic_enable_baloon = 1
	" let g:syntastic_java_checkers = ['javac']
	" let g:syntastic_python_checkers = ['flake8']
	" let g:syntastic_style_error_symbol = 'E>'
	" let g:syntastic_style_warning_symbol = 'W>'
	" let g:syntastic_mode_map = {
	" 			\ "mode": "active",
	" 			\ "active_filetypes": [],
	" 			\ "passive_filetypes": ['java', 'html', 'rst']
	" 			\ }
	" let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'

	nnoremap <leader>C :SyntasticCheck<cr>
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
	set statusline+=%{fugitive#statusline()}

	" }}}

	"---------------indentline
	let g:indentLine_enabled = 1	

	"autopep8设置"
	" let g:autopep8_disable_show_diff=1

	"auto-pairs
	" let g:AutoPairsFlyMode = 1
	" let g:AutoPairsShortcutBackInsert = 'b'
	" let g:AutoPairsShortcutToggle = ';-p'
	" let g:AutoPairsShortcutFastWrap = ';-e'
	" let g:AutoPairsShortcutJump = ';-n'
	
	" delimitMate for python docstring ", 特别有用
	au FileType python let b:delimitMate_nesting_quotes = ['"']
	" 关闭某些类型文件的自动补全
	au FileType mail let b:delimitMate_autoclose = 0

	"-----python-mode
	" Override go-to.definition key shortcut to Ctrl-]
	let g:pymode_rope_goto_definition_bind = "<C-]>"
	
	" Override run current python file key shortcut to Ctrl-Shift-e
	" let g:pymode_run_bind = "<C-S-e>"
	
	" Override view python doc key shortcut to Ctrl-Shift-d
	let g:pymode_doc_bind = "<C-S-d>"
	let g:pymode_python = 'python3'

	" Avoid conflicting with YouCompleteMe
	let g:pymode_rope_completion = 0 

	let g:powerline_pycmd = "py3"
	let g:powerline_pyeval = "py3eval"

	" Syntax Options {{{
	" let g:pymode_syntax = 1
	" let g:pymode_syntax_all = 1
	" let g:pymode_syntax_builtin_objs = 1
	" let g:pymode_syntax_print_as_function = 0
	" let g:pymode_syntax_space_errors = 0
	" }}}
	
	" Lint Options {{{
	let g:pymode_lint = 1
	let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'pep257']
	
	nnoremap <leader>L :PymodeLintAuto

	"autocmd FileType python noremap <buffer> <leader>8 :call Autopep8()<CR>

	" }}}
	
	"------- emmet
	let g:user_emmet_install_global = 0
	autocmd FileType html,css EmmetInstall

	"----color scheme
	if has('gui_running') 
		set background=dark 
		" colorscheme solarized 
		" call togglebg#map("") 
		colorscheme molokai 
	else 
		colorscheme solarized 
		" colorscheme molokai 
		" colorscheme zenburn 
	endif	

	"--------- rainbow_parentheses.vim
	let g:rbpt_colorpairs = [ ['brown', 'RoyalBlue3'], ['Darkblue', 'SeaGreen3'], ['darkgray', 'DarkOrchid3'], ['darkgreen', 'firebrick3'],['darkcyan', 'RoyalBlue3'],['darkred', 'SeaGreen3'],['darkmagenta', 'DarkOrchid3'],['brown', 'firebrick3'],['gray', 'RoyalBlue3'],['black',       'SeaGreen3'],['darkmagenta', 'DarkOrchid3'],['Darkblue',  'firebrick3'],['darkgreen', 'RoyalBlue3'],['darkcyan', 'SeaGreen3'],['darkred', 'DarkOrchid3'],['red', 'firebrick3']]
	let g:rbpt_max = 16
	"au VimEnter * RainbowParenthesesToggle
	"au Syntax * RainbowParenthesesLoadRound
	"au Syntax * RainbowParenthesesLoadSquare
	"au Syntax * RainbowParenthesesLoadBraces
	"
	"
	"------airline
	"let g:airline#extensions#tabline#enabled = 1
	"let g:airline#extensions#tabline#left_sep = ' '
	"let g:airline#extensions#tabline#left_alt_sep = '|'
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#syntastic#enabled = 1
	let g:airline_theme="deus"
