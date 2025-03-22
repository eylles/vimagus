vim.g.mapleader = " "
vim.g.maplocalleader = "-"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
--vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set('n', '<C-d>',
  [[<Cmd>lua vim.cmd('normal! <C-d>'); MiniAnimate.execute_after('scroll', 'normal! zvzz')<CR>]]
)
vim.keymap.set('n', '<C-u>',
  [[<Cmd>lua vim.cmd('normal! <C-u>'); MiniAnimate.execute_after('scroll', 'normal! zvzz')<CR>]]
)
vim.keymap.set("n", "n",
  [[<Cmd>lua vim.cmd('normal! n'); MiniAnimate.execute_after('scroll', 'normal! zvzz')<CR>]]
)
vim.keymap.set("n", "N",
  [[<Cmd>lua vim.cmd('normal! N'); MiniAnimate.execute_after('scroll', 'normal! zvzz')<CR>]]
)

-- nnoremap <leader>u :UndotreeToggle<CR>
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- nnoremap <leader>u :NvimTreeToggle<CR>
vim.keymap.set("n", "<leader>n", '<Cmd>Neotree toggle<CR>')

-- close buffer
-- yes this is stolen from lazyvim
vim.keymap.set("n", "<leader>bq",
  function ()
    local bd = require("mini.bufremove").delete
    if vim.bo.modified then
      local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
      if choice == 1 then -- Yes
        vim.cmd.write()
        bd(0)
      elseif choice == 2 then -- No
        bd(0, true)
      end
    else
      bd(0)
    end
  end
)

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
