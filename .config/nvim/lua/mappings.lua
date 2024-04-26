vim.g.mapleader = " "

local keymap = vim.keymap

-- general
keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x"')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizonitally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal
keymap.set("n", "<leader>sx", ":close<CR>") -- split windows equal

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")







keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

-- unbind arrow keys
keymap.set({"n", "i", "v"}, "<Up>", "<nop>", { noremap = true, silent = true })
keymap.set({"n", "i", "v"}, "<Down>", "<nop>", { noremap = true, silent = true })
keymap.set({"n", "i", "v"}, "<Left>", "<nop>", { noremap = true, silent = true })
keymap.set({"n", "i", "v"}, "<Right>", "<nop>", { noremap = true, silent = true })

-- save files
keymap.set("n", "<C-S>", ":update<CR>", { noremap = true, silent = true })
keymap.set("v", "<C-S>", "<C-C>:update<CR>", { noremap = true, silent = true })
keymap.set("i", "<C-S>", "<C-O>:update<CR>", { noremap = true, silent = true })

-- telescope
keymap.set("n", "<C-p>", function () require('telescope.builtin').find_files({ hidden = true }) end)
keymap.set("n", "<C-f>", function () require('telescope.builtin').live_grep() end)
