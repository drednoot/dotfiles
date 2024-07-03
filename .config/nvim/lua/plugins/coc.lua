return {
	'neoclide/coc.nvim',
	branch = 'release',

	lazy = false,

	keys = {
		{
			'<tab>',
			'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
		},
		{
			'<s-tab>',
			[[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]],
		},
	},
}
