require'cruinn.treesitter'
require'cruinn.plugins'
require'cruinn.mappings'
require'cruinn.lsp'
require'cruinn.lualine'
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    tags = true;
    treesitter = true;
    nvim_lsp = true;
    spell = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}
