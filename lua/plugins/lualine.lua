return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local codecompanion_status = {
      processing = false,
      spinner_index = 1,
      spinner_symbols = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
    }

    local group = vim.api.nvim_create_augroup("CodeCompanionHooks", { clear = true })
    vim.api.nvim_create_autocmd({ "User" }, {
      pattern = "CodeCompanionRequest*",
      group = group,
      callback = function(request)
        if request.match == "CodeCompanionRequestStarted" then
          codecompanion_status.processing = true
        elseif request.match == "CodeCompanionRequestFinished" then
          codecompanion_status.processing = false
        end
      end,
    })

    local codecompanion_component = function()
      if codecompanion_status.processing then
        codecompanion_status.spinner_index = (codecompanion_status.spinner_index % 10) + 1
        return codecompanion_status.spinner_symbols[codecompanion_status.spinner_index]
      else
        return ""
      end
    end

    local mode = {
      "mode",
      fmt = function(str)
        return " " .. str
      end,
    }
    local filename = {
      "filename",
      file_status = true,
      path = 1,
    }
    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end
    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = { error = " ", warn = " ", info = " ", hint = " " },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }
    local diff = {
      "diff",
      colored = false,
      symbols = { added = " ", modified = " ", removed = " " },
      cond = hide_in_width,
    }
    require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = "onedark",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { "branch" },
        lualine_c = { filename, codecompanion_component },
        lualine_x = {
          diagnostics,
          diff,
          { "encoding", cond = hide_in_width },
          { "filetype", cond = hide_in_width },
        },
        lualine_y = { "location" },
        lualine_z = { "progress" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { { "location", padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "fugitive" },
    }
  end,
}
