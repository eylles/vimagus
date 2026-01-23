local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug('junegunn/vim-plug')

-- Colorscheme
Plug('RedsXDD/neopywal.nvim', { ['branch'] = 'master', ['as'] = 'neopywal' })

-- mini.nvim
Plug('nvim-mini/mini.nvim', { ['branch'] = 'stable' })

-- table mode
Plug('dhruvasagar/vim-table-mode')

-- colorizer for colors in files
Plug('NvChad/nvim-colorizer.lua')

-- rainbow delimiters
Plug('HiPhish/rainbow-delimiters.nvim')

-- undo tree
Plug('mbbill/undotree')

-- csv shenanigans
Plug('chrisbra/csv.vim')

-- awesome integration
Plug('intrntbrn/awesomewm-vim-tmux-navigator')

-- wiki
Plug('mattn/calendar-vim')
Plug('vimwiki/vimwiki')

-- tpope goodness
Plug('tpope/vim-repeat')
Plug('tpope/vim-git')
Plug('tpope/vim-eunuch')

-- document writing
Plug('lervag/vimtex')

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

Plug('folke/noice.nvim')

-- status line
Plug('nvim-lualine/lualine.nvim')

-- treesitter
Plug('nvim-treesitter/nvim-treesitter', { ['tag'] = 'v0.9.3' , ['do'] = ':TSUpdate'})

-- LSP Support
Plug('neovim/nvim-lspconfig', { ['tag'] = 'v2.0.0'})

-- diagnostic lines
Plug('https://git.sr.ht/~whynothugo/lsp_lines.nvim')

-- Autocompletion
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/nvim-cmp')
Plug('saadparwaiz1/cmp_luasnip')
Plug('hrsh7th/cmp-nvim-lua')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('andersevenrud/cmp-tmux')
Plug('amarakon/nvim-cmp-buffer-lines')
Plug('hrsh7th/cmp-nvim-lsp-signature-help')
Plug('ray-x/cmp-treesitter')
Plug('hrsh7th/cmp-omni')
Plug('onsails/lspkind.nvim')
Plug('L3MON4D3/LuaSnip')
Plug('rafamadriz/friendly-snippets')

-- lsp-zerp
Plug('VonHeikemen/lsp-zero.nvim', { ['branch'] = 'v3.x'})

-- mason
Plug('williamboman/mason.nvim', { ['tag'] = 'v1.11.0'})
Plug('williamboman/mason-lspconfig.nvim', { ['tag'] = 'v1.32.0'})
vim.call('plug#end')
