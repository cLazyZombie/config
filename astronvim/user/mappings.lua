return {
	n = {
		["<S-l>"] = {
			function()
				require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
			end,
			desc = "Next buffer",
		},
		["<S-h>"] = {
			function()
				require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
			end,
			desc = "Previous buffer",
		},
		["<F12>"] = {
			function()
				print("f12")
				vim.lsp.buf.definition()
			end,
			desc = "Show the definition of current symbol",
		},
		-- leader + v -> replace word under cursor with default register
		["<Leader>v"] = {
			"ciw<C-r>0<ESC>",
			desc = "Replace word under cursor with default register",
		},
	},
	i = {
		["<C-d>"] = {
			"<Del>",
			desc = "Delete character",
		},
		["<C-s>"] = {
			"<Esc>:w<CR>",
			desc = "Save file",
		},
	},
}
