local vim = vim
local utils = require'general/utils'
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
    utils.key_mapper('n', '<leader>tt',':NvimTreeToggle<CR>')
    utils.key_mapper('n', '<leader>tf',':NvimTreeFindFile<CR>')
    utils.key_mapper('n', '<leader>pp','"+p') 
    utils.key_mapper('n', '<leader>tr',':NvimTreeRefresh<CR>')
    utils.key_mapper('v', '<C-c>', '"+y')
    utils.key_mapper('n', '<leader>h', ':wincmd h<CR>')
    utils.key_mapper('n', '<leader>j', ':wincmd j<CR>')
    utils.key_mapper('n', '<leader>k', ':wincmd k<CR>')
    utils.key_mapper('n', '<leader>l', ':wincmd l<CR>')
    utils.keyodd('i', '<Tab>', 'v:lua.tab_complete()')
    utils.keyodd('s', '<Tab>', 'v:lua.tab_complete()')
    
    -- Tabs

    utils.key_mapper('n', '<leader>bn', ':BufferNext<CR>')
    utils.key_mapper('n', '<leader>bc', ':BufferClose<CR>')
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
end 


setup_mappings()
