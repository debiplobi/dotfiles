return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			highlight = {
				enable = true,
				autoinstall = true,
				highlight = { enable = true, additional_vim_regex_highlighting = false },
			},
			indent = { enable = true },
			fold = { enable = true },
			ensure_installed = {
				"bash",
				"css",
				"html",
				"javascript",
				"typescript",
				"markdown",
				"markdown_inline",
				"tsx",
				"yaml",
				"lua",
				"blade",
			},
			-- autotag = { enable = true },
		})
	end,
}
