return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason-tool-installer").setup {
      ensure_installed = {
        "stylua",
        "rustfmt",
        "prettierd",
        "eslint_d",
        "goimports",
        "gofumpt",
        "shfmt",
      },
      auto_update = false,
      run_on_start = true,
    }
  end,
}
