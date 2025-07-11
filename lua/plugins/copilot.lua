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
        dismiss = "<C-e>",
      },
    },
    panel = { enabled = true },
    filetypes = { ["*"] = true },
  },
}
