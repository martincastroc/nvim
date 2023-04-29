return {

	{ -- Fuzzy Finder
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                              , branch = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('custom.configs.telescope')
		end,

	},
	{ -- Set Theme
		'rebelot/kanagawa.nvim',
		priority = 1000,
		config = function()
			vim.cmd.colorscheme 'kanagawa'
		end,
	},
	{ -- Set Statusline
		'nvim-lualine/lualine.nvim',
		opts = {
		options = {
			icons_enabled = true,
			theme = 'kanagawa',
			component_separators = '|',
			section_separators = '',
		},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require('custom.configs.treesitter')
		end,
	},
	{ -- Adds git releated signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		},
	},
	{
		'tpope/vim-fugitive'
	},
}
