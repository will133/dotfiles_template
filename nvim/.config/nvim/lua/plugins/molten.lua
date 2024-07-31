return {
  "benlubas/molten-nvim",
  -- version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  build = ":UpdateRemotePlugins",
  init = function()
    -- this is an example, not a default. Please see the readme for more configuration options
    vim.g.molten_output_win_max_height = 12
  end,
}
-- return {
--   "luk400/vim-jukit",
--   init = function()
--     vim.g.jukit_inline_plotting = 0
--   end,
-- }
-- return {
--   "SUSTech-data/neopyter",
--   ---@type neopyter.Option
--   opts = {
--     -- mode = "direct",
--     mode = "proxy",
--     remote_address = "127.0.0.1:9001",
--     file_pattern = { "*.ju.*" },
--     on_attach = function(bufnr)
--       -- do some buffer keymap
--     end,
--     highlight = {
--       enable = true,
--       shortsighted = false,
--     },
--   },
-- }
