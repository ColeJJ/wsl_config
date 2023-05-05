vim.g.mapleadr = " "

-- while in normal mode "n" and pressing leader pv it will execute the command vim.cmd.Ex
vim.keymap.set("n", "<space>t", vim.cmd.Ex)

-- move lines above or down in v mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- halfway jumping -> change keybindings
vim.keymap.set("n", "gj", "<C-d>zz")
vim.keymap.set("n", "gk", "<C-u>zz")

-- pasting without loosing the buffer
vim.keymap.set("x", "<space>p", "\"_dP")

-- prevent from pressing capital Q
vim.keymap.set("n", "Q", "<nop>")