return {
	"folke/tokyonight.nvim",
	lazy = false, -- Load during startup
	priority = 1000, -- Load before all other plugins
	opts = {
		style = "night", -- Options: storm, moon, night, day
		transparent = false, -- Set to true if you want a transparent background
		styles = {
			sidebars = "transparent", -- dark, transparent, or normal
			floats = "dark",
		},
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd.colorscheme("tokyonight")
	end,
}
