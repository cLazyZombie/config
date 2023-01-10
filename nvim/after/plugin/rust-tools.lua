local rt = require("rust-tools")
local lsp = require("lsp-zero")
local rust_lsp = lsp.build_options('rust_analyzer', {
    single_file_support = false,
    on_attach = function(_, bufnr)
        vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end
})
local opts = {
    tools = {
        hover_actions = {
            border = {
                { "=", "FloatBorder" },
                { "=", "FloatBorder" },
                { "=", "FloatBorder" },
                { "=", "FloatBorder" },
                { "=", "FloatBorder" },
                { "=", "FloatBorder" },
                { "=", "FloatBorder" },
                { "=", "FloatBorder" },
            },
            max_width = 200,
        },
    },
    server = rust_lsp,
}
-- require('rust-tools').setup({server = rust_lsp})

rt.setup(opts)

require('rust-tools').inlay_hints.set()
require('rust-tools').inlay_hints.enable()
