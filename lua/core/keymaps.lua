vim.g.mapleader = " "
vim.g.maplocalleader = "-"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
--vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- nnoremap <leader>u :UndotreeToggle<CR>
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- nnoremap <leader>u :NvimTreeToggle<CR>
vim.keymap.set("n", "<leader>n", '<Cmd>Neotree toggle<CR>')

-- greatest remap
-- copy over highlighted
vim.keymap.set("x", "<leader>p", "\"_dp")

vim.keymap.set("n", "Q", "<nop>")

-- replace selected
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- make executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- load vimscript defined keymaps

vim.cmd('source ~/.config/nvim/lua/core/keymaps.vim')
