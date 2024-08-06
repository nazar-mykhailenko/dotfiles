local function setMapsOnAttach(client, buffer)
	vim.keymap.set("n", "<leader>oht", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
	end, { desc = "[O]ther: Inlay [H]ints [T]oggle" })
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "[E]rrors", buffer = buffer })
	vim.keymap.set("n", "<leader>q", vim.lsp.buf.code_action, { desc = "[Q]uick actions", buffer = buffer })
	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[G]o to [D]efinition", buffer = buffer })
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]ename", buffer = buffer })
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show info", buffer = buffer })
	vim.keymap.set("n", "<leader>ff", function()
		vim.lsp.buf.format({ async = true })
	end, { desc = "[F]ormat [F]ile", buffer = buffer })
	--- Guard against servers without the signatureHelper capability
	if client.server_capabilities.signatureHelpProvider then
		require("lsp-overloads").setup(client, {})
	end
end

local function onAttach(client, buffer)
	setMapsOnAttach(client, buffer)
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"Issafalcon/lsp-overloads.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"omnisharp",
				"angularls",
				"tsserver",
				"lua_ls",
				"stylua",
				"prettier",
				"csharpier",
				"clangd",
				"emmet_language_server",
				"html",
				"cssls",
				"dockerls",
				"docker_compose_language_service",
				"eslint_d",
			},
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")

		lspconfig.omnisharp.setup({
			capabilities = capabilities,
			on_attach = onAttach,
			settings = {
				FormattingOptions = {
					EnableEditorConfigSupport = true,
					OrganizeImports = true,
				},
				RoslynExtensionsOptions = {
					EnableAnalyzersSupport = true,
					EnableImportCompletion = true,
				},
			},
		})
		lspconfig.dockerls.setup({
			capabilities = capabilities,
			on_attach = onAttach,
		})
		lspconfig.docker_compose_language_service.setup({
			capabilities = capabilities,
			on_attach = onAttach,
		})
		lspconfig.clangd.setup({
			capabilities = capabilities,
			on_attach = onAttach,
		})
		lspconfig.angularls.setup({
			capabilities = capabilities,
			on_attach = onAttach,
		})
		lspconfig.tsserver.setup({
			capabilities = capabilities,
			on_attach = onAttach,
		})
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = onAttach,
		})
		lspconfig.html.setup({
			capabilities = capabilities,
			on_attach = onAttach,
		})
		lspconfig.cssls.setup({
			capabilities = capabilities,
			on_attach = onAttach,
		})
		lspconfig.pyright.setup({
			capabilities = capabilities,
			on_attach = onAttach,
		})
		lspconfig.html.setup({
			capabilities = capabilities,
			on_attach = onAttach,
		})
		lspconfig.cssls.setup({
			capabilities = capabilities,
			on_attach = onAttach,
		})
		lspconfig.emmet_language_server.setup({
			capabilities = capabilities,
			on_attach = onAttach,
		})
	end,
}
