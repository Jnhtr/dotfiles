require('nvim-autopairs').setup()
require("nvim-autopairs.completion.compe").setup({
enable_check_bracket_line = false,
  map_cr = true, --  map <CR> on insert mode
  map_complete = true -- it will auto insert `(` after select function or method item
})
