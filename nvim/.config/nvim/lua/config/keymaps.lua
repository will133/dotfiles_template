-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- toggle between paste and nopaste mode
-- vim.o.pastetoggle = "<F2>"

-- Make this more similar to vscode for debugging mode using dap

-- continue
vim.keymap.set("n", "<F5>", function()
  require("dap").continue()
end)

-- stop
vim.keymap.set("n", "<S-F5>", function()
  require("dap").terminate()
end)

-- hover variable
vim.keymap.set("n", "<F8>", function()
  local widgets = require("dap.ui.widgets")
  widgets.hover()
end)

-- toggle breakpoint
vim.keymap.set("n", "<F9>", function()
  require("dap").toggle_breakpoint()
end)

-- Step into
vim.keymap.set("n", "<F10>", function()
  require("dap").step_over()
end)

-- Step into
vim.keymap.set("n", "<F11>", function()
  require("dap").step_into()
end)

-- Step out
vim.keymap.set("n", "<S-F11>", function()
  require("dap").step_out()
end)

-- Leader normal
vim.keymap.set("n", "<Leader>v", LazyVim.pick.config_files())

-- Command
vim.keymap.set("c", "<c-a>", "<home>")
vim.keymap.set("c", "<c-e>", "<end>")

-- Move left/right by word
vim.keymap.set("c", "<c-h>", "<s-left>")
vim.keymap.set("c", "<c-l>", "<s-right>")

-- c-j/k/f/g to move around
vim.keymap.set("c", "<c-j>", "<down>")
vim.keymap.set("c", "<c-k>", "<up>")
vim.keymap.set("c", "<c-f>", "<left>")
vim.keymap.set("c", "<c-g>", "<right>")

-- Paste
vim.keymap.set("c", "<c-v>", "<c-r>")

-- Normal
-- w: Move word forward
-- e: Move to end of word
-- r: Replace single char
-- t: Find till
-- y: Yank
-- u: Undo
-- i: Insert before cursor
-- o: Insert line below cursor
-- p: Paste

-- dd: yank single line, retain its original behavior
vim.keymap.set("n", "dd", "dd")
-- f: find next char
-- g: Many functions
-- h: left
-- j: downk: Up
-- l: right;:
-- ': Go to mark
-- z: Many functions
-- x: Delete char
-- c: substitute
-- v: Visual mode
-- b: Move word backward
-- n: nextm: Marks
-- ,: Leader.: Repeat last Command/: Search
-- Tab:
-- Space: Scroll down a pastetoggle
vim.keymap.set("n", "<Space>", "<PageDown>")

vim.keymap.set("n", "Q", "gq")
vim.keymap.set("v", "Q", "gq")

-- W: Move word forward
-- E: Move to end of word forward
vim.keymap.set("n", "E", "<cmd>resize +15<CR>")
-- R: Replace mode
-- T: Finds till backwards
vim.keymap.set("n", "Y", "yy")
-- U: redo since u means undo
vim.keymap.set("n", "U", "<cmd>redo<cr>")
-- I: Insert at beginning of line
-- O: Insert line above
-- P: Paste above line
-- {: Beginning of paragraph
-- }: End of paragraph
-- _: Quick horizontal splits
vim.keymap.set("n", "_", "<cmd>sp<cr>")
-- |: Quick verital split
vim.keymap.set("n", "<bar>", "<cmd>vsp<cr>")
-- A: Insert at the end of line
-- S: Seek backward
-- D: Deletes till end of line
-- F: Finds backwards
-- G: Go to end of config_files
-- H: Go to beginning of buffer
-- J: Join text
-- K: lookup word
-- L: Go to end of config_files
-- *: Handles registers
-- Z:
-- X: Deletes char backward
-- C: Delete rest of line and go to insert mode
-- V: Visual line mode
-- B: Move word backward
vim.keymap.set("n", "B", "<cmd>resize -15<cr>")
-- N: Find next backward
-- M: Move cursor to mid screen
-- <: Indent left
-- >: Indent right
-- ?: Search backwards
-- -: Contract the fold
vim.keymap.set("n", "-", "zm")
-- +: Expand the fold
vim.keymap.set("n", "+", "zr")

-- Visual mode
-- y: Yank and go to the end of selection
vim.keymap.set("x", "y", "y']")
-- p: Paste in visual model should not replace the default register with deleted text
vim.keymap.set("x", "p", '"_dP')
-- \:
-- <Backspace>: Delete selected and go into insert mode
vim.keymap.set("x", "<bs>", "c")
