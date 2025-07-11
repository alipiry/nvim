return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup {
      size = 20,
      open_mapping = [[<C-\>]],
      direction = "float",
      float_opts = {
        border = "curved",
        winblend = 0,
      },
      shade_terminals = true,
      start_in_insert = true,
      shell = vim.env.SHELL or vim.o.shell,
      shellcmdflag = " -l -c ",
    }
  end,
}
