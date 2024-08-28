function _G.check_back_space ()
	local col = vim.fn.col('.') - 1
	return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

return {
	'neoclide/coc.nvim',
	branch = 'release',

	enabled = true,
	lazy = false,

	keys = {
		{
			'<tab>',
			'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
			mode = "i",
			expr = true,
			noremap = true,
			silent = true,
			replace_keycodes = false,
		},

		{
			'<s-tab>',
			'coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"',
			mode = "i",
			expr = true,
			noremap = true,
			silent = true,
			replace_keycodes = false,
		},
	},
}
