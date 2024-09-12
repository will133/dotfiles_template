return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({ cmd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
  },
  -- change some options
  opts = function()
    local actions = require("telescope.actions")
    return {
      defaults = {
        layout_strategies = "vertical",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        file_ignore_patterns = { "cache", "node_modules", ".mypy_cache" },
        path_display = {
          "truncate",
        },
        mappings = {
          i = {
            ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
            ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
            ["<c-k>"] = actions.smart_send_to_qflist,
            ["<a-k>"] = actions.smart_add_to_qflist,
            ["<c-l>"] = actions.smart_send_to_loclist,
            ["<a-l>"] = actions.smart_add_to_loclist,
          },
          n = {
            ["q"] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          theme = "ivy",
          previewer = false,
        },
      },
    }
  end,
}
