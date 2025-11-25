-- vim.keymap.set("n", "<leader>fv", vim.cmd.Ex)
vim.keymap.set("n", "-", "<cmd>Oil<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")


vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>P", "\"_dP")
vim.keymap.set("n", "<leader>p", "\"+p")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>chx", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })
--vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })
--vim.keymap.set("v", "<leader>x", "<cmd>lua<CR>", { desc = "Execute the current selection" })

vim.keymap.set("n", "<leader>|", "<cmd>vsplit<CR>", { desc = "Split verticaly" })
vim.keymap.set("n", "<leader>-", "<cmd>split<CR>", { desc = "Split horizontaly" })

vim.keymap.set("i", "<C-c>", "<Esc>")
