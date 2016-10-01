    "this line should not be removed as it ensures that various options are
    " properly set to work with the Vim-related packages available in Debian.
    "debian.vim

    " Uncomment the next line to make Vim more Vi-compatible
    " NOTE: debian.vim sets 'nocompatible'. Setting 'compatible' changes numerous
    " options, so any other options should be set AFTER setting 'compatible'.
    set nocompatible

	"--pathogen插件管理--
	call pathogen#infect()
	call pathogen#helptags()

    " Vim5 and later versions support syntax highlighting. Uncommenting the
    " following enables syntax highlighting by default.
    if has("syntax")
      syntax on            " 语法高亮
    endif
    colorscheme ron        " elflord ron peachpuff default 设置配色方案，vim自带的配色方案保存在/usr/share/vim/vim72/colors目录下

    " detect file type
    filetype on
    filetype plugin on

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


	"-- omnicppcomplete setting --
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

	"--ctags setting--
	"" 按下F5重新生成tag文件，并更新taglist
	"map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
	"imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
	set tags=tags
	set tags+=./tags "add current directory's generated tags file
	set tags+=~/openwrt/ap120-h/ "add new tags file(刚刚生成tags的路径，在ctags -R 生成tags文件后，不要将tags移动到别的目录，否则ctrl+］时，会提示找不到源码文件)
	
	"-- Cscope setting --
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
	
    "------- QuickFix setting --
    " 按下F6，执行make clean
    map <F6> :make clean<CR><CR><CR>
    " 按下F2，执行make编译程序，并打开quickfix窗口，显示编译信息
    map <F2> :make<CR><CR><CR> :copen<CR><CR>
    " 按下F3，光标移到上一个错误所在的行
    map <F3> :cp<CR>
    " 按下F4，光标移到下一个错误所在的行
    map <F4> :cn<CR>
    " 以上的映射是使上面的快捷键在插入模式下也能用
    imap <F6> <ESC>:make clean<CR><CR><CR>
    imap <F2> <ESC>:make<CR><CR><CR> :copen<CR><CR>
    imap <F3> <ESC>:cp<CR>
    imap <F4> <ESC>:cn<CR>
	
    "-----fold setting--
    set foldmethod=syntax " 用语法高亮来定义折叠
    set foldlevel=100 " 启动vim时不要自动折叠代码
    set foldcolumn=5 " 设置折叠栏宽度
	
    " -- MiniBufferExplorer --
    let g:miniBufExplMapWindowNavVim = 1 " 按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口
    let g:miniBufExplMapWindowNavArrows = 1 " 按下Ctrl+箭头，可以切换到当前窗口的上下左右窗口
    let g:miniBufExplMapCTabSwitchBufs = 1 " 启用以下两个功能：Ctrl+tab移到下一个buffer并在当前窗口打开；Ctrl+Shift+tab移到上一个buffer并在当前窗口打开；ubuntu好像不支持
    "let g:miniBufExplMapCTabSwitchWindows = 1 " 启用以下两个功能：Ctrl+tab移到下一个窗口；Ctrl+Shift+tab移到上一个窗口；ubuntu好像不支持
    let g:miniBufExplModSelTarget = 1    " 不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer
	
	"---- NERDTree -----
	autocmd vimenter * NERDTree " 打开vim自动加载
	"map <F2> :NERDTreeToggle<CR>
	"map <C-F2> :NERDTreeFind<CR>
	nmap ,n :NERDTreeFind<CR>
	nmap ,m :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "nerdtree最后一个窗口自动关闭
	let NERDTreeShowBookmarks=1 "默认显示bookmark
	let NERDTreeShowHidden=1 "默认显示隐藏文件
	let NERDTreeQuitOnOpen=1 "打开文件时关闭树
	let NERDTreeChDirMode=2 "修改root时改变CWD目录		
	let NERDTreeHighlightCursorline=1 "高亮
	"设置tab的快捷键
	"Shift+t为跳转标签
	"map <S-t> :tabnext<CR>

	"显示tab符号
	"set list
	set listchars=tab:>-,trail:-

	let mapleader = ","

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

	nmap <silent> <leader>e :edit ~/.vimrc<CR>
	nmap <silent> <leader>s :source ~/.vimrc<CR>
	set scrolloff=18	"光标距离顶端18行移动屏幕
	"强行写入
	cnoremap w!! w !sudo tee >/dev/null % 
	"如上设置是vim可以识别utf-8和gbk的文件
	set encoding=utf-8
	set tenc=utf-8
	set fileencodings=utf-8,cp936 
	" 当遇到没有行号的行时，gj/gk命令会使光标按虚拟行移动，而当遇到有行号的行时，光标则按物理行移动,和相对行号匹配
	noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
	noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

	" 粘贴模式，防止格式错乱
	set pastetoggle=<f11>

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
