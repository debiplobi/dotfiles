return {
	"tamton-aquib/staline.nvim",
	config = function()
		require("staline").setup({
			sections = {
				left = {
					"▊",
					{ "StalineGit", "branch" },
					" ",
					{ "VimIcon", " " }, -- Vim icon
					" ",
					"file_size",
					" ",
					{
						"StalineFile",
						function()
							local path = vim.fn.expand("%:p")
							if path == "" then
								return "[No Name]"
							end

							local home = vim.fn.expand("$HOME")
							path = path:gsub("^" .. home, "~")

							return path
						end,
					},
					" ",
				},

				mid = {},

				right = {
					{ "StalineEnc", vim.bo.fileencoding:upper() },
					" ",
					-- { "StalineEnc", " " }, -- 🐧 Gentoo icon

					" ",
					function()
						local clients = vim.lsp.get_clients({ bufnr = 0 })
						if not clients or #clients == 0 then
							return "No LSP"
						end

						local names = {}
						for _, client in ipairs(clients) do
							table.insert(names, client.name)
						end

						return table.concat(names, ", ")
					end,
					" ",
					"▊",
				},
			},

			defaults = {
				bg = "#202328",
				branch_symbol = " ",
			},

			mode_colors = {
				n = "#38b1f0",
				i = "#9ece6a",
				v = "#bb9af7",
				c = "#f7768e",
			},
		})

    vim.cmd([[hi VimIcon guifg=#5fd700 guibg=#202328]])
		vim.cmd([[hi StalineEnc  guifg=#7d9955 guibg=#202328]])
		vim.cmd([[hi StalineGit guifg=#c37cda guibg=#202328]])
		vim.cmd([[hi StalineFile guifg=#c37cda guibg=#202328]])

		-- vim.cmd([[hi StalineEnc guifg=#7c5cff guibg=#202328]])
	end,
}
