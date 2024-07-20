local Plug = vim.fn['plug#']
vim.call('plug#begin')
-- Colorscheme
--Plug('joshdick/onedark.vim')
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

-- indentation
Plug('Yggdroot/indentLine')
Plug('antoinemadec/FixCursorHold.nvim')
Plug('tzachar/local-highlight.nvim')

-- smart yanking
Plug('ibhagwan/smartyank.nvim')
Plug('gennaro-tedesco/nvim-peekup')

-- git
Plug('airblade/vim-gitgutter')
Plug('jreybert/vimagit')
Plug('henry-hsieh/riscv-asm-vim')
Plug('glepnir/hlsearch.nvim')
Plug('godlygeek/tabular')

-- filetree
Plug('nvim-tree/nvim-web-devicons') -- optional
Plug('nvim-lua/plenary.nvim')
Plug('MunifTanjim/nui.nvim')
Plug('nvim-neo-tree/neo-tree.nvim', { ['branch'] = 'v3.x'})
-- Plug('nvim-tree/nvim-tree.lua')

-- status line
Plug('nvim-lualine/lualine.nvim')
Plug('akinsho/bufferline.nvim', { ['tag'] = 'v4.6.1'})
-- Plug('willothy/nvim-cokeline', { ['tag'] = 'v0.4.0'})

-- treesitter
Plug('nvim-treesitter/nvim-treesitter', { ['tag'] = 'v0.9.2' , ['do'] = ':TSUpdate'})

-- LSP Support
Plug('neovim/nvim-lspconfig', { ['tag'] = 'v0.1.8'})
Plug('hrsh7th/cmp-nvim-lsp')

-- diagnostic lines
Plug('https://git.sr.ht/~whynothugo/lsp_lines.nvim')

-- Autocompletion
Plug('hrsh7th/nvim-cmp')
Plug('L3MON4D3/LuaSnip')
Plug('rafamadriz/friendly-snippets') -- Optional
Plug('saadparwaiz1/cmp_luasnip') -- Optional
Plug('hrsh7th/cmp-nvim-lua')     -- Optional
Plug('hrsh7th/cmp-buffer')       -- Optional
Plug('hrsh7th/cmp-path')         -- Optional
Plug('andersevenrud/cmp-tmux')
Plug('amarakon/nvim-cmp-buffer-lines')

-- lsp-zerp
Plug('VonHeikemen/lsp-zero.nvim', { branch = 'v3.x'})

-- mason
Plug('williamboman/mason.nvim')           -- Optional
Plug('williamboman/mason-lspconfig.nvim') -- Optional
vim.call('plug#end')
