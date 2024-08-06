return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",            -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			event_handlers = {

				{
					event = "file_open_requested",
					handler = function()
						-- auto close
						-- vimc.cmd("Neotree close")
						-- OR
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
			window = {
				mappings = {
					["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
				},
			},
		})
		vim.keymap.set("n", "<C-e>", ":Neotree filesystem reveal right toggle<CR>", { desc = "Toggle [e]xplorer" })
	end,
}
