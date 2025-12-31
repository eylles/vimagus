vim.g.mapleader = ","
vim.g.maplocalleader = "-"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = "Ex commands"})

--vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
--vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z", {desc = "Join line below"})
-- vim.keymap.set('n', '<C-d>',
--   [[<Cmd>lua vim.cmd('normal! <C-d>'); MiniAnimate.execute_after('scroll', 'normal! zvzz')<CR>]]
-- )
-- vim.keymap.set('n', '<C-u>',
--   [[<Cmd>lua vim.cmd('normal! <C-u>'); MiniAnimate.execute_after('scroll', 'normal! zvzz')<CR>]]
-- )
-- vim.keymap.set("n", "n",
--   [[<Cmd>lua vim.cmd('normal! n'); MiniAnimate.execute_after('scroll', 'normal! zvzz')<CR>]]
-- )
-- vim.keymap.set("n", "N",
--   [[<Cmd>lua vim.cmd('normal! N'); MiniAnimate.execute_after('scroll', 'normal! zvzz')<CR>]]
-- )

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, {desc = "toggle undotree"})

vim.keymap.set("n", "<leader>n", '<Cmd>Neotree toggle<CR>', {desc = "toggle neotree"})

-- close buffer
-- yes this is stolen from lazyvim
vim.keymap.set("n", "<leader>bq",
  function ()
    local bd = require("mini.bufremove").delete
    if vim.bo.modified then
      local choice = vim.fn.confirm(
        ("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel"
      )
      if choice == 1 then -- Yes
        vim.cmd.write()
        bd(0)
      elseif choice == 2 then -- No
        bd(0, true)
      end
    else
      bd(0)
    end
  end,
  { desc = "close buffer" }
)


vim.keymap.set("n", "<leader>bt", "<Cmd>enew<cr>", {desc = "new Empty buffer"})

vim.keymap.set("n", "<leader>be", ":edit ", {desc = "edit file in new buffer"})

vim.keymap.set("n", "<leader>bl", "<Cmd>ls<CR>", {desc = "show all buffers"})

vim.keymap.set("n", "<Leader>l", require("lsp_lines").toggle, {desc = "toggle lsp lines"})

-- greatest remap
-- copy over highlighted
vim.keymap.set("x", "<leader>p", "\"_dp", { desc = "copy over highlighted"})

vim.keymap.set("n", "Q", "<nop>")

-- replace selected
vim.keymap.set(
  "n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "replace selected"}
)
-- make executable
vim.keymap.set(
  "n", "<leader>x", "<cmd>!chmod +x %<CR>",
  { silent = true, desc = "make script executable" }
)

-- load vimscript defined keymaps

vim.cmd('source ~/.config/nvim/lua/core/keymaps.vim')

local miniclue = require('mini.clue')
miniclue.setup({
  triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    { mode = 'n', keys = '<leader>b', desc = 'Buffers' },
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },

  window = {
    -- Delay before showing clue window
    delay = 700,
    -- Keys to scroll inside the clue window
    scroll_down = '<C-d>',
    scroll_up = '<C-u>',
  },
})
