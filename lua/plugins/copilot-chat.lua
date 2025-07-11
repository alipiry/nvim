return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "zbirenbaum/copilot.lua" },
    { "nvim-lua/plenary.nvim", branch = "master" },
  },
  opts = {
    debug = false,
    show_help = true,
    model = "claude-sonnet-4",
    prompts = {
      Explain = "Please explain how the following code works.",
      Review = "Please review the following code and provide suggestions for improvement.",
      Tests = "Please explain how the selected code works, then generate unit tests for it.",
      Refactor = "Please refactor the following code to improve its clarity and readability.",
      FixCode = "Please fix the following code to make it work as intended.",
      FixError = "Please explain the error in the following text and provide a solution.",
      BetterNamings = "Please provide better names for the following variables and functions.",
      Documentation = "Please provide documentation for the following code.",
      SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
      SwaggerJSDoc = "Please write JSDoc for the following API using Swagger.",
      Summarize = "Please summarize the following text.",
      Spelling = "Please correct any grammar and spelling errors in the following text.",
      Wording = "Please improve the grammar and wording of the following text.",
      Concise = "Please rewrite the following text to make it more concise.",
    },
  },
  config = function(_, opts)
    local chat = require "CopilotChat"
    local select = require "CopilotChat.select"

    chat.setup(opts)

    vim.keymap.set("n", "<leader>cc", function()
      chat.toggle()
    end, { desc = "CopilotChat - Toggle" })

    vim.keymap.set("n", "<leader>cr", function()
      chat.reset()
    end, { desc = "CopilotChat - Reset" })

    vim.keymap.set("n", "<leader>ce", function()
      chat.ask("Explain how this code works.", { selection = select.visual })
    end, { desc = "CopilotChat - Explain code" })

    vim.keymap.set("n", "<leader>co", function()
      chat.ask("Optimize this code.", { selection = select.visual })
    end, { desc = "CopilotChat - Optimize code" })

    vim.keymap.set("n", "<leader>cd", function()
      chat.ask("Please add documentation for this code.", { selection = select.visual })
    end, { desc = "CopilotChat - Add documentation" })

    vim.keymap.set("v", "<leader>ce", function()
      chat.ask("Explain this code.", { selection = select.visual })
    end, { desc = "CopilotChat - Explain selection" })

    vim.keymap.set("v", "<leader>cf", function()
      chat.ask("Fix this code.", { selection = select.visual })
    end, { desc = "CopilotChat - Fix selection" })

    vim.keymap.set("v", "<leader>co", function()
      chat.ask("Optimize this code.", { selection = select.visual })
    end, { desc = "CopilotChat - Optimize selection" })

    vim.keymap.set("v", "<leader>cr", function()
      chat.ask("Refactor this code.", { selection = select.visual })
    end, { desc = "CopilotChat - Refactor selection" })

    vim.keymap.set("n", "<leader>cq", function()
      local input = vim.fn.input "Quick Chat: "
      if input ~= "" then
        chat.ask(input)
      end
    end, { desc = "CopilotChat - Quick chat" })

    vim.keymap.set("n", "<leader>cm", function()
      vim.ui.select({
        "claude-sonnet-4",
        "claude-3.7-sonnet",
        "claude-3.5-sonnet",
        "gpt-4o",
        "gpt-4o-mini",
        "gpt-4",
        "gpt-4-turbo",
        "gemini-2.5-pro",
      }, {
        prompt = "Select AI Model:",
      }, function(choice)
        if choice then
          require("CopilotChat").setup { model = choice }
          vim.notify("Switched to model: " .. choice)
        end
      end)
    end, { desc = "CopilotChat - Select Model" })
  end,
}
