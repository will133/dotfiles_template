local get_root_dir = function(fname)
  local util = require("lspconfig.util")
  return util.root_pattern(".git")(fname) or util.root_pattern("package.json", "tsconfig.json")(fname)
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          root_dir = get_root_dir,
        },
        -- tsserver = {
        --   enabled = true,
        --   root_dir = get_root_dir,
        --   -- cmd = { "yarn", "typescript-language-server", "--stdio"}
        -- }
        ltex = {
          on_attach = function(_, bufnr)
            -- other on attach code
            require("ltex-utils").on_attach(bufnr)
          end,
        },
      },
    },
  },
  {
    "jhofscheier/ltex-utils.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      -- "nvim-telescope/telescope-fzf-native.nvim", -- optional
    },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
