return {
	"leafOfTree/vim-matchtag",
	opts = {},
	config = function()
		vim.g.matchtag_enable_by_default = 1
		-- Enable the plugin for specific file types (e.g., HTML, XML, TSX)
		vim.g.matchtag_files = "*.html,*.xml,*.js,*.jsx,*.ts,*.tsx"
	end,
}
