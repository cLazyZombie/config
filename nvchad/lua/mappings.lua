require "nvchad.mappings"

-- delete default mappings
-- default: https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua
vim.keymap.del("n", "<TAB>")
vim.keymap.del("n", "<S-TAB>")
vim.keymap.del({ "n" }, "<C-n>")
-- vim.keymap.del("n", "gr");

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w!<CR><ESC>")

-- buffer prev/next
map("n", "[b", function() require("nvchad.tabufline").prev() end, { desc = "Buffer Goto previous" })
map("n", "]b", function() require("nvchad.tabufline").next() end, { desc = "Buffer Goto next" })

-- nvimtree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
map("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", { desc = "Nvimtree Focus window" })

-- term
map({ "n", "t" }, "<F7>", function() require("nvchad.term").toggle { pos = "sp", size = 0.6, id = "htoggleTerm" } end, { desc = "Toggle Terminal" })
map({ "n", "t" }, "<C-F7>", function() require("nvchad.term").toggle { pos = "float", float_opts = { width = 1.0, height = 0.9 }, id = "ftoggleTerm" } end, { desc = "Toggle Terminal Float" })

-- lsp
map("n", "gy", function() require("telescope.builtin").lsp_type_definitions() end, { desc = "LSP type definition" })
map("n", "<leader>fs", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, { desc = "LSP workspace symbols" })
map("n", "<leader>fm", function() require("telescope.builtin").lsp_document_symbols() end, { desc = "LSP document synbols" })
map("n", "<leader>fd", function() require("telescope.builtin").diagnostics { bufnr = 0 } end, { desc = "LSP buffer diagnostics" })
map("n", "<leader>fD", function() require("telescope.builtin").diagnostics() end, { desc = "LSP diagnostics" })
map("n", "<leader>fr", function() require("telescope.builtin").lsp_references() end, { desc = "LSP references" })
map("n", "<leader>f<CR>", function() require("telescope.builtin").resume() end, { desc = "Telescope Resume search" })
map("n", "gl", function() vim.diagnostic.open_float() end, { desc = "LSP open diagnostics" })

-- copilot chat
map("n", "<leader>cc", function() require("CopilotChat").toggle() end, { desc = "Copilot Chat" })

-- paste with leader-v
map("n", "<leader>v", "ciw<C-r>0<ESC>")
