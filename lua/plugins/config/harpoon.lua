local harpoon = require "harpoon"

harpoon.setup {}

-- Keybindings
vim.keymap.set("n", "<leader>ha", function()
    harpoon:list():add()
end, { desc = "[H]arpoon [A]dd file" })

vim.keymap.set("n", "<leader>hm", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "[H]arpoon [M]enu" })

vim.keymap.set("n", "<leader>hn", function()
    harpoon:list():next()
end, { desc = "[H]arpoon [N]ext file" })

vim.keymap.set("n", "<leader>hp", function()
    harpoon:list():prev()
end, { desc = "[H]arpoon [P]revious file" })

vim.keymap.set("n", "<leader>h1", function()
    harpoon:list():select(1)
end, { desc = "[H]arpoon [1]st file" })

vim.keymap.set("n", "<leader>h2", function()
    harpoon:list():select(2)
end, { desc = "[H]arpoon [2]nd file" })

vim.keymap.set("n", "<leader>h3", function()
    harpoon:list():select(3)
end, { desc = "[H]arpoon [3]rd file" })

vim.keymap.set("n", "<leader>h4", function()
    harpoon:list():select(4)
end, { desc = "[H]arpoon [4]th file" })

vim.keymap.set("n", "<leader>hr", function()
    harpoon:list():remove()
end, { desc = "[H]arpoon [R]emove file" })
