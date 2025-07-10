return {
  "saghen/blink.cmp",
  opts = {
    sources = { default = { "lsp", "path", "snippets", "buffer" } },
    keymap = {
      ["<Tab>"] = { "select_next" },
      ["<S-Tab>"] = { "select_prev" },
      ["<CR>"] = { "accept" },
    },
  },
}
