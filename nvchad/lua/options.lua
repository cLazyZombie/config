require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

-- set relativenumber
vim.wo.number = true
vim.wo.relativenumber = true

-- highlight on yank
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")
