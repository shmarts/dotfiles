vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- telescope
vim.keymap.set("n", "<leader>ff", ':lua require("telescope")<CR> <cmd>Telescope find_files<cr>', opts)
vim.keymap.set("n", "<leader>fg", ':lua require("telescope")<CR> <cmd>Telescope live_grep<cr>', opts)
