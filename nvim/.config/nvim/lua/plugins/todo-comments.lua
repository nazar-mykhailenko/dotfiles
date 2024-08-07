return {
	-- TODO: kdfj
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo = require("todo-comments")
		todo.setup({})
		vim.keymap.set("n", "<leader>tk", todo.jump_prev, { desc = "[T]ODO [k] - previous" })
		vim.keymap.set("n", "<leader>tj", todo.jump_next, { desc = "[T]ODO [j] - next" })
		vim.keymap.set("n", "<leader>ta", "<CMD>TodoTelescope<CR>", { desc = "[T]ODO [A]ll" })
	end,
}
