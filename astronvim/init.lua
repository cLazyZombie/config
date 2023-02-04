return {
  lsp = {
    skip_setup = { "rust_analyzer" }, -- rust-tools will handle setting up the LSP
  },
  plugins = {
    init = {
      {
        "simrat39/rust-tools.nvim",
        after = { "mason-lspconfig.nvim" },
        -- Is configured via the server_registration_override installed below!
        config = function()
          require("rust-tools").setup {
            server = astronvim.lsp.server_settings "rust_analyzer", -- get the server-settings from the AstroNvim tables to allow use with lsp.server-settings and lsp.on_attach user configuration
          }
        end,
      },
      {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
          require("copilot").setup({
            suggestion = {
              enabled = true,
              auto_trigger = true,
              keymap = {
                accept = "<Tab>",
              },
            },
          })
        end,
      },
      -- {
      -- 	 "zbirenbaum/copilot-cmp",
      -- 		after = { "copilot.lua" },
      -- 		config = function ()
      -- 			require("copilot_cmp").setup()
      -- 		end
      -- },
    },
    cmp = function(opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require "cmp"
      local copilot_suggestion = require "copilot.suggestion"
      -- modify the mapping part of the table
      opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        if copilot_suggestion.is_visible() then
          copilot_suggestion.accept()
        elseif cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      })
      -- return the new table to be used
      return opts
    end,
  },
  mappings = {
    n = {
    },
  },
}
