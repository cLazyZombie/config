require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

-- set relativenumber
vim.wo.number = true
vim.wo.relativenumber = true

-- change shell arguments if winows
if vim.fn.has("windows") then 
  o.shell = "cmd.exe /s /k \"C:\\Users\\jojongguk\\config\\windows.bat\""
end

-- highlight on yank
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")
