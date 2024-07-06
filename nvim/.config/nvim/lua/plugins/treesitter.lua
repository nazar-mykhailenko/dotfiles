return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
	require("nvim-treesitter.install").prefer_git = true
      local configs = require("nvim-treesitter.configs")

      configs.setup({
      	  ensure_installed = { "c", "lua" },
          auto_install = true,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
}
