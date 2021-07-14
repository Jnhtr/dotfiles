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
return M
