require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")


-- Tmux Navigation Keymaps
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Tmux Navigate Left" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Tmux Navigate Down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Tmux Navigate Up" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Tmux Navigate Right" })
map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<CR>", { desc = "Tmux Navigate Previous" })
