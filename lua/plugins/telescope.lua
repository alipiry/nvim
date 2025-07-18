return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  build = "make",
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fa", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", desc = "Find Files (with Hidden)" },
    { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
  },
  config = function()
    local telescope = require "telescope"
    telescope.setup {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        winblend = 0,
      },
      pickers = {
        lsp_definitions = {
          reuse_win = true,
        },
        lsp_references = {
          reuse_win = true,
        },
        lsp_implementations = {
          reuse_win = true,
        },
      },
    }
    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "ui-select")

    vim.keymap.set("n", "<leader>ca", function()
      vim.lsp.buf.code_action()
    end, { desc = "Code Actions via Telescope" })
  end,
}
