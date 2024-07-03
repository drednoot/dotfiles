return {
	"Rolv-Apneseth/tfm.nvim",

	lazy = false,

	opts = {
		file_manager = "yazi",
		replace_netrw = true,
	},
	
	keys = {
		{
			"<c-t>",
			function()
				require("tfm").open()
			end,
			desc = "Open Tfm",
		},
	},
}
