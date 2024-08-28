return {
	'rstacruz/vim-closer',
	'rstacruz/vim-closer',
	'tpope/vim-endwise',
	'tpope/vim-surround',
	'norcalli/nvim-colorizer.lua',
	'lukas-reineke/indent-blankline.nvim',
	'michaeljsmith/vim-indent-object',
	'tikhomirov/vim-glsl',
	'mcauley-penney/visual-whitespace.nvim',
	'wellle/targets.vim',

	{
		'tpope/vim-commentary',

		config = function() 
			vim.cmd [[autocmd FileType c,cpp setlocal commentstring=//\ %s]]
		end,
	},

	{
		'unblevable/quick-scope',

		config = function()
			vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
		end,
	},
}
