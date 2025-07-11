return {
  "ray-x/lsp_signature.nvim",
  event = "LspAttach",
  config = function()
    require("lsp_signature").setup {
      bind = true,
      floating_window = true,
      hint_enable = false,
      handler_opts = {
        border = "rounded",
      },
    }
  end,
}
