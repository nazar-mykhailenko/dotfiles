return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup {}
		vim.keymap.set('n', "<leader>bl", ":BufferLinePick<CR>", { desc = "[B]uffer[L]inePick"})
		vim.keymap.set('n', "<leader>dt", ":bd<CR>", { desc = "[D]elete [T]ab"})
	end
}
