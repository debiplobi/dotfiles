return {
	"ellisonleao/gruvbox.nvim",
	name = "gruvbox",
	lazy = false,
	priority = 1000,

	opts = {
		terminal_colors = true,
		undercurl = true,
		underline = true,
		bold = true,
		italic = {
			strings = false,
			emphasis = true,
			comments = true,
			operators = false,
			folds = true,
		},
		strikethrough = true,

		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = true,

		contrast = "hard", -- soft, medium, hard

		palette_overrides = {},
		overrides = {},

		dim_inactive = false,
		transparent_mode = true,
	},

	config = function(_, opts)
		require("gruvbox").setup(opts)
		vim.o.background = "dark"
		vim.cmd.colorscheme("gruvbox")
	end,
}
