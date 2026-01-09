------------------------------
-- for other configurations --
------------------------------

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
