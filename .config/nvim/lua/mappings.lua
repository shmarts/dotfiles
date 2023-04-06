vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

-- unbind arrow keys
vim.keymap.set({"n", "i", "v"}, "<Up>", "<nop>", { noremap = true, silent = true })
vim.keymap.set({"n", "i", "v"}, "<Down>", "<nop>", { noremap = true, silent = true })
vim.keymap.set({"n", "i", "v"}, "<Left>", "<nop>", { noremap = true, silent = true })
vim.keymap.set({"n", "i", "v"}, "<Right>", "<nop>", { noremap = true, silent = true })

-- save files
vim.keymap.set("n", "<C-S>", ":update<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-S>", "<C-C>:update<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-S>", "<C-O>:update<CR>", { noremap = true, silent = true })

-- telescope
vim.keymap.set("n", "<C-p>", ':lua require("telescope")<CR> <cmd>Telescope find_files hidden=true<cr>')
vim.keymap.set("n", "<C-S-f>", ':lua require("telescope")<CR> <cmd>Telescope live_grep<cr>')
