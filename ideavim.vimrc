".ideavimrc
" .ideavimrc is a configuration file for IdeaVim plugin. It uses
"   the same commands as the original .vimrc configuration.
" You can find a list of commands here: https://jb.gg/h38q75
" Find more examples here: https://jb.gg/share-ideavimrc


"" -- Suggested options --
" Show a few lines of context around the cursor. Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
"set scrolloff=5

" Do incremental searching.
set incsearch
" ================================================================================================
" 🐧🐧🐧 Basic settings 🐧🐧🐧
" ================================================================================================

set easymotion
set ideajoin
"设置在光标距离窗口顶部或底部一定行数时，开始滚动屏幕内容的行为
set scrolloff=10
"将剪切板共通
set clipboard+=unnamed
set tabstop=4
set shiftwidth=4
set softtabstop=4
"--递增搜索功能：在执行搜索（使用 / 或 ? 命令）时，
"Vim 会在您输入搜索模式的过程中逐步匹配并高亮显示匹配的文本。
set incsearch

"--在搜索时忽略大小写
set ignorecase

"--将搜索匹配的文本高亮显示
set hlsearch

"--设置相对行号 和 当前行的绝对行号
set number relativenumber

"--设置返回normal模式时回到英文输入法
set keep-english-in-normal
set NERDTree
set surround

set commentary

" Don't use Ex mode, use Q for formatting.
map Q gq
noremap j k
noremap k j
"更改jupyter中的移动模式
"nmap k :action JupyterSelectCellBelowCommandModeAction
"nmap j :action JupyterSelectCellAboveCommandModeAction

nmap [ ^
nmap ] $
vmap [ ^
vmap ] $
"---跳转到页面顶部和底部
nmap H <action>(EditorMoveToPageTop)
nmap L <action>(EditorMoveToPageBottom)
"---快速进行行缩进
nmap > >>
nmap < <<
"-------j，k快速跳转
nmap <C-j>  5j
nmap <C-k> 5k

imap qq <Esc>

"nmap <C-`> <action>(ActivateTerminalToolWindow)
nmap <leader>` :action ActivateTerminalToolWindow<CR>
let g:WhichKeyDesc_ActivateTerminalToolWindow = "<leader>` 打开终端"
" --- Enable IdeaVim plugins https://jb.gg/ideavim-plugins

" Highlight copied text

Plug 'machakann/vim-highlightedyank'
" Commentary plugin
Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'


"" -- Map IDE actions to IdeaVim -- https://jb.gg/abva4t
"" Map \r to the Reformat Code action
"map \r <Action>(ReformatCode)

"" Map <leader>d to start debug
"map <leader>d <Action>(Debug)

"" Map \b to toggle the breakpoint on the current line
"map \b <Action>(ToggleLineBreakpoint)
" ================================================================================================
" = Leader Keymaps =====================================
" ================================================================================================
" leaderkey
let mapleader=" "

"-----回退功能
nnoremap gb :action Back<CR>
let g:WhichKeyDesc_Back= "gb 回退"
nnoremap <leader>gb :action JumpToLastChange<CR>
let g:WhichKeyDesc_JumpToLastChange= "<leader>gb 回退到上一改动"
"======调试设置
"添加断点,打上断点或取消断点
nnoremap tb :action ToggleLineBreakpoint<CR>
let g:WhichKeyDesc_ToggleLineBreakpoint= "tb 移除所有断点"
" 取消所有的断点
nnoremap <leader>rb :action Debugger.RemoveAllBreakpointsInFile<CR>
let g:WhichKeyDesc_RemoveAllBreakpointsInFile= "<leader>rb 移除所有断点"

书签管理
" bookmark 切换书签
nmap <leader>m :action ToggleBookmark<CR>
let g:WhichKeyDesc_bookmark = "<leader>m 书签"
" 显示书签
nmap <leader>sm :action ShowBookmarks<CR>
let g:WhichKeyDesc_ShowBookmarks = "<leader>sm 显示书签"
"打开断点和书签窗口
nmap <leader>mw :action ActivateBookmarksToolWindow<CR>
let g:WhichKeyDesc_ActivateBookmarksToolWindow = "<leader>mw 打开书签和断点窗口"

" Map <leader>d to start debug
map <leader>d <Action>(Debug)
"这一行为在按下<leader>后显示的,甭管就行
let g:WhichKeyDesc_LeaderKeymap= "<leader>"
set which-key
set notimeout

" idea智能提示
nnoremap <leader>si :action ShowIntentionActions<CR>
let g:WhichKeyDesc_ShowIntentionActions = "<leader>si idea智能提示"
" 显示错误描述
nnoremap <leader>se :action ShowErrorDescription<CR>
let g:WhichKeyDesc_ShowErrorDescription = "<leader>se 显示错误描述"
" 弹出参数信息(打类的时候有奇效)
nnoremap <leader>ap :action ParameterInfo<CR>
" 跳转到下一个错误
nnoremap ge :action GotoNextError<CR>
let g:WhichKeyDesc_GotoNextError = "ge 跳转到下一个错误或警告"
" 跳转上一个错误
nnoremap gp :action GotoPreviousError<CR>
let g:WhichKeyDesc_GotoPreviousError = "gp 跳转到上一个错误或警告"

" open NERDTree
nnoremap <leader>e :NERDTree<CR>
" close NERDTree
nnoremap Q :NERDTreeClose<CR>
" 弹出文件结构信息(相当于显示大纲)
"nnoremap <leader>o mm`m:action FileStructurePopup<CR>
"======查看、跳转设置
"查找
nnoremap <C-F> :action Find<CR>
vnoremap <C-F> :action Find<CR>
    " 当前文件搜索，取消原vim功能：向下翻1页。
    " 没有vim的/健方便，但可以搜索组合词和中文，vim只能搜索独立的英文单词。
nnoremap <A-F> :action FindInPath<CR>
vnoremap <A-F> :action FindInPath<CR>
    " 全局分类搜索
"aceaction
nnoremap <leader><leader>s :action AceAction<CR>
" 全局搜索 goto
"nnoremap <Leader>ge :action SearchEverywhere<CR>
    " 搜索任何位置，idea已有快捷方式：连续双击shift健
"nnoremap <Leader>gc :action GotoClass<CR>
    " 打开 类   跳转对话框
"nnoremap <Leader>gf :action GotoFile<CR>
    " 打开 文件 跳转对话框
"nnoremap <Leader>ga :action GotoAction<CR>
    " 打开 动作 跳转对话框
nnoremap <Leader>fs :action FileStructurePopup<CR>
let g:WhichKeyDesc_FileStructurePopup = "<leader>fs 查看大纲"
    " 弹出变量结构信息
    "显示函数定义
nnoremap sh :action ShowHoverInfo<CR>
let g:WhichKeyDesc_ShowHoverInfo = "sh 显示函数定义"
    "查找用法
nnoremap <leader>fu :action FindUsages<CR>
let g:WhichKeyDesc_FindUsages = "<leader>fu 查找用法"
"查找之后隐藏
nnoremap <leader>cw :action HideActiveWindow<CR>
let g:WhichKeyDesc_HideActiveWindow = "<leader>cw hideWindow"
"跳转到实现
nnoremap gi mm`m:action GotoImplementation<CR>
let g:WhichKeyDesc_GotoImplementation= "gi 跳转到实现"
"相当于鼠标右键
nnoremap <leader>sp :action ShowPopupMenu<CR>
let g:WhichKeyDesc_ShowPopupMenu= "<leader>sp 右键"
"======分页设置
"--在普通和插入模式下，向下交换行/向上交换行
nnoremap <leader><C-j> :m +1<CR>
nnoremap <leader><C-k> :m -2<CR>
"inoremap <leader><C-j> <Esc> :m +1<CR>gi
xnoremap <leader><C-j> :m '>+1<cr>gv=gv
"inoremap <leader><C-k> <Esc> :m -2<CR>gi
xnoremap <leader><C-k> :m '<-2<cr>gv=gv

nnoremap <leader>gm :action Git.Menu<CR>
let g:WhichKeyDesc_Git.Menu= "<leader>gm git界面"
