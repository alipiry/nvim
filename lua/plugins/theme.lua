return {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
  config = function()
    require("onedarkpro").setup {
      highlights = {
        ["@tag.builtin"] = { fg = "${red}" },
        ["@tag.html"] = { fg = "${red}" },
        ["@tag"] = { fg = "${red}" },

        ["@constructor"] = { fg = "${yellow}" },
        ["@type"] = { fg = "${yellow}" },
        ["@type.builtin"] = { fg = "${yellow}" },

        ["@keyword.import"] = { fg = "${purple}" },
        ["@keyword.export"] = { fg = "${purple}" },
        ["@keyword.from"] = { fg = "${purple}" },
        ["@keyword.function"] = { fg = "${purple}" },
        ["@keyword.default"] = { fg = "${purple}" },
        ["@keyword.return"] = { fg = "${purple}" },
        ["@keyword.conditional"] = { fg = "${purple}" },
        ["@keyword.repeat"] = { fg = "${purple}" },

        ["@variable"] = { fg = "${red}" },
        ["@variable.parameter"] = { fg = "${red}" },
        ["@variable.member"] = { fg = "${red}" },
        ["@variable.builtin"] = { fg = "${red}" },
        ["@function.call"] = { fg = "${red}" },
        ["@function"] = { fg = "${red}" },
        ["@method.call"] = { fg = "${red}" },
        ["@method"] = { fg = "${red}" },

        ["@tag.attribute"] = { fg = "${red}" },
        ["@property"] = { fg = "${red}" },
        ["@field"] = { fg = "${red}" },

        ["@string"] = { fg = "${green}" },
        ["@string.regexp"] = { fg = "${green}" },
        ["@string.escape"] = { fg = "${green}" },
        ["@character"] = { fg = "${green}" },

        ["@string.go"] = { fg = "${green}" },
        ["@string.import.go"] = { fg = "${green}" },
      },
    }
    vim.cmd "colorscheme onedark_dark"
  end,
}
