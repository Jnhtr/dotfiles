    local vim = vim

vim.cmd('packadd packer.nvim')
local util = require'packer.util'
local packer = require'packer'
local execute = vim.api.nvim_command
local fn = vim.fn
local use = packer.use
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end


return packer.startup(function()
	use { 'wbthomason/packer.nvim', opt = true }
	use 'tiagofumo/vim-nerdtree-syntax-highlight'
	use 'preservim/nerdcommenter'
        use {
            "kyazdani42/nvim-tree.lua",
            cmd = "NvimTreeToggle",
            config = function()
                require("nvim-tree").config()
            end
        }
	use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
	use 'jremmen/vim-ripgrep'
	use 'tpope/vim-sensible'
	use 'tpope/vim-surround'
	use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
	use 'nvim-lua/lsp-status.nvim'
	use 'anott03/nvim-lspinstall'
    use 'romgrk/barbar.nvim'
    use 'lepture/vim-jinja'
	use 'nvim-lua/popup.nvim'
	use 'nvim-treesitter/nvim-treesitter'
    use 'hrsh7th/nvim-compe'
use "lukas-reineke/indent-blankline.nvim"
	use "nvim-lua/plenary.nvim"
	use "nvim-telescope/telescope.nvim"
	use {'prettier/vim-prettier', run = 'npm install' }
	end
)
