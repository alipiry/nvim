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
            modes = { n = "<CR>", i = "<C-s>" },
          },
          close = {
            modes = { n = "q", i = "<C-c>" },
          },
        },
      },
      inline = {
        adapter = "copilot",
        model = "claude-sonnet-4-20250514",
      },
      agent = {
        adapter = "copilot",
        model = "claude-sonnet-4-20250514",
      },
    },
    opts = {
      log_level = "DEBUG",
    },
  },

  keys = {
    {
      "<leader>cc",
      "<cmd>CodeCompanionChat Toggle<cr>",
      desc = "Toggle CodeCompanion Chat",
      mode = "n",
    },
    {
      "<leader>cA",
      "<cmd>CodeCompanionActions<cr>",
      desc = "CodeCompanion Actions in normal mode",
      mode = "n",
    },
    {
      "<leader>cA",
      "<cmd>CodeCompanionActions<cr>",
      desc = "CodeCompanion Actions in visual mode",
      mode = "v",
    },
    {
      "<leader>cf",
      ":CodeCompanion /buffer fix this code<cr>",
      desc = "Fix Code",
      mode = "v",
    },
    {
      "<leader>cr",
      ":CodeCompanion /buffer refactor this code<cr>",
      desc = "Refactor Code",
      mode = "v",
    },
    {
      "<leader>i",
      ":CodeCompanion ",
      desc = "CodeCompanion",
      mode = "v",
    },
    {
      "<leader>cm",
      function()
        vim.ui.select({
          "claude-sonnet-4-20250514",
          "claude-opus-4-20250514",
          "claude-3-7-sonnet-20250219",
          "gpt-5",
          "gpt-5-mini",
          "gpt-5-nano",
          "gpt-4o",
          "gpt-4.1",
        }, { prompt = "Select model:" }, function(choice)
          if choice then
            require("codecompanion").setup {
              strategies = {
                chat = { adapter = "copilot", model = choice },
                inline = {
                  adapter = "copilot",
                  model = choice,
                },
                agent = {
                  adapter = "copilot",
                  model = choice,
                },
              },
            }
          end
        end)
      end,
      desc = "Switch CodeCompanion Model",
      mode = "n",
    },
  },
}
