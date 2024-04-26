require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({"n", "i", "v"}, "<C-s>", "<cmd> w <CR><ESC>")

-- buffer prev/next
map("n", "[b", function() require("nvchad.tabufline").prev() end, { desc = "Buffer Goto previous" })
map("n", "]b", function() require("nvchad.tabufline").next() end, { desc = "Buffer Goto next" })

-- nvimtree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
map("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", { desc = "Nvimtree Focus window" })

-- term
map({"n", "t" }, "<F7>", 
  function() require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" } end, 
  { desc = "Toggle Terminal" }
)
