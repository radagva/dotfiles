local spread = require("config.utils").spread
local map = vim.keymap.set
local opts = spread({ noremap = true, silent = true })

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- save file with ctrl + s
map({ "n", "i" }, "<C-s>", "<cmd>w<CR><Esc>", opts({}))

-- for better copying and pasting
map("n", "x", '"_x', opts({}))
map("v", "p", '"_dP', opts({}))

-- for finding and moving up and down
map("n", "<C-d>", "<C-d>zz", opts({}))
map("n", "<C-u>", "<C-u>zz", opts({}))
map("n", "n", "nzzzv", opts({}))
map("n", "n", "Nzzzv", opts({}))

-- window resizing
map("n", "<Up>", ":resize -2<CR>", opts({}))
map("n", "<Down>", ":resize +2<CR>", opts({}))
map("n", "<Left>", ":vertical resize -2<CR>", opts({}))
map("n", "<Right>", ":vertical resize +2<CR>", opts({}))

-- window management
map("n", "<leader>|", "<C-w>v", opts({ silent = false, desc = "Open new V split" }))
map("n", "<leader>-", "<C-w>s", opts({ silent = false, desc = "Open new H Split" }))

-- move between buffers
map("n", "<C-h>", ":wincmd h<CR>", opts({}))
map("n", "<C-j>", ":wincmd j<CR>", opts({}))
map("n", "<C-k>", ":wincmd k<CR>", opts({}))
map("n", "<C-l>", ":wincmd l<CR>", opts({}))

-- for better indentation
map("v", "<", "<gv", opts({}))
map("v", ">", ">gv", opts({}))

-- for diagnosis
map("n", "[d", vim.diagnostic.goto_prev, opts({ silent = false, desc = "go to prev diagnosis" }))
map("n", "]d", vim.diagnostic.goto_next, opts({ silent = false, desc = "go to next diagnosis" }))
map("n", "]do", vim.diagnostic.open_float, opts({ silent = false, desc = "Open floating diagnosis message" }))
map("n", "]dl", vim.diagnostic.setloclist, opts({ silent = false, desc = "Open diagnosis list" }))

-- buffers
map("n", "<leader>bd", "<cmd>bdelete<CR>", opts({ desc = "Delete current buffer" }))
map("n", "<S-l>", "<cmd>bnext<CR>", opts({ desc = "Go to next buffer" }))
map("n", "<S-h>", "<cmd>bprev<CR>", opts({ desc = "Go to prev buffer" }))
