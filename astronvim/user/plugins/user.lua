return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.completion.copilot-lua-cmp" },
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "zbirenbaum/copilot.lua" },
		opts = function(_, opts)
			local cmp, copilot = require "cmp", require "copilot.suggestion"
			opts.mapping["<C-j>"] = cmp.mapping(function()
				if copilot.is_visible() then copilot.next() end
			end)
			opts.mapping["<C-k>"] = cmp.mapping(function()
				if copilot.is_visible() then copilot.prev() end
			end)
			return opts
		end,
	},
	{ import = "astrocommunity.pack.rust" },
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.motion.nvim-surround" },
	-- { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
	{ import = "astrocommunity.bars-and-lines.heirline-vscode-winbar" },
	{ import = "astrocommunity.editing-support/todo-comments-nvim" },
	-- { import = "astrocommunity.workflow/hardtime-nvim" },
	-- { "m4xshen/hardtime.nvim",                                        event = "VeryLazy", opts = {} },
	-- { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
	-- { import = "astrocommunity.diagnostics.trouble-nvim" },
	require("telescope").setup({
		defaults = {
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			},
		},
	}),
}
