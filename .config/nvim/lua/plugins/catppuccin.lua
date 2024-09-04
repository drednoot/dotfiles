return {
	"catppuccin/nvim",
	name = "catppuccin",

	lazy = false,
	priority = 1000,

	opts = {
		flavour = "mocha",
		no_italic = false,
		no_bold = false,
		no_underline = false,
		styles = {
			comments = { "italic" },
		},
		integrations = {
			treesitter = true,
		},
	},

	config = function()
		vim.cmd.colorscheme "catppuccin"
	end,
}
