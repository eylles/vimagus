---------------
-- colorizer --
---------------
require'colorizer'.setup({
  filetypes = { "*" },
  user_default_options = {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    names = true, -- "Name" codes like Blue or blue
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    AARRGGBB = true, -- 0xAARRGGBB hex codes
    rgb_fn = true, -- CSS rgb() and rgba() functions
    hsl_fn = true, -- CSS hsl() and hsla() functions
    css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    -- Available modes for `mode`: foreground, background,  virtualtext
    mode = "background", -- Set the display mode.
    -- Available methods are false / true / "normal" / "lsp" / "both"
    -- True is same as normal
    tailwind = true, -- Enable tailwind colors
    -- parsers can contain values used in |user_default_options|
    sass = { enable = true, parsers = { "css" }, }, -- Enable sass colors
    virtualtext = "■",
    -- update color values even if buffer is not focused
    -- example use: cmp_menu, cmp_docs
    always_update = false
  },
  -- all the sub-options of filetypes apply to buftypes
  buftypes = {},
})

---------------
-- smartyank --
---------------
require('smartyank').setup({
  highlight = {
    enabled = true,         -- highlight yanked text
    higroup = "IncSearch",  -- highlight group of yanked text
    timeout = 2000,         -- timeout for clearing the highlight
  },
  clipboard = {
    enabled = true
  },
  tmux = {
    enabled = true,
    -- remove `-w` to disable copy to host client's clipboard
    cmd = { 'tmux', 'set-buffer', '-w' }
  },
  osc52 = {
    enabled = true,
    -- escseq = 'tmux',     -- use tmux escape sequence, only enable if
                            -- you're using tmux and have issues (see #4)
    ssh_only = true,        -- false to OSC52 yank also in local sessions
    silent = false,         -- true to disable the "n chars copied" echo
    echo_hl = "Directory",  -- highlight group of the OSC52 echo message
  },
  -- By default copy is only triggered by "intentional yanks" where the
  -- user initiated a `y` motion (e.g. `yy`, `yiw`, etc). Set to `false`
  -- if you wish to copy indiscriminately:
  validate_yank = true,
  --
  -- For advanced customization set to a lua function returning a boolean
  -- for example, the default condition is:
  -- validate_yank = function() return vim.v.operator == "y" end,
})

--------------
-- hlsearch --
--------------
require('hlsearch').setup()

----------------
-- cursorword --
----------------
require('mini.cursorword').setup()

---------------
-- autopairs --
---------------
require("nvim-autopairs").setup()

--------------------
-- tmux navigator --
--------------------
vim.g.tmux_navigator_insert_mode = 1

-------------
-- vimwiki --
-------------
vim.g.vimwiki_list = { { path = '~/Documents/wiki', syntax = 'default', ext = '.wiki'} }
vim.g.vimwiki_table_mappings = 0
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_conceallevel = 1

-----------------
-- indentscope --
-----------------
require('mini.indentscope').setup()

---------------
-- gitgutter --
---------------
vim.g.gitgutter_enabled = 1

---------------------------------------
-- comfortable motions and animation --
---------------------------------------
require('mini.animate').setup({
  scroll = {
    timing = function(_, n) return math.min(250 / n, 5) end,
  }
})

-----------------------
-- buffer management --
-----------------------
require('mini.bufremove').setup()

----------------
-- treesitter --
----------------
require('nvim-treesitter.configs').setup({
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers",
  -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this
    -- is the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large
    -- files
    -- disable = function(lang, buf)
    --     local max_filesize = 100 * 1024 -- 100 KB
    --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --     if ok and stats and stats.size > max_filesize then
    --         return true
    --     end
    -- end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
})

--------------
-- lsp-zero --
--------------
local lsp_zero = require('lsp-zero')

-- lsp_zero.extend_lspconfig()
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup({})

---------------
-- lsp lines --
---------------
require("lsp_lines").setup()

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
})

-----------
-- mason --
-----------
-- to learn how to use mason.nvim
-- read this:
--  https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✔",
      package_pending = "●",
      package_uninstalled = "✗"
    },
    keymaps = {
      -- Keymap to expand a package
      toggle_package_expand = "<CR>",
      -- Keymap to install the package under the current cursor position
      install_package = "i",
      -- Keymap to reinstall/update the package under the current cursor position
      update_package = "u",
      -- Keymap to check for new version for the package under the current cursor position
      check_package_version = "e",
      -- Keymap to update all installed packages
      update_all_packages = "U",
      -- Keymap to check which installed packages are outdated
      check_outdated_packages = "o",
      -- Keymap to uninstall a package
      uninstall_package = "X",
      -- Keymap to cancel a package installation
      cancel_installation = "c",
      -- Keymap to apply language filter
      apply_language_filter = "F",
    },
  },
})

require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

----------------
-- completion --
----------------
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-f>']   = cmp_action.luasnip_jump_forward(),
    ['<C-b>']   = cmp_action.luasnip_jump_backward(),
    ['<C-u>']   = cmp.mapping.scroll_docs(-4),
    ['<C-d>']   = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<Tab>']   = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
    ['<S-Tab>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
  }),
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'buffer', keyword_length = 3},
    {name = 'buffer-lines'},
    {name = 'nvim_lsp_signature_help'},
    {name = 'treesitter'},
    {name = 'omni', option = { disable_omnifuncs = { 'v:lua.vim.lsp.omnifunc' }}},
    {name = 'luasnip', keyword_length = 2},
    {name = 'tmux', option = { all_panes = true, capture_history = true,}},
  }
})

--------------
-- neo-tree --
--------------
require('neo-tree').setup({
  close_if_last_window = true,
})

require('mini.pick').setup()

-------------
-- lualine --
-------------
--separators table
local separators = {
  triangle = {
    lsep="",
    rsep="",
    alsep="",
    arsep="",
  },
  round = {
    lsep="",
    rsep="",
    alsep="",
    arsep="",
  },
  slant1 = {
    lsep="",
    rsep="",
    alsep="",
    arsep="",
  },
  slant2 = {
    lsep="",
    rsep="",
    alsep="",
    arsep="",
  },
  fire = {
    lsep="",
    rsep="",
    alsep="",
    arsep="",
  },
  block = {
    lsep="",
    rsep="",
    alsep="",
    arsep="",
  },
  none = {
    lsep="",
    rsep="",
    alsep="|",
    arsep="|",
  },
}

-- get separators from config

local conf_home_dir = os.getenv('XDG_CONFIG_HOME')
if not conf_home_dir then
  conf_home_dir = os.getenv('HOME') .. '/.config'
end

local sep_conf = conf_home_dir .. '/shell/promptrc'

-- see if the file exists
local function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- this is probably inefficient since
-- it uses io instead of doing this in
-- some async manner... oh well
local function read_config(file)
  local k, v
  if not file_exists(file) then return nil end
  for line in io.lines(file) do
    k,v = line:match('^([^=]+)=(.+)$')
    if k == 'septype' then
      return v
    end
  end
end

local sept_style = read_config(sep_conf) or 'none'

sept_style = string.lower(sept_style)

if sept_style == 'classic' then sept_style = 'triangle' end

local sep_s_l = separators[sept_style]['lsep']
local sep_s_r = separators[sept_style]['rsep']
local sep_c_l = separators[sept_style]['alsep']
local sep_c_r = separators[sept_style]['arsep']

local location = function()
  return "ln:" .. "%l" .. " " .. "cl:" .. "%v"
end
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'neopywal',
    -- theme = 'auto',
    component_separators = { left = sep_c_l, right = sep_c_r},
    section_separators = { left = sep_s_l, right = sep_s_r},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {{'filename', file_status = true, path = 3}},
    lualine_x = {'searchcount','selectioncount','encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {location}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{'filename', file_status = true, path = 3}},
    lualine_x = {'filetype'},
    lualine_y = {},
    lualine_z = {location}
  },
  tabline = {
    lualine_a = {{'buffers', symbols = { alternate_file = '# ' }}},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

------------------
-- start screen --
------------------
require('mini.starter').setup()
