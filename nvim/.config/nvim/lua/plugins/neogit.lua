return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Open Neogit" },
      {
        "<leader>gG",
        function()
          require("neogit").open({
            cwd = vim.fn.expand("%:p:h"),
          })
        end,
        desc = "Open Neogit (cwd)",
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    keys = {
      { "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", desc = "git history for file" },
    },
    config = true,
  },
  {
    "FabijanZulj/blame.nvim",
    keys = {
      { "<leader>gb", "<cmd>BlameToggle<cr>", desc = "git blame for file" },
    },
    config = true,
  },
}
