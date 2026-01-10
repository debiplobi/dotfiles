return {
	{
		"williamboman/mason.nvim",
		opts = {},
		keys = {
			vim.keymap.set("n", "<leader>m", ":Mason<CR>", {}),
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"prettierd",
				-- "blade-formatter",
				"clang-format",
				"eslint",
				"black",
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"gopls",
				"clangd",
				"rust_analyzer",
				"tombi",
				"zls",
				"pyright",
				-- "intelephense",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		opts = {
			servers = {
				lua_ls = {},
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							cargo = {
								features = "all", -- Enable all features
							},
						},
					},
				},
			},
		},
		config = function(_, opts)
			local blink_completions = require("blink.cmp")

			for server, config in pairs(opts.servers) do
				config.capabilities = blink_completions.get_lsp_capabilities(config.capabilities)

				vim.lsp.config[server] = {
					config.capabilities,
				}
			end

			-- Global LSP keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
		end,
	},
}
