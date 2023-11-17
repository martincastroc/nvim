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
        'sainnhe/gruvbox-material',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd [[ set background=dark ]]
            vim.cmd.colorscheme 'gruvbox-material'
        end,
	},
	{ -- Set Statusline
        'nvim-lualine/lualine.nvim',
        dependencies = {'kyazdani42/nvim-web-devicons'},
        config = function ()
            require('custom.configs.lualine')
        end,
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
    {
        'nvim-treesitter/nvim-treesitter-context'
    },
	{ -- Adds git releated signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		},
	},
	{ -- Git Integration
		'tpope/vim-fugitive',
		config = function()
			require('custom.configs.fugitive')
		end,
	},
	{ -- LSP Setup
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
			'williamboman/mason.nvim',
			build = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
		},
		config = function()
			require('custom.configs.lsp')
		end,
	},
    { -- Automatically complete differet parenthesis and quotes, integreted with nvim-cmp
        "windwp/nvim-autopairs",
        config = function ()
            require('custom.configs.autopairs')
        end,
    },
}
