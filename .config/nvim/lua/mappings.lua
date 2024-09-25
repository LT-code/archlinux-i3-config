require "nvchad.mappings"

local nomap = vim.keymap.del
nomap("i", "<C-h>")
nomap("i", "<C-l>")
nomap("i", "<C-j>")
nomap("i", "<C-k>")

local map = vim.keymap.set

--map("i", "jk", "<ESC>")
--
map("n", "<C-b>", ":buffers<CR>:buffer<Space>", { desc = "Switch between buffers" })

map("n", "<leader>gf", ":lua vim.lsp.buf.definition()<CR>", { desc = "Go to function definition" })
map("n", "<leader>e", ":lua vim.diagnostic.open_float(0, {scope=\"line\"})<CR>")

map("n", "<leader>fr", ":Telescope resume <CR>", { desc = "resume research" })
map("n", "<leader>fd", ":Telescope diagnostics <CR>", { desc = "diagnostics research" })

map("n", "<leader>fs", ":lua require('spectre').open_visual({select_word=true})<CR>", {desc = "Search and replace with current word"})
