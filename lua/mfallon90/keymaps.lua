local opts = { noremap = true, silent = true }	-- pass these as options
local keymap = vim.api.nvim_set_keymap			-- shorthand for remap functions

-- change leader key to space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- navigate windows
keymap("n", "<C-h>", "<C-w>h", opts)			-- navigate split left
keymap("n", "<C-j>", "<C-w>j", opts)			-- navigate split down
keymap("n", "<C-k>", "<C-w>k", opts)			-- navigate split up
keymap("n", "<C-l>", "<C-w>l", opts)			-- navigate split right

-- resize buffers
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)

-- open explorer to 30% of window size
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- return to normal mode from insert
keymap("i", "kj", "<Esc>", opts)
keymap("i", "jk", "<Esc>", opts)

-- move chunks of text in visual mode
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- telescope keybinds
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({previewer = false}))<CR>", opts)
keymap("n", "<leader>/", "<cmd>Telescope live_grep<CR>", opts)
