return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- Overwrite hte color of the separator as it's not really visible
      -- See https://github.com/catppucin/nvim
      colorscheme = function()
        local rtn = require("catppuccin")
        rtn.setup({
          color_overrides = {
            all = {
              crust = "#404040",
            },
          },
        })
        rtn.load()
      end,
    },
  },
  {
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
    opts = {
      defaults = {
        layout_strategies = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        file_ignore_patterns = { "cache", "node_modules" },
      },
    },
  },
}
