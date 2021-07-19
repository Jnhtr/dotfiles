local M = {}

M.key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end
M.keyodd = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true, expr = true})
end
function ReloadConfig()
  print('Reloading config')
  require'plenary.reload'.reload_module('plugin')
end
function M.map_lua(mode, keys, action, options)
  if options == nil then
    options = {}
  end
  vim.api.nvim_set_keymap(mode, keys, "<cmd>lua " .. action .. "<cr>", options)
end
M.blankline = function()
    vim.g.indentLine_enabled = 1
    vim.g.indent_blankline_char = "▏"

    vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
    vim.g.indent_blankline_buftype_exclude = {"terminal"}

    vim.g.indent_blankline_show_trailing_blankline_indent = false
    vim.g.indent_blankline_show_first_indent_level = false
end
return M
