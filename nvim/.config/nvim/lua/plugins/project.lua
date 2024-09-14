return {
  "coffebar/neovim-project",
  keys = {
    { "<leader>pp", "<cmd>Telescope neovim-project discover<cr>", desc = "Discover Project" },
    { "<leader>ph", "<cmd>Telescope neovim-project history<cr>", desc = "Project History" },
    { "<leader>pr", "<cmd>NeovimProjectRecent<cr>", desc = "Load previous session" },
  },
  opts = {
    projects = { -- define project roots
      "~/code/*",
      "~/.config/*",
      "~/.dotfiles",
    },
    -- This doesn't seem to have any effect for some reason?
    last_session_on_startup = false,
  },
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
}
