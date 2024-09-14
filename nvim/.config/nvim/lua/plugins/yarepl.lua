return {
  "milanglacier/yarepl.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>rs",
      "<Plug>(REPLStart)",
      desc = "Start the repl",
    },
    {
      "<leader>rh",
      "<Plug>(REPLHide)",
      desc = "Hide the repl",
    },
    {
      "<leader>rF",
      "<Plug>(REPLFocus)",
      desc = "Fous on the repl",
    },
    { "<leader>rv", "<CMD>Telescope REPLShow<CR>", desc = "View REPLs in telescope" },
    { "<leader>rh", "<Plug>(REPLHide)", desc = "Hide REPL" },
    { "<leader>rr", "<Plug>(REPLSendLine)", desc = "Send line to REPL" },
    { "<leader>rr", "<Plug>(REPLSendVisual)", desc = "Send visual to REPL", mode = "v" },

    { "<leader>re", "<Plug>(REPLExec)", desc = "Execute command in REPL", expr = true },
    { "<leader>rq", "<Plug>(REPLClose)", desc = "Execute command in REPL", expr = true },
    { "<leader>rc", "<CMD>REPLCleanup<CR>", desc = "Clear REPLs" },
    { "<leader>rS", "<CMD>(REPLSwap)<CR>", desc = "Swap REPLs" },
    { "<leader>ra", "<CMD>(REPLAttachBufferToREPL<CR>", desc = "Attach current buffer to REPL" },
    { "<leader>rd", "<CMD>(REPLDetachBufferToREPL<CR>", desc = "Detach current buffer to REPL" },
  },
  config = function()
    local function get_python()
      if vim.fn.executable("ipython") == 1 then
        return { "ipython", "--no-banner", "--no-autoindent", "--no-confirm-exit" }
      else
        return { "python" }
      end
    end
    local yarepl = require("yarepl")
    yarepl.setup({
      buflisted = true,
      scratch = true,
      ft = "REPL",
      wincmd = "belowright 20 split",
      metas = {
        ipython = { cmd = get_python, formatter = yarepl.formatter.bracketed_pasting },
        python = { cmd = get_python, formatter = yarepl.formatter.bracketed_pasting },
      },
      close_on_exit = true,
      scroll_to_bottom_after_sending = true,
      os = {
        -- hack for windows
        windows = {
          send_delayed_cr_after_sending = true,
        },
      },
    })
    require("telescope").load_extension("REPLShow")
  end,
}
