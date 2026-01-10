return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false, -- load immediately
	priority = 1000, -- load before other UI plugins
	opts = {
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		background = {
			light = "latte",
			dark = "mocha",
		},
		transparent_background = false,

		float = {
			transparent = false,
			solid = false,
		},

		show_end_of_buffer = false,

		dim_inactive = {
			enabled = false,
			shade = "dark",
			percentage = 0.15,
		},

		no_italic = false,
		no_bold = false,
		no_underline = false,

		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			functions = { "bold" },
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},

		lsp_styles = {
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
				ok = { "italic" },
			},
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
			},
			inlay_hints = {
				background = false,
			},
		},

		color_overrides = {},
		custom_highlights = {},

		default_integrations = true,
		auto_integrations = true,

		integrations = {
			fzf = true,
			indent_blankline = { enabled = true },
			gitsigns = true,
			treesitter = true,
			neotree = true,
			mason = true,
			fidget = true,
			alpha = true,
			lsp_trouble = true,
			telescope = { enabled = true },
			blink_cmp = { style = "bordered" },
		},
	},

	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
