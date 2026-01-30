return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },

		opts = {
			formatters_by_ft = {
				-- Lua
				lua = { "stylua" },

				-- JavaScript / TypeScript
				javascript = { "biome-check" },
				typescript = { "biome-check" },
				javascriptreact = { "biome-check" },
				typescriptreact = { "biome-check" },

				-- Web / Markup
				css = { "biome-check", "prettierd" },
				json = { "biome-check", "prettierd" },
				jsonc = { "biome-check", "prettierd" },
				markdown = { "biome-check", "prettierd" },
				graphql = { "biome-check" },

				-- Still Prettier-only
				html = { "prettierd" },
				yaml = { "prettierd" },

				-- Backend / Systems
				rust = { "rustfmt" },
				go = { "gofmt" },
				python = { "black" },

				-- Optional
				-- blade = { "blade-formatter" },
				-- php = { "php-cs-fixer" },
				gdscript = { "gdformat" }, -- Use gdformat from gdtoolkit
			},
		},

		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({
						lsp_fallback = true,
						timeout_ms = 500,
					})
				end,
				desc = "Format buffer",
			},
		},
	},
}
