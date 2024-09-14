local get_root_dir = function(fname)
  local util = require("lspconfig.util")
  return util.root_pattern(".git")(fname) or util.root_pattern("package.json", "tsconfig.json")(fname)
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      diagnostics = {
        -- virtual_text = false,
        virtual_text = {
          virt_text_pos = "eol",
        },
      },
      servers = {
        vtsls = {
          root_dir = get_root_dir,
          enableMoveToFileCodeAction = true,
          autoUseWorkspaceTsdk = true,
          experimental = {
            completion = {
              enableServerSideFuzzyMatch = true,
            },
          },
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
          language = "en-US",
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
  -- {
  --   "nvimdev/lspsaga.nvim",
  --   config = function()
  --     require("lspsaga").setup({})
  --   end,
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter", -- optional
  --     "nvim-tree/nvim-web-devicons", -- optional
  --   },
  -- },
  --https://git.sr.ht/~whynothugo/lsp_lines.nvim
  -- {
  --   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --   config = function()
  --     require("lsp_lines").setup()
  --   end,
  -- },
}
