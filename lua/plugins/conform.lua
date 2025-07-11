return {
  "stevearc/conform.nvim",
  event = { "BufWritePre", "BufNewFile" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>fc",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      rust = { "rustfmt", lsp_format = "fallback" },
      typescriptreact = {
        "eslint_d",
        "prettierd",
      },
      typescript = {
        "eslint_d",
        "prettierd",
      },
      json = {
        "prettierd",
      },
      javascript = {
        "eslint_d",
        "prettierd",
      },
      go = { "goimports", "gofumpt" },
      sh = { "shfmt" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
