local cmd = vim.cmd
cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]
local packer = require'packer'
local use = packer.use
return packer.startup(function()
use 'folke/tokyonight.nvim'
use 'ntk148v/vim-horizon'
	use 'wbthomason/packer.nvim'
    use 'kyazdani42/nvim-tree.lua'
  	use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
	use 'jremmen/vim-ripgrep'
	use 'tpope/vim-sensible'
	use 'tpope/vim-surround'
	use  {'neovim/nvim-lspconfig'}
    use {
            "onsails/lspkind-nvim",
            event = "BufRead",
            config = function()
                require("lspkind").init()
            end
        }
    use "glepnir/lspsaga.nvim"
	use 'nvim-lua/lsp-status.nvim'
    use {'ms-jpq/coq_nvim',
 config = function()
      vim.g.coq_settings = {
        auto_start = 'shut-up',
      }
    end,
}
use 'ms-jpq/coq.artifacts'
    use "kabouzeid/nvim-lspinstall"
    use 'romgrk/barbar.nvim'
use 'windwp/nvim-autopairs'
    use 'lepture/vim-jinja'
	use 'nvim-lua/popup.nvim'
    use 'hrsh7th/nvim-compe'
    use "nvim-treesitter/nvim-treesitter"
    use "lukas-reineke/indent-blankline.nvim"
	use "nvim-lua/plenary.nvim"
	use "nvim-telescope/telescope.nvim"
	end
)

