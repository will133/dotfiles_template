return {
  "Vigemus/iron.nvim",
  keys = {
    {
      "<leader>rs",
      "<cmd>IronRepl<cr>",
      desc = "Start the repl",
    },
    {
      "<leader>rR",
      "<cmd>IronRestart<cr>",
      desc = "Restart the repl",
    },
    {
      "<leader>rh",
      "<cmd>IronHide<cr>",
      desc = "Hide the repl",
    },
    {
      "<leader>rF",
      "<cmd>IronFocus<cr>",
      desc = "Fous on the repl",
    },
  },
  config = function()
    require("iron.core").setup({
      config = {
        -- Whether a repl should be discarded
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          python = {
            command = function(_)
              local ipy_bin = "ipython"
              local py_bin = "python"
              if vim.fn.executable(ipy_bin) then
                return { "ipython", "--no-autoindent", "--no-confirm-exit" }
              end
              if vim.fn.executable(py_bin) then
                return { "python" }
              end
            end,
          },
        },
      },
      keymaps = {
        send_motion = "<leader>rc",
        visual_send = "<leader>rr",
        send_line = "<leader>rr",
        send_file = "<leader>rf",
        send_paragraph = "<leader>rp",
        send_until_cursor = "<leader>ru",
        send_mark = "<leader>rm",
        -- mark_motion = "<leader>mc",
        -- mark_visual = "<leader>mc",
        -- remove_mark = "<leader>md",
        cr = "<leader>r<cr>",
        interrupt = "<leader>r<space>",
        exit = "<Leader>rq",
        clear = "<Leader>rx",
      },
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true,
    })
  end,
}
