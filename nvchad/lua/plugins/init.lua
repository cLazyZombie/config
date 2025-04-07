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

      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, opts)
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright"
      },
      -- ensure_installed = {
      --   "rust-analyzer", "lua-language-server", "stylua",
      --   "html-lsp", "css-lsp" , "prettier"
      -- },
    },
  },
  { -- override nvim-cmp plugin
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
    },
    -- override the options table that is used in the `require("cmp").setup()` call
    opts = function(_, opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require("cmp")
      opts.mapping = cmp.mapping.preset.insert({
        ["<tab>"] = function(fallback)
          print("tab pressed")
          if require("copilot.suggestion").is_visible() then
            print("copilot suggestion visible")
            require("copilot.suggestion").accept()
          else
            print("copilot suggestion not visible")
            fallback()
          end
        end,
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      })
      -- -- modify the mapping part of the table
      -- opts.mapping["<C-j>"] = cmp.mapping.select_next_item()
      -- opts.mapping["<Down>"] = cmp.mapping.select_next_item()
      -- opts.mapping["<C-k>"] = cmp.mapping.select_prev_item()
      -- opts.mapping["<Up>"] = cmp.mapping.select_prev_item()
      -- opts.mapping["<tab>"] = function(fallback)
      --   print("tab pressed")
      --   if require("copilot.suggestion").is_visible() then
      --     print("copilot suggestion visible")
      --     require("copilot.suggestion").accept()
      --   else
      --     print("copilot suggestion not visible")
      --     fallback()
      --   end
      -- end
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
    version = '^6', -- Recommended
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
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
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
          accept = "<tab>",
          next = "<C-Down>",
          prev = "<C-Up>",
        }
      }
    }
  },
  -- {
  --   'ggml-org/llama.vim',
  --   -- event = "BufReadPost",
  --   lazy = false,
  --   init = function()
  --     vim.g.llama_config = {
  --       n_predict = 512,
  --       show_info = 0,
  --     }
  --   end,
  -- },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      model = "claude-3.7-sonnet",
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
  -- copy to clipboard when ssh
  {
    'ojroques/nvim-osc52',
    init = function()
      local plugin = require('osc52')
      vim.keymap.set('n', '<leader>b', plugin.copy_operator, {expr = true})
      vim.keymap.set('v', '<leader>b', plugin.copy_visual)
    end
  },
  -- convert to opposite word
  {
    'tigion/nvim-opposites',
    -- event = { 'BufReadPost', 'BufNewFile' },
    keys = {
      { '<Leader>i', function() require('opposites').switch() end, desc = 'Switch to opposite word' },
    },
    ---@type opposites.Config
    opts = {
      opposites = {
        ['Req'] = 'Resp',
      },
      opposites_by_ft = {
        ['lua'] = {
          ['=='] = '~=',     -- Replaces the default `['=='] = '!='` for lua files.
        },
        ['sql'] = {
          ['AND'] = 'OR',  -- Adds a new for SQL files.
        },
      },
    },
  },
}
 
