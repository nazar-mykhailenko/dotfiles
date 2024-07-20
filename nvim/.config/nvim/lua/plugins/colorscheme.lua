return {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require 'nordic' .load()
    end
}
-- 	{
-- 	"rebelot/kanagawa.nvim",
-- 	config = function ()
-- 		require("kanagawa").setup({
-- 			transparent = false,
-- 		})
-- 		require("kanagawa").load("wave")
-- 	end
-- }
