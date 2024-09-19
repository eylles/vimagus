local g = vim.g     -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

-- function to set autogroups easily
-- https://github.com/Th3Whit3Wolf/dots/blob/main/private_dot_config/private_nvim/private_lua/private_autocmd.lua
local function augroups(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command("augroup " .. group_name)
		vim.api.nvim_command("autocmd!")
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
			vim.api.nvim_command(command)
		end
		vim.api.nvim_command("augroup END")
	end
end

-- Define our autocommands
local autocmds = {
	--- Current window has hybrid numbers
	--- All other windows have absolute numbers
	numberToggleConditional = {
		{ "BufEnter,FocusGained,InsertLeave", "*", [[if &ft !~# 'dashboard' | set relativenumber | endif]] },
		{ "BufLeave,FocusLost,InsertEnter", "*", [[if &ft !~# 'dashboard' | set norelativenumber | endif]] },
	},
}
augroups(autocmds)


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
opt.spell = true                           -- enable spellcheck

opt.list = false          -- Show line number
opt.number = true         -- Show line number
opt.numberwidth = 2       -- number column width
opt.signcolumn = 'yes'    -- always show the sign column
opt.relativenumber = true -- Show line number
opt.showmatch = true      -- Highlight matching parenthesis

opt.cmdheight = 2         -- more space in the neovim command line for displaying messages
opt.autoread = true       -- Automatically reread the file if a change was detected outside of vim
opt.showmode = false      -- don't show mode indicator line
opt.scrolloff = 3         -- scroll offset keep context around cursor
opt.sidescrolloff = 3     -- scroll offset keep context around cursor
opt.conceallevel = 0      -- don't automatically collapse markdown and latex
opt.cursorline = true     -- enable different color for line number (or whole line) of current line
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

-- Remember last position in file
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        vim.cmd([[
      if line("'\"") > 0 && line("'\"") <= line("$") |
        exe "normal! g`\"" |
      endif
    ]])
    end,
})

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

vim.cmd('colorscheme neopywal')
