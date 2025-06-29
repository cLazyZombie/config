require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

-- set relativenumber
vim.wo.number = true
vim.wo.relativenumber = true

-- change shell arguments if winows
if vim.loop.os_uname().sysname == "Windows_NT" then
  -- o.shell = "cmd.exe /s /k \"C:\\Users\\jojongguk\\config\\windows.bat\""
  o.shell = "C:\\Users\\jojongguk\\config\\cmd.bat"
end

-- highlight on yank
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")

-- vim.api.nvim_set_option("clipboard", "unnamedplus")

-- dap
vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='▶️', texthl='', linehl='', numhl=''})

-- inlay hint
vim.lsp.inlay_hint.enable(true)

-- no auto wrap
-- :h fo-table for more options
-- for rustaceanvim, on_attach function also removes 't' and 'c' from formatoptions
vim.opt.formatoptions:remove("t")
vim.opt.formatoptions:remove("c")
