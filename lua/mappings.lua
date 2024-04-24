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

-- Large Language Model Keybinds
map({"n", "x"}, "<leader>lmch", ":ChatGPT<CR>", { desc = "LLM Chat" })
map({"n", "x"}, "<leader>lme", ":ChatGPTEditWithInstruction<CR>", { desc = "Edit with instruction" })
map({"n", "x"}, "<leader>lmg", ":ChatGPTRun grammar_correction<CR>", { desc = "Grammar Correction" })
map({"n", "x"}, "<leader>lmt", ":ChatGPTRun translate<CR>", { desc = "Translate" })
map({"n", "x"}, "<leader>lmk", ":ChatGPTRun keywords<CR>", { desc = "Keywords" })
map({"n", "x"}, "<leader>lmd", ":ChatGPTRun docstring<CR>", { desc = "Docstring" })
map({"n", "x"}, "<leader>lma", ":ChatGPTRun add_tests<CR>", { desc = "Add Tests" })
map({"n", "x"}, "<leader>lmo", ":ChatGPTRun optimize_code<CR>", { desc = "Optimize Code" })
map({"n", "x"}, "<leader>lms", ":ChatGPTRun summarize<CR>", { desc = "Summarize" })
map({"n", "x"}, "<leader>lmf", ":ChatGPTRun fix_bugs<CR>", { desc = "Fix Bugs" })
map({"n", "x"}, "<leader>lmx", ":ChatGPTRun explain_code<CR>", { desc = "Explain Code" })
map({"n", "x"}, "<leader>lmr", ":ChatGPTRun roxygen_edit<CR>", { desc = "Roxygen Edit" })
map({"n", "x"}, "<leader>lml", ":ChatGPTRun code_readability_analysis<CR>", { desc = "Code Readability Analysis" })
map({"n", "x"}, "<leader>lmcc", ":ChatGPTCompleteCode<CR>", { desc = "Complete Code" })

-- Telescope: Projects
map("n", "<leader>tp", ":Telescope projects<CR>", { desc = "List Projects" })


