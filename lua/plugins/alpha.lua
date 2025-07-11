return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require "alpha"
    local dashboard = require "alpha.themes.dashboard"
    dashboard.section.header.val = {
      "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
      "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
      "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
      "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
    }
    dashboard.section.buttons.val = {
      dashboard.button("e", "📁  Open File Tree", ":Neotree toggle<CR>"),
      dashboard.button("f", "🔍 Find File", ":Telescope find_files<CR>"),
      dashboard.button("n", "📄 New File", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "🕑 Recent Files", ":Telescope oldfiles<CR>"),
      dashboard.button("g", "🔎 Find Text", ":Telescope live_grep<CR>"),
      dashboard.button("q", "⏻ Quit", ":qa<CR>"),
    }
    dashboard.section.footer.val = "🚀 Ready to build something awesome!"
    dashboard.section.footer.opts.hl = "Type"
    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      callback = function()
        vim.cmd [[
                  autocmd BufEnter * ++once if &filetype !=# 'alpha' | silent! bdelete! 1 | endif
                ]]
      end,
    })
    alpha.setup(dashboard.opts)
  end,
}
