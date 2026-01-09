return {
	"webhooked/kanso.nvim",
	enabled = true,
	lazy = false,
	priority = 1000,
	name = "kanso",
	config = function()
		require("kanso").setup({
			background = {
				light = "mist",
				dark = "ink",
			},
			foreground = {
				light = "saturated",
				dark = "default",
			},
			bold = false,
			italics = true,
			transparent = true,
		})

		vim.cmd("colorscheme kanso")
	end,
}
