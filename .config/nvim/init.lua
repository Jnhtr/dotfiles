local vim = vim
vim.cmd 'highlight LspDiagnosticsUnderlineError guisp=#db4b4b gui=undercurl,bold  cterm=bold,undercurl'
vim.g.mapleader = ' ' 
vim.cmd[[colorscheme horizon]]
vim.cmd 'au ColorScheme * hi! Normal guibg=NONE'
vim.cmd 'au ColorScheme * hi! SignColumn guibg=NONE'
vim.cmd 'au ColorScheme * hi! LineNr guibg=NONE'
vim.cmd 'au ColorScheme * hi! CursorLineNr guibg=NONE'
local o = vim.o
local g = vim.g
local bo = vim.bo
local wo = vim.wo
o.termguicolors = true
o.syntax = 'on'
o.errorbells = true
o.smartcase = true
o.showmode = false
bo.swapfile = false
o.backup = false
o.undodir = vim.fn.stdpath('config') .. '/undodir'
o.undofile = true
o.incsearch = true
o.hidden = true
bo.autoindent = true
bo.smartindent = true
o.completeopt = "menuone,noselect"
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.scrolloff = 7
o.expandtab = true
o.cmdheight = 1
o.foldlevelstart = 99
wo.number = true -- display line numbers
wo.relativenumber = true -- display relative line numbers
wo.signcolumn = 'yes'
wo.wrap = true 
o.syntax = 'on'
require'plugins/treesitter'
require 'plugins/saga'
require'plugins/plugins'
require'general/utils'
require("general/utils").blankline()
require'general/mappings'
require'plugins/lualine'
require'lspconfig'
require'lsp/lsp'
require'plugins/completion'
require'plugins/nvim-tree'
require'plugins/autopairs'
