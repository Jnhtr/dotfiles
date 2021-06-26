local vim = vim

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'

return packer.startup(function()
	local use = use
	use { 'wbthomason/packer.nvim', opt = true }
	use 'Xuyuanp/nerdtree-git-plugin'
   	use 'preservim/NERDTree'
	use 'jistr/vim-nerdtree-tabs'
	use 'tiagofumo/vim-nerdtree-syntax-highlight'
	use 'preservim/nerdcommenter'
	use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
	use 'jremmen/vim-ripgrep'
	use 'tpope/vim-sensible'
	use 'tpope/vim-surround'
	use 'neovim/nvim-lspconfig'
	use 'nvim-lua/lsp-status.nvim'
	use 'anott03/nvim-lspinstall'
    use 'romgrk/barbar.nvim'
    use 'lepture/vim-jinja'
	use 'nvim-lua/popup.nvim'
	use 'hrsh7th/nvim-compe'
	use 'SirVer/ultisnips'
	use 'honza/vim-snippets'
	use 'nvim-treesitter/nvim-treesitter'
	use "nvim-lua/plenary.nvim"
	use "nvim-telescope/telescope.nvim"
	use {'prettier/vim-prettier', run = 'npm install' }
	end
)
