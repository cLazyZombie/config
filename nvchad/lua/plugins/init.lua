return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      -- ensure_installed = {
      --   "rust-analyzer", "lua-language-server", "stylua",
      --   "html-lsp", "css-lsp" , "prettier"
      -- },
    },
  },
  { -- override nvim-cmp plugin
    "hrsh7th/nvim-cmp",
    -- override the options table that is used in the `require("cmp").setup()` call
    opts = function(_, opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require("cmp")
      -- modify the mapping part of the table
      opts.mapping["<C-j>"] = cmp.mapping.select_next_item()
      opts.mapping["<Down>"] = cmp.mapping.select_next_item()
      opts.mapping["<C-k>"] = cmp.mapping.select_prev_item()
      opts.mapping["<Up>"] = cmp.mapping.select_prev_item()
      -- opts.mapping["<C-Space>"] = nil
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "rust",
      },
    },
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function(_,_)
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, buffer)
            local on_attach = require("nvchad.configs.lspconfig").on_attach;
            on_attach(client, buffer)

            vim.opt.formatoptions:remove("t")
            vim.opt.formatoptions:remove("c")
            -- vim.print(vim.opt.formatoptions:get())
          end,
          cmd = function()
            local os = vim.loop.os_uname().sysname
            if os == "Darwin" then
              return { "ra-multiplex" }
            else
              return { "rust-analyzer" }
            end
          end,
          default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
                --   features = { 'all' },
              },
            },
          },
        },
      }
    end,
  },
  -- {
  --   "simrat39/rust-tools.nvim",
  --   ft = "rust",
  --   dependencies = "neovim/nvim-lspconfig",
  --   opts = function ()
  --     local on_attach = require("nvchad.configs.lspconfig").on_attach
  --     local capabilities = require("nvchad.configs.lspconfig").capabilities
  --     return {
  --       server = {
  --         on_attach = on_attach,
  --         capabilities = capabilities,
  --       }
  --     }
  --   end,
  --   config = function(_, opts)
  --     require('rust-tools').setup(opts)
  --   end
  -- },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "zbirenbaum/copilot.lua",
    event = { "InsertEnter" },
    cmd = { "Copilot" },
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-_>",
        }
      }
    }
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  {
    'saecki/crates.nvim',
    tag = 'stable',
    config = function()
      require('crates').setup()
    end,
  },
  {
    'nvim-pack/nvim-spectre',
    keys = {
      { '<F4>', "<cmd>Spectre<CR>", mode='n' },
    },
    config = function()
      require('spectre').setup({ is_block_ui_break = true })
    end,
  },
}
