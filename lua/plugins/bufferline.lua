return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup {
      options = {
        mode = "buffers",
        themeable = true,
        separator_style = "padded_slant",
        diagnostics = "nvim_lsp",
        close_command = "bdelete! %d",
        path_components = 1,
        buffer_close_icon = "x",
        max_name_length = 30,
        max_prefix_length = 30,
        tab_size = 20,
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        enforce_regular_tabs = true,
        persist_buffer_sort = true,
        show_tab_indicators = false,
        indicator = {
          style = "none",
        },
        minimum_padding = 1,
        maximum_padding = 5,
        maximum_length = 15,
        sort_by = "insert_at_end",
      },
    }
    vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
    vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
    vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
    vim.keymap.set("n", "<leader>bn", "<cmd>enew<CR>", { desc = "New buffer" })
    vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "Pin buffer" })
  end,
}
