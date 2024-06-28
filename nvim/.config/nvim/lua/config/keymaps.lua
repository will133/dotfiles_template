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

-- @: repeats macro
-- Tab: Indent
vim.keymap.set("x", "<Tab>", ">")
-- Shift-Tab: Unindent
vim.keymap.set("x", "<s-Tab>", "<")

-- Normal Mode Ctrl Key
-- c-q: Visual block mode
-- c-w: Window management
-- c-e: Expand current window vertically
vim.keymap.set("n", "<C-e>", "<cmd>vertical resize +15<cr>")
-- c-r:
-- c-t: pop stack
-- c-y:
-- c-u: location list previous
vim.keymap.set("n", "<C-u>", "<cmd>lprev<cr>")
-- c-i: location list next
vim.keymap.set("n", "<C-i>", "<cmd>lnext<cr>")
-- c-o:
-- c-p: Previous error in error list
vim.keymap.set("n", "<c-p>", "<cmd>cp<cr>")
-- c-[: Esc
-- c-]: Go forward in tag stack
-- c-\:
-- c-a:
-- c-s:
-- c-f: find_files with root
vim.keymap.set("n", "<c-f>", LazyVim.pick("files"), {})
-- c-g: diffget and go to next error
vim.keymap.set("n", "<c-g>", "<cmd>diffget<cr>]czz")
-- c-h: Move to window on left
vim.keymap.set("n", "<c-h>", "<c-w>h")
-- c-j: Move to window on the bottom
vim.keymap.set("n", "<c-j>", "<c-w>j")
-- c-k: Move to window on the top
vim.keymap.set("n", "<c-k>", "<c-w>k")
-- c-k: Move to window on the right
vim.keymap.set("n", "<c-l>", "<c-w>l")
-- c-;: vim can't map this?
-- c-;: vim can't map this?
-- c-z: Command key for tmux
-- c-x:
-- c-v: Default block visual mode
-- c-b: Contract current window vertically
vim.keymap.set("n", "<c-b>", "<cmd>vertical resize -15<cr>")
-- c-n: Next error in error list
vim.keymap.set("n", "<c-n>", "<cmd>cn<cr>")
-- c-m: Same as Enter
-- c-,: vim can't map
-- c-.: vim can't map
-- c-/:

-- Insert Mode Ctrl Key
-- c-q: Quoted insert.
vim.keymap.set("i", "<c-w>", "<c-g>u<c-w>")
-- c-e: Go to end of line
vim.keymap.set("i", "<c-e>", "<esc>A")
-- c-r:
-- c-t: Indent shiftwidth
-- c-y: Insert char above cursor
-- c-u: Delete till beginning of line, create undo point
vim.keymap.set("i", "<c-u>", "<c-g>u<c-u>")
-- c-i: Tab
-- c-o: Execute one normal mode command
-- c-p: Autocomplete previous
-- c-a: Go to beginning of line
vim.keymap.set("i", "<c-a>", "<esc>I")
-- c-s:
-- c-d: Unindent shiftwidth
-- c-f: Move cursor left
vim.keymap.set("i", "<c-f>", "<Left>")
-- c-g: Move cursor right
-- This doesn't delete word
-- vim.keymap.set("i", "<c-h>", "<c-o>b")
vim.keymap.set("i", "<c-h>", "<c-w>")
-- c-j: Move cursor down
vim.keymap.set("i", "<c-j>", function()
  return vim.fn.pumvisible() == 1 and "<c-e><Down>" or "<Down>"
end, { expr = true })
-- c-j: Move cursor up
vim.keymap.set("i", "<c-k>", function()
  return vim.fn.pumvisible() == 1 and "<c-e><Up>" or "<Up>"
end, { expr = true })
-- c-l: Move word right
vim.keymap.set("i", "<c-l>", "<c-o>w")
-- c-z: Command key for tmux
-- c-x:
-- c-c:
-- c-v: Paste
vim.keymap.set("i", "<c-v>", "<c-g>u<c-o>gP")

-- Visual Mode Key
-- K: run telescope on the selected word
vim.keymap.set("v", "K", LazyVim.pick("grep_string", { word_match = "-w" }))

-- Terminal Mode
-- <F1>: go to the next window as I can't use the ctrl-jk key etc
vim.keymap.set("t", "<F1>", "<c-w>N")
