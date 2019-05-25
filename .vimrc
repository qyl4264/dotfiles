call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '.install -all' }
Plug 'junegunn/fzf.vim', {'on': []}
Plug 'morhetz/gruvbox'
Plug 'yonchu/accelerated-smooth-scroll' , { 'on': [] }
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'kien/rainbow_parentheses.vim' 

Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
"Plug 'vim-scripts/fcitx.vim'
Plug 'vim-python/python-syntax', {'for':['python']}
Plug 'easymotion/vim-easymotion', { 'on': [] }
Plug 'tpope/vim-surround', { 'on': [] }
Plug 'scrooloose/nerdcommenter', { 'on': [] }
Plug 'Xuyuanp/nerdtree-git-plugin',{ 'on': 'NERDTreeToggle' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': ['markdown']}
Plug 'jiangmiao/auto-pairs'
Plug 'skywind3000/asyncrun.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'ianva/vim-youdao-translater', { 'on': [] }
Plug 'tmhedberg/SimpylFold', { 'on': [] }
"Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'tpope/vim-repeat', { 'on': [] }
Plug 'majutsushi/tagbar', { 'on': ['TagbarToggle'] }
"Plug 'sillybun/autoformatpythonstatement', {'do': './install.sh'}
call plug#end()


call timer_start(500, 'LoadPlug')

function! LoadPlug(timer) abort
  call plug#load('vim-youdao-translater')
  call plug#load('vim-easymotion')
  call plug#load('vim-surround')
  call plug#load('nerdcommenter')
  "call plug#load('auto-pairs')
  call plug#load('accelerated-smooth-scroll')
  call plug#load('fzf.vim')
  call plug#load('vim-repeat')
  call plug#load('SimpylFold')

endfunction


" General {
    "filetype indent on 
    set laststatus=2 " 总是显示状态栏
    set nocompatible "关闭与vi的兼容模式
    set number  "显示行号
    set encoding=utf-8 "编码
    set fenc=utf-8 "编码
    "set t_Co=256 " 256 颜色
    set termguicolors
    if &term =~# '^screen'
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif

    set nobackup
    set nowritebackup
    set updatetime=100
    set cmdheight=2
    set shortmess+=c

    set ruler " 显示光标当前位置
    set backspace=2 "是回格键正常处理
    " autocmd BufWritePost $MYVIMRC source $ MYVIMRC " vimrc更改保存立即生效
    set mouse-=a
    set mousehide
    "set paste " 避免复制粘贴多余的缩进
    "set autoindent
    let python_highlight_all=1
    syntax enable
    syntax on
    set hidden "允许隐藏buffer
    set visualbell "禁止错误响铃
    set ignorecase "忽略查找大小写
    set smartcase "只能大小写
    set signcolumn=yes
    set background=dark
    set langmenu=zh_CN.UTF-8
    "set tabstop=4 " 制表符为4
    set softtabstop=4 " 统一缩进为4
    set shiftwidth=4 " 统一缩进为4
    set expandtab
    set splitbelow
    set splitright
    colorscheme gruvbox
    "set foldmethod=syntax "折叠按缩进
    "set nofoldenable " 打开文件关闭折叠
    "set foldmethod=manual
    set foldlevel=99
    
    "let g:python_host_skip_check=1
    "let g:python_host_prog = '/usr/bin/python'
    "let g:python3_host_skip_check=1
    "let g:python3_host_prog = '/usr/bin/python3'



" }
" KeyMap {
    let mapleader = ","
    nnoremap <C-J> <C-W>j
    nnoremap <C-K> <C-W>k
    nnoremap <C-L> <C-W>l
    nnoremap <C-H> <C-W>h
    
    nnoremap k gk
    nnoremap gk k
    nnoremap j gj
    nnoremap gj j


" }    

" Plugins {
    "Undotree {
        nnoremap <Leader>u :UndotreeToggle<cr>
        let g:undotree_SetFocusWhenToggle=1
        set undodir=~/.undodir/
    "}
    
    " youdao{
        vnoremap <silent> <leader>yd :<C-u>Ydv<CR>
        nnoremap <silent> <leader>yd :<C-u>Ydc<CR>
    " }
    
    " tagbar{
        nnoremap <silent> <leader>tb :TagbarToggle<CR>  
        let g:tagbar_left = 1 
        let g:tagbar_width = 30          
        let g:tagbar_compact = 1
        let g:tagbar_sort = 0         
    " }
    " markdown-preview{
        nnoremap <leader>mp :MarkdownPreview<cr>
        nnoremap <leader>mc :MarkdownPreviewStop<cr>
    " }
    "fzf {
        nnoremap <silent> <Leader>f :Files<cr>
        nnoremap <silent> <Leader>b :Buffers<cr>

        command! -bang -nargs=* Ag
        \ 
        \ call fzf#vim#ag(<q-args>,
        \                 <bang>0 ? fzf#vim#with_preview('up:60%')    
        \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
        \                 <bang>0)
        nnoremap <silent> <leader>A :Ag<cr>
    "}

    " rainbow_parentheses {
        let g:rbpt_max = 16
        let g:rbpt_loadcmd_toggle = 0
        au VimEnter * RainbowParenthesesToggle
        au Syntax * RainbowParenthesesLoadRound
        au Syntax * RainbowParenthesesLoadSquare
        au Syntax * RainbowParenthesesLoadBraces
    " }
   
    " NERDTree {
        map <C-e> :NERDTreeToggle<cr> 
        nnoremap <leader>e :NERDTreeToggle<cr>
        nnoremap <leader>ie :NERDTree %<cr>
        let NERDTreeIgnore=['\$', '\.py[cd]$', '\.sw[op]$', '^\.git$', '^\.hg$']
        let NERDTreeChDirMode=0
        autocmd bufenter * if (winnr("$") ==1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
        "let NERDTreeQuitOnOpen=1
        let NERDTreeShowLineNumbers=1
        let NERDTreeMinimalUI=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
    " }
    
    " indentline {
        let g:indentLine_char_list = ['|', '¦', '┆', '┊']
        let g:indentLine_color_term = 239
    " }
    
    "coc {
        inoremap <silent><expr> <TAB>
              \ pumvisible() ? "\<C-n>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

        let g:coc_global_extensions = ['coc-python', 'coc-snippets', 'coc-json', 
                    \ 'coc-highlight']
        

        nmap <silent> [d <Plug>(coc-diagnostic-prev)
        nmap <silent> ]d <Plug>(coc-diagnostic-next)
        "inoremap <silent><expr> <TAB>
        "\ pumvisible() ? coc#_select_confirm() :
        "\ coc#expandableOrJumpable() ? coc#rpc#request('doKeymap', ['snippets-expand-jump','']) :
        "\ <SID>check_back_space() ? <TAB>" :
        "\ coc#refresh()


        function! s:check_back_space() abort
            let col = col('.') - 1
            return !col || getline('.')[col - 1]  =~# '\s'
        endfunction

        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

        let g:coc_snippet_next = '<tab>'
        let g:coc_snippet_prev = '<S-tab>'
        "let g:coc_status_error_sign = '✘:'
        "let g:coc_status_warning_sign = '¿:'
        "let g:coc_status_error_sign = '🚫:'
        "let g:coc_status_warning_sign = '❗:'
        "🌚🌝😑😏😛😶🙃🙄😒🤐🤗🤺🤯
        let g:coc_status_error_sign = '💉:'
        let g:coc_status_warning_sign = '💊:'

        let g:coc_force_debug = 1

        " Use K to show documentation in preview window
        nnoremap <silent> K :call <SID>show_documentation()<CR>

        function! s:show_documentation()
            if (index(['vim','help'], &filetype) >= 0)
              execute 'h '.expand('<cword>')
            else
              call CocAction('doHover')
            endif
        endfunction

        " Using CocList
        " Show all diagnostics
        nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<cr>

        imap <C-l> <Plug>(coc-snippets-expand)
        nmap <leader>rn <Plug>(coc-rename)
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)
        vmap <leader>cf <Plug>(coc-format-selected)
        nmap <leader>cf <Plug>(coc-format)
        nnoremap <leader>is :<C-u>CocCommand python.sortImports<CR>
        let g:lightline = {
              \ 'colorscheme': 'gruvbox',
              \ 'active': {
              \   'left': [ [ 'mode', 'paste'  ],
              \             [ 'cocstatus', 'readonly', 'filename', 'modified'  ] ]
              \ 
              \},
              \ 'component_function': {
              \   'cocstatus': 'coc#status'
              \ 
              \},
              \ 
              \}
    "}
