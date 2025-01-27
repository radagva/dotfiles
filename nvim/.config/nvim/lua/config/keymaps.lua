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

-- buffers
map("n", "<leader>bd", "<cmd>bdelete<CR>", opts({ desc = "Delete current buffer" }))
map("n", "<leader>bo", function()
	local bufs = vim.api.nvim_list_bufs()
	local current_buf = vim.api.nvim_get_current_buf()
	for _, i in ipairs(bufs) do
		if i ~= current_buf then
			vim.api.nvim_buf_delete(i, {})
		end
	end
end, opts({ desc = "Delete all buffers but current" }))
map("n", "<S-l>", "<cmd>bnext<CR>", opts({ desc = "Go to next buffer" }))
map("n", "<S-h>", "<cmd>bprev<CR>", opts({ desc = "Go to prev buffer" }))
