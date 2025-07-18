return {
  "norcalli/nvim-colorizer.lua",
  event = "VeryLazy",
  config = function()
    require("colorizer").setup({
      "*",
    }, {
      RGB = true,
      RRGGBB = true,
      names = true,
      RRGGBBAA = true,
      AARRGGBB = true,
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
      mode = "background",
      tailwind = true,
      sass = { enable = true },
    })
  end,
}
