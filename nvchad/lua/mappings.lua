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
map("n", "<leader>bh", function()
  local b = vim.fn.bufnr()
  vim.cmd('wincmd h')
  vim.cmd('b ' .. b)
end, { desc = "move buffer left" })
map("n", "<leader>bl", function()
  local b = vim.fn.bufnr()
  vim.cmd('wincmd l')
  vim.cmd('b ' .. b)
end, { desc = "move buffer right" })

-- nvimtree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
map("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", { desc = "Nvimtree Focus window" })

-- term
-- map({ "n", "t" }, "<F7>", function() require("nvchad.term").toggle { pos = "sp", size = 0.6, id = "htoggleTerm" } end, { desc = "Toggle Terminal" })
map({ "n", "t" }, "<F7>", function() require("nvchad.term").toggle { pos = "float", float_opts = { relative = "editor", width = 1.0, height = 0.95, border = "single" }, id = "ftoggleTerm" } end, { desc = "Toggle Terminal Float" })

-- lsp
map("n", "gy", function() require("telescope.builtin").lsp_type_definitions() end, { desc = "LSP type definition" })
map("n", "<leader>fs", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, { desc = "LSP workspace symbols" })
map("n", "<leader>fS", function() require("telescope.builtin").lsp_document_symbols() end, { desc = "LSP document synbols" })
map("n", "<leader>fm", function() require("telescope.builtin").marks() end, { desc = "List Bookmarks" })
map("n", "<leader>fj", function() require("telescope.builtin").jumplist() end, { desc = "List Jumplist" })
map("n", "<leader>fd", function() require("telescope.builtin").diagnostics { bufnr = 0 } end, { desc = "LSP buffer diagnostics" })
map("n", "<leader>fD", function() require("telescope.builtin").diagnostics() end, { desc = "LSP diagnostics" })
map("n", "<leader>fr", function() require("telescope.builtin").lsp_references() end, { desc = "LSP references" })
map("n", "<leader>fu", function() require("telescope.builtin").lsp_references() end, { desc = "LSP references" })
map("n", "<leader>f<CR>", function() require("telescope.builtin").resume() end, { desc = "Telescope Resume search" })
map("n", "<leader>fg", function() require("telescope.builtin").git_status() end, { desc = "Git status" })
map("n", "gl", function() vim.diagnostic.open_float() end, { desc = "LSP open diagnostics" })

-- git
map("n", "<leader>gs", function() require('telescope.builtin').git_stash() end, { desc = "Git Stash" })
map("n", "<leader>gt", function() require('telescope.builtin').git_status() end, { desc = "Git Status" })
map("n", "<leader>gc", function() require('telescope.builtin').git_bcommits() end, { desc = "Git Commits about this Buffer" })
map("n", "<leader>gC", function() require('telescope.builtin').git_commits() end, { desc = "Git Commits" })
map("n", "<leader>gb", function() require('telescope.builtin').git_branches() end, { desc = "Git Branches" })

-- copilot
map("n", "<leader>cc", function() require("CopilotChat").toggle() end, { desc = "Copilot Chat" })
map("n", "<C-f>", function() require("copilot.suggestion").accept("") end, { desc = "Copilot Accept" })
map("n", "<leader>cs", function() require("copilot.suggestion").accept("") end, { desc = "Copilot Accept" })


-- paste with leader-v
map("n", "<leader>v", "ciw<C-r>0<ESC>")

-- backspace at normal mode to delete word and enter insert mode
map("n", "<BS>", "ciw")

-- toggle inlay hints
map("n", "<leader>i", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, { desc = "Toggle inlay hints" })

-- dap
vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = "Debug Continue" })
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = "Debug Step Over" })
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = "Debug Step Into" })
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = "Debug Step Out" })
vim.keymap.set('n', '<F9>', function() require('dap').toggle_breakpoint() end, { desc = "Debug Toggle Breakpoint" })
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end, { desc = "Debug Set Breakpoint" })
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = "Debug Log Point" })
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end, { desc = "Debug Open REPL" })
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, { desc = "Debug Run Last" })
vim.keymap.set({'n', 'v'}, '<Leader>dh', function() require('dap.ui.widgets').hover() end, { desc = "Debug Hover" })
vim.keymap.set({'n', 'v'}, '<Leader>dp', function() require('dap.ui.widgets').preview() end, { desc = "Debug Preview" })
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.sidebar(widgets.frames)
end, { desc = "Debug Frames" })

vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.sidebar(widgets.scopes)
end, { desc = "Debug Scopes" })
