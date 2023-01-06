require("toggleterm").setup{
    direction = 'float',
    start_in_insert = true,
    open_mapping = [[<F7>]],
    insert_mappings = true,
    terminal_mappings = true,
}

vim.keymap.set('t', '<F7>', [[<C-\><C-n>:ToggleTerm<Cr>]])
