require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Fugitive mappings
map("n", "<leader>gs", ":Git status<CR>", { desc = "Git Status" })
map("n", "<leader>ga", ":Git add", { desc = "Git Add" })
map("n", "<leader>gc", ":Git commit", { desc = "Git Commit" })
map("n", "<leader>gps", ":Git push<CR>", { desc = "Git Push" })
map("n", "<leader>gpl", ":Git pull<CR>", { desc = "Git Pull" })
map("n", "<leader>gl", ":Git log<CR>", { desc = "Git Log" })
