:set mouse=a
:set encoding=utf-8
:set number
:set noswapfile
:set scrolloff=7

:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set autoindent
:set fileformat=unix

filetype indent on

map <C-n> :NERDTreeToggle<CR>
inoremap jk <esc>
nnoremap ,<space> :nohlsearch<CR>

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'm4xshen/autoclose.nvim'

call plug#end()

colorscheme onedark

lua << EOF
require("autoclose").setup()
EOF

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
