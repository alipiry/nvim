return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<Right>",
        next = "<C-j>",
        prev = "<C-k>",
        dismiss = "<C-e>",
      },
    },
    panel = { enabled = true },
    filetypes = { ["*"] = true },
  },
}
