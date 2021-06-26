local vim = vim
local utils = require'cruinn.utils'
local setup_mappings = function()
    --movement
    utils.key_mapper('i', '<up>', '<nop>')
    utils.key_mapper('i', '<down>', '<nop>')
    utils.key_mapper('i', '<left>', '<nop>')
    utils.key_mapper('i', '<right>', '<nop>')
    utils.key_mapper('v', '<up>', '<nop>')
    utils.key_mapper('v', '<down>', '<nop>')
    utils.key_mapper('v', '<left>', '<nop>')
    utils.key_mapper('v', '<right>', '<nop>')
    utils.key_mapper('n', '<leader>ne', ':NERDTreeToggle<CR>')
    utils.key_mapper('v', '<C-c>', '"+y')
    utils.key_mapper('n', '<leader>h', ':wincmd h<CR>')
    utils.key_mapper('n', '<leader>j', ':wincmd j<CR>')
    utils.key_mapper('n', '<leader>k', ':wincmd k<CR>')
    utils.key_mapper('n', '<leader>l', ':wincmd l<CR>')
    utils.key_mapper('n', '<tab>', 'UltiSnipsExpandTrigger' )
    -- Tabs
    utils.key_mapper('n', '<leader>tn', ':BufferNext<CR>')
    utils.key_mapper('n', '<A-1>', ':BufferGoto 1<CR>')
    utils.key_mapper('n', '<A-2>', ':BufferGoto 2<CR>')
    utils.key_mapper('n', '<A-3>', ':BufferGoto 3<CR>')
    utils.key_mapper('n', '<A-4>', ':BufferGoto 4<CR>')
    utils.key_mapper('n', '<A-5>', ':BufferGoto 5<CR>')
    utils.key_mapper('n', '<A-6>', ':BufferGoto 6<CR>')
    utils.key_mapper('n', '<A-7>', ':BufferGoto 7<CR>')
    utils.key_mapper('n', '<A-8>', ':BufferGoto 8<CR>')
    -- Telescope
    utils.key_mapper('n', '<leader>ff', ':Telescope find_files<CR>')
    utils.key_mapper('n', '<leader>fg', ':Telescope live_grep<CR>')
    -- Diagnostics
    utils.key_mapper('n', '<leader>dn', ':lua vim.lsp.diagnostic.goto_next()<CR>')
    utils.key_mapper('n', '<leader>dp', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
    utils.key_mapper('n', '<leader>ds', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
    utils.key_mapper('n', '<silent><expr><C-Space>', 'compe#complete()')
    utils.key_mapper('n', '<silent><expr><CR>', 'compe#confirm(<CR>)')
    utils.key_mapper('n', '<silent><expr><C-e>', 'compe#close(<C-e>)')
    vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': +4 })", { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({ 'delta': -4 })", { silent = true, expr = true })
end




setup_mappings()
