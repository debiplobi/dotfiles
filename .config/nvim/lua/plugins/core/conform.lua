return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },

		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				html = { "prettierd" },
				css = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				rust = { "rustfmt" },
				go = { "gofmt" },
				python = { "black" },
				-- blade = { "blade-formatter" },
				-- php = { "intelephense" },
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
