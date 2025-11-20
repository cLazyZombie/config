-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- Neovim 0.11+ uses vim.lsp.config() and vim.lsp.enable()
local servers = { "html", "cssls", "ts_ls", "basedpyright" }

-- Enable all servers (they use global config from defaults)
vim.lsp.enable(servers)
-- format on save
vim.cmd [[autocmd BufWritePre *.rs lua vim.lsp.buf.format({ async = false })]]

-- rust_analyzer with custom settings (Neovim 0.11+ pattern)
-- vim.lsp.config("rust_analyzer", {
--   settings = {
--     ["rust-analyzer"] = {
--       cargo = {
--         allFeatures = true,
--       },
--     },
--   },
-- })
-- vim.lsp.enable("rust_analyzer")

-- read :h vim.lsp.config for changing options of lsp servers
