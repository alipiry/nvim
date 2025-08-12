return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
  },
  opts = {
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "claude-sonnet-4-20250514",
              choices = {
                "claude-sonnet-4-20250514",
                "claude-3-7-sonnet",
                "claude-3-5-sonnet-20241022",
                "gpt-5",
                "gpt-4o",
              },
            },
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "copilot",
        model = "claude-sonnet-4-20250514",
        keymaps = {
          send = {
            modes = {
              n = "<CR>",
              i = "<C-s>",
            },
          },
          close = {
            modes = {
              n = "q",
              i = "<C-c>",
            },
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
      ":'<,'>CodeCompanion /buffer fix this code<cr>",
      desc = "Fix Code",
      mode = "v",
    },
    {
      "<leader>cr",
      ":'<,'>CodeCompanion /buffer refactor this code<cr>",
      desc = "Refactor Code",
      mode = "v",
    },
    {
      "<leader>cs",
      function()
        local models = {
          "claude-sonnet-4-20250514",
          "claude-3-7-sonnet",
          "claude-3-5-sonnet-20241022",
          "gpt-5",
          "gpt-4o",
        }

        vim.ui.select(models, {
          prompt = "Select model:",
          format_item = function(item)
            return item
          end,
        }, function(choice)
          if choice then
            local codecompanion = require "codecompanion"
            codecompanion.setup {
              strategies = {
                chat = { model = choice },
                inline = { model = choice },
                agent = { model = choice },
              },
            }
            vim.notify("Switched to model: " .. choice)
          end
        end)
      end,
      desc = "Switch AI Model",
      mode = "n",
    },
    {
      "<leader>cm",
      function()
        local models = {
          "claude-sonnet-4-20250514",
          "claude-3-7-sonnet",
          "claude-3-5-sonnet-20241022",
          "gpt-5",
          "gpt-4o",
        }

        vim.ui.select(models, {
          prompt = "Switch chat model:",
        }, function(choice)
          if choice then
            vim.cmd("CodeCompanionChat " .. choice)
            vim.notify("Switched chat to: " .. choice)
          end
        end)
      end,
      desc = "Switch Chat Model",
      mode = "n",
    },
  },
}
