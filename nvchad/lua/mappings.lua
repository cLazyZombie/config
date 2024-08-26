require "nvchad.mappings"

-- delete default mappings
-- default: https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua
vim.keymap.del("n", "<TAB>")
vim.keymap.del("n", "<S-TAB>")
vim.keymap.del({ "n" }, "<C-n>")
vim.keymap.del("n", "<leader>b")
-- vim.keymap.del("n", "gr");

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w!<CR><ESC>")

-- buffer 
map("n", "[b", function() require("nvchad.tabufline").prev() end, { desc = "Buffer Goto previous" })
map("n", "]b", function() require("nvchad.tabufline").next() end, { desc = "Buffer Goto next" })
map("n", "<leader>bc", function() require("nvchad.tabufline").closeAllBufs(false) end, { desc = "Buffer Close all except current" })

-- nvimtree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
map("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", { desc = "Nvimtree Focus window" })

-- term
-- map({ "n", "t" }, "<F7>", function() require("nvchad.term").toggle { pos = "sp", size = 0.6, id = "htoggleTerm" } end, { desc = "Toggle Terminal" })
map({ "n", "t" }, "<F7>", function() require("nvchad.term").toggle { pos = "float", float_opts = { width = 1.0, height = 0.95 }, id = "ftoggleTerm" } end, { desc = "Toggle Terminal Float" })

-- lsp
map("n", "gy", function() require("telescope.builtin").lsp_type_definitions() end, { desc = "LSP type definition" })
map("n", "<leader>fs", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, { desc = "LSP workspace symbols" })
map("n", "<leader>fm", function() require("telescope.builtin").lsp_document_symbols() end, { desc = "LSP document synbols" })
map("n", "<leader>fd", function() require("telescope.builtin").diagnostics { bufnr = 0 } end, { desc = "LSP buffer diagnostics" })
map("n", "<leader>fD", function() require("telescope.builtin").diagnostics() end, { desc = "LSP diagnostics" })
map("n", "<leader>fr", function() require("telescope.builtin").lsp_references() end, { desc = "LSP references" })
map("n", "<leader>fu", function() require("telescope.builtin").lsp_references() end, { desc = "LSP references" })
map("n", "<leader>f<CR>", function() require("telescope.builtin").resume() end, { desc = "Telescope Resume search" })
map("n", "<leader>fg", function() require("telescope.builtin").git_status() end, { desc = "Git status" })
map("n", "gl", function() vim.diagnostic.open_float() end, { desc = "LSP open diagnostics" })

-- git
map("n", "<leader>gd", function() require('gitsigns').diffthis() end, { desc = "Git diff this file" })
map("n", "[g", function() require('gitsigns').nav_hunk('prev') end, { desc = "go to prev git changes" })
map("n", "]g", function() require('gitsigns').nav_hunk('next') end, { desc = "go to next git changes" })

-- copilot chat
map("n", "<leader>cc", function() require("CopilotChat").toggle() end, { desc = "Copilot Chat" })

-- paste with leader-v
map("n", "<leader>v", "ciw<C-r>0<ESC>")

-- backspace at normal mode to delete word and enter insert mode
map("n", "<BS>", "ciw")

-- dap
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)
