require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

-- set relativenumber
vim.wo.number = true
vim.wo.relativenumber = true

-- change shell arguments if winows
if vim.loop.os_uname().sysname == "Windows_NT" then
  o.shell = "cmd.exe /s /k \"C:\\Users\\jojongguk\\config\\windows.bat\""
end

-- highlight on yank
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")

vim.api.nvim_set_option("clipboard", "unnamed")

-- dap
vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='▶️', texthl='', linehl='', numhl=''})

-- inlay hint
vim.lsp.inlay_hint.enable(true)
