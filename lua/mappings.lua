require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Fugitive mappings
map("n", "<leader>gs", ":Git status<CR>", { desc = "Git Status" })
map("n", "<leader>ga", ":Git add ", { desc = "Git Add" })
map("n", "<leader>gc", ":Git commit -S -m ", { desc = "Git Commit" })
map("n", "<leader>gps", ":Git push<CR>", { desc = "Git Push" })
map("n", "<leader>gpl", ":Git pull<CR>", { desc = "Git Pull" })
map("n", "<leader>gl", ":Git log<CR>", { desc = "Git Log" })

-- Add the NvimTree toggle mapping
map("n", "<leader>tt", ":NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree" })

-- Add the trouble toggle
map("n", "<leader>tdp", ":TroubleToggle<CR>", { desc = "Toggle Diagnostics Panel" })

-- Add CodeSnap mappings for visual mode
map("x", "<leader>tc", ":<C-u>CodeSnap<CR>", { desc = "Save selected code snapshot into clipboard" })
map("x", "<leader>tcs", ":<C-u>CodeSnapSave<CR>", { desc = "Save selected code snapshot in ~/Pictures/Screenshots" })

-- Avante AI Keybinds
map({"n", "v"}, "<leader>aa", "<cmd>AvanteAsk<CR>", { desc = "Avante: Ask" })
map("v", "<leader>ae", "<cmd>AvanteEdit<CR>", { desc = "Avante: Edit" })
map("n", "<leader>ar", "<cmd>AvanteRefresh<CR>", { desc = "Avante: Refresh" })
map("n", "<leader>at", "<cmd>AvanteToggle<CR>", { desc = "Avante: Toggle" })
map("n", "<leader>an", "<cmd>AvanteChat<CR>", { desc = "Avante: New Chat" })
map("n", "<leader>as", "<cmd>AvanteSwitchProvider<CR>", { desc = "Avante: Switch Provider" })

-- Telescope: Projects
map("n", "<leader>tp", ":Telescope projects<CR>", { desc = "List Projects" })


