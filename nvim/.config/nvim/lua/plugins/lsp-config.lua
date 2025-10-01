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
				"ts_ls",
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
			},
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		vim.lsp.config('omnisharp', {
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
		vim.lsp.enable('omnisharp')
		vim.lsp.config('dockerls',{
			capabilities = capabilities,
			on_attach = onAttach,
		})
		vim.lsp.enable('dockerls')
		vim.lsp.config('docker_compose_language_service',{
			capabilities = capabilities,
			on_attach = onAttach,
		})
		vim.lsp.enable('docker_compose_language_service')
		vim.lsp.config('clangd',{
			capabilities = capabilities,
			on_attach = onAttach,
		})
		vim.lsp.enable('clangd')
		vim.lsp.config('angularls',{
			capabilities = capabilities,
			on_attach = onAttach,
		})
		vim.lsp.enable('angularls')
		vim.lsp.config('ts_ls',{
			capabilities = capabilities,
			on_attach = onAttach,
		})
		vim.lsp.enable('ts_ls')
		vim.lsp.config('lua_ls',{
			capabilities = capabilities,
			on_attach = onAttach,
		})
		vim.lsp.enable('lua_ls')
		vim.lsp.config('html',{
			capabilities = capabilities,
			on_attach = onAttach,
		})
		vim.lsp.enable('html')
		vim.lsp.config('cssls',{
			capabilities = capabilities,
			on_attach = onAttach,
		})
		vim.lsp.enable('cssls')
		vim.lsp.config('pyright',{
			capabilities = capabilities,
			on_attach = onAttach,
		})
		vim.lsp.enable('pyright')
		vim.lsp.config('html',{
			capabilities = capabilities,
			on_attach = onAttach,
		})
		vim.lsp.enable('html')
		vim.lsp.config('cssls',{
			capabilities = capabilities,
			on_attach = onAttach,
		})
		vim.lsp.enable('cssls')
		vim.lsp.config('emmet_language_server',{
			capabilities = capabilities,
			on_attach = onAttach,
		})
		vim.lsp.enable('emmet_language_server')
		vim.lsp.config("racket_langserver", {
			-- cmd = { 'racket', '-l', 'racket-langserver'},
			-- filetypes = { 'rkt' },
			capabilities = capabilities,
			on_attach = onAttach,
		})
		vim.lsp.enable("racket_langserver")
	end,
}
