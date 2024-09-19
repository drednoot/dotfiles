return {
	'neovim/nvim-lspconfig',

	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp-signature-help'
	},

	config = function()
		require('lspconfig').clangd.setup({})
		require('lspconfig').rust_analyzer.setup({})

		local cmp = require('cmp')
		cmp.setup({
			sources = {
				{name = 'nvim_lsp'},
				{name = 'nvim_lsp_signature_help'},
			},
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
			select_behavior = cmp.SelectBehavior.Insert,
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
			}),
			completion = {completeopt = 'menu,menuone,noinsert,noselect'},
			preselect = 'none',
		})
	end,
}
