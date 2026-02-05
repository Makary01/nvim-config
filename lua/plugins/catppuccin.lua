return { 
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			integrations = {
				telescope = true,
				cmp = false,
			}
		})

		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
