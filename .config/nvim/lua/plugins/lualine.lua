return {
	'nvim-lualine/lualine.nvim',
	name = 'lualine',
	
	opts = {
		sections = {
			lualine_x = {'filetype'},
		},
		options = {
			theme = 'auto',
		},
	},

	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
}
