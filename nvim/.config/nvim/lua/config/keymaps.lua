local map = vim.keymap.set
vim.g.mapleader = " "

map("n", "<leader>pv", vim.cmd.Ex)
map("n", "<leader>rrrr", ":luafile ~/.config/nvim/lua/config/keymaps.lua<CR>", { desc = "Reload keymaps" })

map("n", "Q", "<nop>")
map("x", "<leader>p", [["_dP]])
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", '"_d')

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

map("n", "<C-d>", "<C-d>zz", { desc = "Move down half a page", remap = true })
map("n", "<C-u>", "<C-u>zz", { desc = "Move up half a page", remap = true })

map("n", "n", "nzzzv", { desc = "Find next", remap = true })
map("n", "N", "Nzzzv", { desc = "Find prev", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Terminal
map("n", "<leader>fT", function()
   Snacks.terminal()
end, { desc = "Terminal (cwd)" })

