return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			transparent_background = false,
			integrations = {
				telescope = true,
				cmp = false,
                oil = true,
			}
		})

		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
