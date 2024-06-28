local get_root_dir = function(fname)
  local util = require("lspconfig.util")
  return util.root_pattern(".git")(fname) or util.root_pattern("package.json", "tsconfig.json")(fname)
end

return {
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
    },
  },
}
