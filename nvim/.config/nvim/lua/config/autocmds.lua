-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- For some reason the ftplugins doesn't seem to work with lazyvim, we're doing these through
-- autocmds instead
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    -- vim.o.linebreak = true
    -- This corresponds to stylua's default column width of 120.  Comments with 120 seems a little too
    -- wide comparing to code, so I'll set it to 100 for now.
    vim.opt_local.colorcolumn = { 121 }
    vim.opt_local.tw = 100
    vim.opt_local.shiftwidth = 2
  end,
})
