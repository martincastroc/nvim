vim.pack.add({
    "https://www.github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
    {
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
})
require("mason").setup({})

vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = "Show line diagnostics" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', function()
    vim.diagnostic.setloclist({ open = true })
end, { desc = "Open diagnostics list"})

----------
-- Diagnostic
----------
vim.diagnostic.config({
	virtual_text = { prefix = "●", spacing = 4 },
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
		focusable = false,
		style = "minimal",
	},
})

----------
-- Completion
----------
require("blink.cmp").setup({
	keymap = {
		preset = "none",
		["<C-Space>"] = { "show", "hide" },
		["<CR>"] = { "accept", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
	},
	appearance = { nerd_font_variant = "mono" },
	completion = { menu = { auto_show = true } },
	sources = { default = { "lsp", "path", "buffer"} },
	fuzzy = {
		implementation = "prefer_rust",
		prebuilt_binaries = { download = true },
	},
})
vim.lsp.config["*"] = {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
}

----------
-- LSP
----------
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then
            return
        end

        local bufnr = event.buf
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- these will be buffer-local keybindings
        -- because they only work if you have an active language server

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', 'rn', vim.lsp.buf.rename, opts)
        -- vim.keymap.set({'n', 'x'}, '<F2>', vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, opts)

        -- New
        vim.keymap.set("n", "<leader>fd", function()
            require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
        end, opts)
        vim.keymap.set("n", "<leader>fr", function()
            require("fzf-lua").lsp_references()
        end, opts)
        vim.keymap.set("n", "<leader>ft", function()
            require("fzf-lua").lsp_typedefs()
        end, opts)
        vim.keymap.set("n", "<leader>fs", function()
            require("fzf-lua").lsp_document_symbols()
        end, opts)
        vim.keymap.set("n", "<leader>fw", function()
            require("fzf-lua").lsp_workspace_symbols()
        end, opts)
        vim.keymap.set("n", "<leader>fi", function()
            require("fzf-lua").lsp_implementations()
        end, opts)

        if client:supports_method("textDocument/codeAction", bufnr) then
		vim.keymap.set("n", "<leader>oi", function()
			vim.lsp.buf.code_action({
				context = { only = { "source.organizeImports" }, diagnostics = {} },
				apply = true,
				bufnr = bufnr,
			})
			vim.defer_fn(function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end, 50)
		end, opts)
    end
end
})


-- TO ADD NEW LANGUAGES:
-- 1. add a config for the lsp ( can be {} to use defaults?)
-- 2. add it  to the vim.lsp.enable() call

vim.lsp.config("pyright", {})
vim.lsp.config("bash_ls", {})
vim.lsp.config("ts_ls", {})

vim.lsp.enable({
    "pyright",
    "ts_ls",
    "bashls",
})
