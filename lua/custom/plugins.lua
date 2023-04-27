return {

	{
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
			icons_enabled = false,
			theme = 'kanagawa',
			component_separators = '|',
			section_separators = '',
		},
		},
	},

}
