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
            -- mocha = {
            --   base = "#000000",
            --   mantle = "#000000",
            --   crust = "#000000",
            -- },
          },
        })
        rtn.load()
      end,
    },
  },
}
