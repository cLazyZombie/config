-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  -- {
  -- 	"hrsh7th/nvim-cmp",
  -- 	dependencies = { "zbirenbaum/copilot.lua" },
  -- 	opts = function(_, opts)
  -- 		local cmp, copilot = require("cmp"), require("copilot.suggestion")
  -- 		opts.mapping["<C-j>"] = cmp.mapping(function()
  -- 			if copilot.is_visible() then
  -- 				copilot.next()
  -- 			end
  -- 		end)
  -- 		opts.mapping["<C-k>"] = cmp.mapping(function()
  -- 			if copilot.is_visible() then
  -- 				copilot.prev()
  -- 			end
  -- 		end)
  -- 		return opts
  -- 	end,
  -- },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.motion.nvim-surround" },
}
