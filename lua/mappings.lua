require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Go to definition (Telescope)" })
map("n", "<leader>q", "<cmd>Trouble quickfix<CR>", { desc = "Open Quickfix in Trouble" })
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code Actions" })
