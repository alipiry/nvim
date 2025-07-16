return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
  },
  opts = {
    strategies = {
      chat = {
        adapter = "copilot",
        model = "claude-sonnet-4-20250514",
        keymaps = {
          send = {
            modes = { n = "<C-s>", i = "<C-s>" },
          },
          close = {
            modes = { n = "q", i = "<C-c>" },
          },
        },
      },
      inline = {
        adapter = "copilot",
        model = "claude-sonnet-4-20250514",
        opts = {
          auto_apply = true,
        },
      },
      agent = {
        adapter = "copilot",
        model = "claude-sonnet-4-20250514",
      },
    },
    display = {
      diff = {
        enabled = false,
      },
    },
    opts = {
      log_level = "DEBUG",
    },
  },
  keys = {
    { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion Chat", mode = "n" },
    { "<leader>cA", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions in normal mode", mode = "n" },
    { "<leader>cA", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions in visual mode", mode = "v" },
    { "<leader>cf", ":'<,'>CodeCompanion /buffer fix this code<cr>", desc = "Fix Code", mode = "v" },
    { "<leader>cr", ":'<,'>CodeCompanion /buffer refactor this code<cr>", desc = "Refactor Code", mode = "v" },
  },
}
