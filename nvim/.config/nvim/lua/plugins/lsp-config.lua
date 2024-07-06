return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "omnisharp", "angularls", "tsserver", "lua_ls" },
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")

		lspconfig.omnisharp.setup({
			capabilities = capabilities,
		})
		lspconfig.clangd.setup({
			capabilities = capabilities,
		})
		lspconfig.angularls.setup({
			capabilities = capabilities,
		})
		lspconfig.tsserver.setup({
			capabilities = capabilities,
		})
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.html.setup({
			capabilities = capabilities
		})
		lspconfig.cssls.setup({
			capabilities = capabilities
		})
		lspconfig.pyright.setup({
			capabilities = capabilities
		})
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "[E]rrors" })
		vim.keymap.set("n", "<leader>q", vim.lsp.buf.code_action, { desc = "[Q]uick actions" })
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[G]o to [D]efinition" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]ename" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show info" })
		vim.keymap.set("n", "<leader>ff", function()
			vim.lsp.buf.format({ async = true })
		end, { desc = "[F]ormat [F]ile" })
	end,
}
