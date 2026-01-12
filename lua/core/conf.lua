------------------------------
-- for other configurations --
------------------------------

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
    {
      "BufEnter,FocusGained,InsertLeave", "*",
      [[if &ft !~# 'dashboard' | set relativenumber | endif]]
    },
    {
      "BufLeave,FocusLost,InsertEnter", "*",
      [[if &ft !~# 'dashboard' | set norelativenumber | endif]]
    },
  },
}
augroups(autocmds)

----------------------
-- highlight tweaks --
----------------------
vim.api.nvim_create_autocmd({"VimEnter", "ColorScheme"}, {
  group = vim.api.nvim_create_augroup('ColorTweaks', {}),
  pattern = "*",
  callback = function()
    local hl
    hl = vim.print(vim.api.nvim_get_hl(0, { name = "Visual"}))
    if hl then
      hl.underline = true
      hl.bold = true
      vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", hl)
    end
    hl = vim.print(vim.api.nvim_get_hl(0, { name = "Cursor"}))
    if hl then
      vim.api.nvim_set_hl(0, "CurSearch", hl)
      vim.api.nvim_set_hl(0, "MiniCursorword", hl)
    end
  end
})

-------------------------
-- auto resize cmdline --
-------------------------
vim.api.nvim_create_autocmd({ 'CmdlineEnter', "CmdlineLeave" }, {
  group = vim.api.nvim_create_augroup("cmdline-auto-hide", { clear = true }),
  callback = function(args)
    local target_height = args.event == 'CmdlineEnter' and 1 or 0
    if vim.opt_local.cmdheight:get() ~= target_height then
      vim.opt_local.cmdheight = target_height
      vim.cmd.redrawstatus()
    end
  end,
})

------------------------------------
-- Remember last position in file --
------------------------------------
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        vim.cmd([[
      if line("'\"") > 0 && line("'\"") <= line("$") |
        exe "normal! g`\"" |
      endif
    ]])
    end,
})

