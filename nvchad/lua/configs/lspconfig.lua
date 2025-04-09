-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
-- format on save
vim.cmd [[autocmd BufWritePre *.rs lua vim.lsp.buf.format({ async = false })]]

-- lspconfig.rust_analyzer.setup({
--   on_attach = function(client, bufnr)
--     vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
--   end
-- })
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
