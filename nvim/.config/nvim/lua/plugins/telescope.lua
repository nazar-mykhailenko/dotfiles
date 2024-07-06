return {
	'nvim-telescope/telescope.nvim', tag = '0.1.6',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-ui-select.nvim',
	},
	config = function()
		require("telescope").load_extension("ui-select")
		local builtins = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sf", builtins.find_files, { desc = "[F]ind files" })
		vim.keymap.set("n", "<leader>sh", builtins.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtins.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader><leader>", builtins.buffers, { desc = "[ ] Find existing buffers" })
	end
}

