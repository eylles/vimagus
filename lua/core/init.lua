vim.cmd('source ~/.config/nvim/lua/core/plug-bootstrap.vim')

vim.g.mapleader = ","
vim.g.maplocalleader = "-"

require ('core.plug')
require ('core.set')
require ('core.pconf')
require ('core.conf')
