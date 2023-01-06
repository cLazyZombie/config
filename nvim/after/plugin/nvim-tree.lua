-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  reload_on_bufenter = false,
  actions = {
      open_file = {
          quit_on_open = true,
      },
  },
  tab = {
      sync = {
          open = true,
          close = true,
      },
  },
  update_focused_file = {
      enable = true,
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeFocus)
