return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
  },
  build = "make",
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fw", "<cmd>Telescope live_grep<cr>",  desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Help Tags" },
  },
  config = function()
    local telescope = require "telescope"
    telescope.setup {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        winblend = 0,
      },
      pickers = {
        lsp_definitions = {
          reuse_win = true,
        },
        lsp_references = {
          reuse_win = true,
        },
        lsp_implementations = {
          reuse_win = true,
        },
      },
    }
    pcall(telescope.load_extension, "fzf")

    vim.ui.select = function(items, opts, on_choice)
      local pickers = require("telescope.pickers")
      local finders = require("telescope.finders")
      local conf = require("telescope.config").values
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      pickers.new(opts or {}, {
        prompt_title = opts and opts.prompt or "Select",
        finder = finders.new_table {
          results = items,
          entry_maker = function(entry)
            return {
              value = entry,
              display = tostring(entry),
              ordinal = tostring(entry),
            }
          end,
        },
        sorter = conf.generic_sorter(opts or {}),
        attach_mappings = function(prompt_bufnr, map)
          actions.select_default:replace(function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            if selection then
              on_choice(selection.value, selection.index)
            else
              on_choice(nil, nil)
            end
          end)
          return true
        end,
      }):find()
    end
  end,
}
