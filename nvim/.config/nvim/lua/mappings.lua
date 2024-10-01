require "nvchad.mappings"

-- add yours here
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", ";", ":", { desc = "CMD enter command mode" })
keymap("i", "jk", "<ESC>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- move buffer right
require("nvchad.tabufline").move_buf(1)
-- move buffer left
require("nvchad.tabufline").move_buf(-1)
