return {
	"NvChad/nvim-colorizer.lua",
	opts = {
		user_default_options = {
			tailwind = true,
			names = false, -- disable named colors like "yellow"
		},
		filetypes = { "html", "css", "javascript", "typescript", "tsx", "jsx" }, -- restrict to frontend files
	},
	config = function()
		-- execute colorizer as soon as possible
		vim.defer_fn(function()
			require("colorizer").attach_to_buffer(0)
		end, 0)
	end,
}
