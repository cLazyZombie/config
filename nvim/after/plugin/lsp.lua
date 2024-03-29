local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua',
    'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

-- lsp.on_attach(function(client, bufnr)
--   print("hello, lsp.on_attach start")
--   local opts = {buffer = bufnr, remap = false}

--   if client.name == "eslint" then
--       vim.cmd.LspStop('eslint')
--       return
--   end

--   print("hello, lsp.on_attach")

--   vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--   vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--   vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
--   vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
--   vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
--   vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
--   vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
--   vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
--   vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
--   vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
-- end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

-- 위의 lsp.on_attach가 동작하지 않아서 임시로 이렇게 설정함
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition)
-- vim.keymap.set("n", "K", vim.lsp.buf.hover)
-- vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol)
-- vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_next)
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)
-- vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action)
-- vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references)
-- vim.keymap.set("n", "<F2>", vim.lsp.buf.rename)
-- vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help)

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
