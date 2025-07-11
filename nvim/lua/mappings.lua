require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", ";", ":", { desc = "CMD enter command mode" }, opts)
map("i", "jk", "<ESC>", opts)

map("v", "<D-c>", '"+y', opts)
map("n", "<D-c>", "yy", opts)

-- Paste from clipboard
map("n", "<D-v>", '"+p', opts)
map("i", "<D-v>", "<C-r>+", opts)

-- Cut to cliboard
map("v", "<D-x>", '"+d', opts)
map("n", "<D-x>", "dd", opts)

-- Select all
map("n", "<D-a>", "ggVG", opts)
map("i", "<D-a>", "<Esc>ggVG", opts)

-- Delete all
map("v", "<D-BS>", "ggVGd", opts)

-- Undo and redo typing
map("n", "<D-z>", "u", opts)
map("n", "<D-S-z>", "<C-r>", opts)

-- Save and Quit
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>Q", ":q!<CR>", opts)
map("n", "<leader>x", ":wq<CR>", opts)
map("n", "<leader>wa", ":wa<CR>", opts)

-- Save and save all
map("n", "<D-s>", ":w<CR>", opts)
map("n", "<D-S-s>", ":wa<CR>", opts)

-- Move selection code
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Format on save pyton
map("n", "<leader>fm", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })
