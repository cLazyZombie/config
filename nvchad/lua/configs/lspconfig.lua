-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- format on save
vim.cmd [[autocmd BufWritePre *.rs lua vim.lsp.buf.format({ async = false })]]

-- lspconfig.rust_analyzer.setup({
--   on_attach = on_attach,
--   on_init = on_init,
--   -- on_attach = function()
--   --   on_attach()
--   --   vim.keymap.del('n', "gr", { buffer = true })
--   -- end,
--   capabilities = capabilities,
--   filetypes = {
--     "rust"
--   },
--   settings = {
--     ['rust-analyzer'] = {
--       cargo = {
--         allFeatures = true,
--       }
--     }
--   }
-- })
