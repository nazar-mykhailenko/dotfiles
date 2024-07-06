return {
	"rebelot/kanagawa.nvim",
	config = function ()
		require("kanagawa").setup({
			transparent = true,
		})
		require("kanagawa").load("wave")
	end
}
