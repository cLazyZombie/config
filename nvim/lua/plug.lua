require('packer').startup(function(use)
  use({
    'projekt0n/github-nvim-theme',
    config = function()
      require('github-theme').setup()
    end
  })

  use 'williamboman/mason.nvim'
  require("mason").setup()

  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig' 
  use 'simrat39/rust-tools.nvim'
  use 'sitiom/nvim-numbertoggle'

  -- Completion framework:
  use 'hrsh7th/nvim-cmp' 

  -- LSP completion source:
  use 'hrsh7th/cmp-nvim-lsp'

  -- Useful completion sources:
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'                             
  use 'hrsh7th/cmp-path'                              
  use 'hrsh7th/cmp-buffer'                            
  use 'hrsh7th/vim-vsnip'

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() 
      require('nvim-treesitter').setup({
        ensure_installed = { "lua", "rust", "toml" },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting=false,
        },
        ident = { enable = true }, 
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        }
      })
    end
  }
  use 'wbthomason/packer.nvim'
end)

require('keymap')
-- require("mason").setup()
