local Plug = vim.fn['plug#']
vim.call('plug#begin')
-- Colorscheme
Plug('RedsXDD/neopywal.nvim', { ['as'] = 'neopywal' })

-- motions
Plug('yuttie/comfortable-motion.vim')

-- table mode
Plug('dhruvasagar/vim-table-mode')

-- colorizer for colors in files
Plug('NvChad/nvim-colorizer.lua')

-- undo tree
Plug('mbbill/undotree')

-- csv shenanigans
Plug('chrisbra/csv.vim')

-- awesome integration
Plug('intrntbrn/awesomewm-vim-tmux-navigator')

-- wiki
Plug('vimwiki/vimwiki')

-- tpope goodness
Plug('tpope/vim-commentary')
Plug('tpope/vim-surround')
Plug('tpope/vim-unimpaired')
Plug('tpope/vim-repeat')
Plug('tpope/vim-git')
Plug('tpope/vim-eunuch')

-- document writing
Plug('lervag/vimtex')

-- pairs
Plug('windwp/nvim-autopairs')

-- indentation level
Plug('Yggdroot/indentLine')

-- cursor word highlight
Plug('antoinemadec/FixCursorHold.nvim')
Plug('tzachar/local-highlight.nvim')

-- smart yanking
Plug('ibhagwan/smartyank.nvim')
Plug('gennaro-tedesco/nvim-peekup')

-- git
Plug('airblade/vim-gitgutter')
Plug('jreybert/vimagit')

-- risc v asm syntax
Plug('henry-hsieh/riscv-asm-vim')

-- search highlight
Plug('glepnir/hlsearch.nvim')

-- tabulation auto align
Plug('godlygeek/tabular')

-- filetree
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-lua/plenary.nvim')
Plug('MunifTanjim/nui.nvim')
Plug('nvim-neo-tree/neo-tree.nvim', { ['branch'] = 'v3.x'})

-- status line
Plug('nvim-lualine/lualine.nvim')
Plug('akinsho/bufferline.nvim', { ['tag'] = 'v4.6.1'})

-- treesitter
Plug('nvim-treesitter/nvim-treesitter', { ['tag'] = 'v0.9.2' , ['do'] = ':TSUpdate'})

-- LSP Support
Plug('neovim/nvim-lspconfig', { ['tag'] = 'v0.1.8'})
Plug('hrsh7th/cmp-nvim-lsp')

-- Autocompletion
Plug('hrsh7th/nvim-cmp')
Plug('L3MON4D3/LuaSnip')
Plug('rafamadriz/friendly-snippets')
Plug('saadparwaiz1/cmp_luasnip')
Plug('hrsh7th/cmp-nvim-lua')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('andersevenrud/cmp-tmux')
Plug('amarakon/nvim-cmp-buffer-lines')
Plug('hrsh7th/cmp-nvim-lsp-signature-help')
Plug('ray-x/cmp-treesitter')
Plug('hrsh7th/cmp-omni')

-- lsp-zerp
Plug('VonHeikemen/lsp-zero.nvim', { branch = 'v3.x'})

-- mason
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
vim.call('plug#end')
