require 'navigator'.setup({
    mason = true,
    lsp = {
        disable_lsp = { "rust_analyzer", "clangd" }, -- will not run rust_analyzer setup from navigator
        ['neodev'] = { runtime_path = true }, -- any non default neodev setups, if not empty, navigator will call neodev.setup
        disply_diagnostic_qf = false,
    },
    -- { key = 'gW', func = require('navigator.workspace').workspace_symbol_live, desc = 'workspace_symbol_live' },
    keymaps = {
        { key = 'gw', func = require('navigator.workspace').workspace_symbol_live, desc = 'workspace_symbol_live' },
    },
})
