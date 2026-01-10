return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "master",
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
				"c",
				"diff",
				"json",
				"jsonc",
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
				"luadoc",
				"luap",
				"query",
				"regex",
				"toml",
				"xml",
				"blade",
				"vimdoc",
				"vim",
				"python",
				"dockerfile",
			},
			-- autotag = { enable = true },
		})
	end,
}
