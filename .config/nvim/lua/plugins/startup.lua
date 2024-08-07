return {
	"startup-nvim/startup.nvim",
	name = 'startup',

	lazy = false,

	opts = {
		theme = 'startify',
	},

	depencencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
}
