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
      -- require("nvchad.configs.lspconfig").defaults()
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
  -- { -- override nvim-cmp plugin
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
  --   },
  --   -- override the options table that is used in the `require("cmp").setup()` call
  --   opts = function(_, opts)
  --     -- opts parameter is the default options table
  --     -- the function is lazy loaded so cmp is able to be required
  --     local cmp = require("cmp")
  --     opts.mapping = cmp.mapping.preset.insert({
  --       ["<tab>"] = function(fallback)
  --         print("tab pressed")
  --         if require("copilot.suggestion").is_visible() then
  --           print("copilot suggestion visible")
  --           require("copilot.suggestion").accept()
  --         else
  --           print("copilot suggestion not visible")
  --           fallback()
  --         end
  --       end,
  --       ["<CR>"] = cmp.mapping.confirm({ select = true }),
  --     })
  --     -- -- modify the mapping part of the table
  --     -- opts.mapping["<C-j>"] = cmp.mapping.select_next_item()
  --     -- opts.mapping["<Down>"] = cmp.mapping.select_next_item()
  --     -- opts.mapping["<C-k>"] = cmp.mapping.select_prev_item()
  --     -- opts.mapping["<Up>"] = cmp.mapping.select_prev_item()
  --     -- opts.mapping["<tab>"] = function(fallback)
  --     --   print("tab pressed")
  --     --   if require("copilot.suggestion").is_visible() then
  --     --     print("copilot suggestion visible")
  --     --     require("copilot.suggestion").accept()
  --     --   else
  --     --     print("copilot suggestion not visible")
  --     --     fallback()
  --     --   end
  --     -- end
  --   end,
  -- },
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
            -- return { "rust-analyzer" }

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
  -- {
  --   "zbirenbaum/copilot.lua",
  --   event = { "InsertEnter" },
  --   cmd = { "Copilot" },
  --   opts = {
  --     suggestion = {
  --       auto_trigger = true,
  --       keymap = {
  --         accept = "<tab>",
  --         next = "<C-Down>",
  --         prev = "<C-Up>",
  --       }
  --     }
  --   }
  -- },
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
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   dependencies = {
  --     { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
  --     { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
  --   },
  --   opts = {
  --     model = "gpt-4.1",
  --     debug = true, -- Enable debugging
  --     -- See Configuration section for rest
  --   },
  --   -- See Commands section for default commands if you want to lazy load on them
  -- },
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
    -- config = function()
    --   print("osc52============")
    --   local osc52 = require('osc52')
    --   osc52.setup({
    --     max_length = 0,
    --     silent = false,
    --     trim = false,
    --   })
    --   -- SSH 세션에서만 활성화
    --   if vim.env.SSH_TTY then
    --     print("ssh====")
    --
    --     local function copy(lines, _)
    --       osc52.copy(table.concat(lines, '\n'))
    --     end
    --
    --     local function paste()
    --       return {vim.fn.split(vim.fn.getreg(''), '\n'), 'V'}
    --     end
    --
    --     vim.g.clipboard = {
    --       name = 'osc52',
    --       copy = {['+'] = copy, ['*'] = copy},
    --       paste = {['+'] = paste, ['*'] = paste},
    --     }
    --   end
    -- end,
    init = function()
      local osc52 = require('osc52')
      osc52.setup({
        max_length = 0,
        silent = false,
        trim = false,
      })
      -- SSH 세션에서만 활성화
      if vim.env.SSH_TTY then
        local function copy(lines, _)
          osc52.copy(table.concat(lines, '\n'))
        end

        local function paste()
          return {vim.fn.split(vim.fn.getreg(''), '\n'), 'V'}
        end

        vim.g.clipboard = {
          name = 'osc52',
          copy = {['+'] = copy, ['*'] = copy},
          paste = {['+'] = paste, ['*'] = paste},
        }
      end
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
  -- easy switch input mode 
  {
    "keaising/im-select.nvim",
    event = { "VimEnter", "InsertEnter" },
    config = function()
      require('im_select').setup({
        -- IM will be set to `default_im_select` in `normal` mode
        -- For Windows/WSL, default: "1033", aka: English US Keyboard
        -- For macOS, default: "com.apple.keylayout.ABC", aka: US
        -- For Linux, default:
        --               "keyboard-us" for Fcitx5
        --               "1" for Fcitx
        --               "xkb:us::eng" for ibus
        -- You can use `im-select` or `fcitx5-remote -n` to get the IM's name
        default_im_select  = "com.apple.keylayout.ABC",

        -- Can be binary's name, binary's full path, or a table, e.g. 'im-select',
        -- '/usr/local/bin/im-select' for binary without extra arguments,
        -- or { "AIMSwitcher.exe", "--imm" } for binary need extra arguments to work.
        -- For Windows/WSL, default: "im-select.exe"
        -- For macOS, default: "macism"
        -- For Linux, default: "fcitx5-remote" or "fcitx-remote" or "ibus"
        default_command = "macism",

        -- Restore the default input method state when the following events are triggered
        set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },

        -- Restore the previous used input method state when the following events
        -- are triggered, if you don't want to restore previous used im in Insert mode,
        -- e.g. deprecated `disable_auto_restore = 1`, just let it empty
        -- as `set_previous_events = {}`
        set_previous_events = { "InsertEnter" },

        -- Show notification about how to install executable binary when binary missed
        keep_quiet_on_no_binary = false,

        -- Async run `default_command` to switch IM or not
        async_switch_im = true
      })
    end,
  },
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
      require("claude-code").setup()
    end,
    cmd = { "ClaudeCode" }, -- 명령어 지연 로딩
  },
}
