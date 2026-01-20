local opt = vim.opt -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'                               -- Enable mouse support
opt.mousemoveevent = true
opt.swapfile = false                          -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect' -- Autocomplete options
opt.hlsearch = true                           -- highlight search results
opt.incsearch = true                          -- highlight search results
opt.ignorecase = true                         -- Ignore case letters when search
opt.smartcase = true                          -- Ignore lowercase for the whole pattern
opt.timeoutlen = 500                          -- time to wait for a mapped sequence to complete in ms
opt.updatetime = 300                          -- faster completion
opt.undofile = true                           -- enable persistent undo
opt.spell = true                              -- enable spellcheck
opt.spelllang = {"en_us", "es"}               -- languages for spell checking

opt.list = false          -- Show line number
opt.numberwidth = 2       -- number column width
opt.signcolumn = 'yes'    -- always show the sign column
opt.showmatch = true      -- Highlight matching parenthesis
opt.foldmethod = 'marker' -- Enable folding (default 'foldmarker')

opt.cmdheight = 0         -- hide cmd
opt.autoread = true       -- Automatically reread the file if a change was detected outside of vim
opt.showmode = false      -- don't show mode indicator line
opt.scrolloff = 3         -- scroll offset keep context around cursor
opt.sidescrolloff = 3     -- scroll offset keep context around cursor
opt.conceallevel = 0      -- don't automatically collapse markdown and latex
opt.cursorline = false     -- enable different color for line number (or whole line) of current line
opt.pumheight = 10        -- height of pop up menu

opt.expandtab = true      -- Use spaces instead of tabs
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.shiftwidth = 4        -- Shift 4 spaces when tab
opt.softtabstop = 4
opt.smartindent = true    -- Autoindent new lines
opt.autoindent = true     -- match previous line indent when doinng O or o

opt.wrap = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.config/vim/undodir"
opt.undofile = true

--vim.opt.hlsearch = false
--vim.opt.incsearch = true

-----------------------------------------------------------
-- ui
-----------------------------------------------------------
opt.termguicolors = true
opt.splitright = true     -- Vertical split to the right
opt.splitbelow = true     -- Horizontal split to the bottom
opt.autoread = true       -- Automatically reread the file if a change was detected outside of vim
opt.showmode = false      -- don't show mode indicator line
opt.pumheight = 10        -- height of pop up menu

opt.scrolloff = 5
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = "+1"

require("neopywal").setup({
    plugins = {
      rainbow = true,
    },
})
vim.cmd.colorscheme("neopywal")
