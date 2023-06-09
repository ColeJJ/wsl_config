 local mark = require("harpoon.mark")
 local ui = require("harpoon.ui")

 vim.keymap.set("n", "<space>ha", mark.add_file)
 vim.keymap.set("n", "<space>he", ui.toggle_quick_menu)

 vim.keymap.set("n", "<space>h1", function() ui.nav_file(1) end)
 vim.keymap.set("n", "<space>h2", function() ui.nav_file(2) end)
 vim.keymap.set("n", "<space>h3", function() ui.nav_file(3) end)
 vim.keymap.set("n", "<space>h4", function() ui.nav_file(4) end)
 vim.keymap.set("n", "<space>h5", function() ui.nav_file(5) end)
 vim.keymap.set("n", "<space>h6", function() ui.nav_file(6) end)