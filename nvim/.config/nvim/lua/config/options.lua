-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ","
vim.g.localleader = ","

vim.o.splitbelow = true
vim.o.splitright = true
vim.o.compatible = false

vim.o.hidden = true
vim.opt.wildignore = vim.opt.wildignore
  + {
    "*/tmp/*",
    "*/temp*/*",
    "*.so",
    "*.o",
    "*.obj",
    "*.pyc",
    "*.pyo",
    "*.swp",
    "*.swn",
    "*/dist/*",
    "*/build/*",
    "*/lost+found/*",
  }

-- turn off line number as it can be distracting
vim.opt.relativenumber = false
vim.wo.number = false

-- Turn off virtual text for type hint
-- vim.lsp.inlay_hint.enable(false)

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.ts = 4
vim.o.sts = 4

-- Do this to make it unsafe but faster
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- Unload buffer if hidden
vim.o.bufhidden = "delete"

-- Short message getting rid of all default returns
-- vim.o.shm = "a"
vim.o.tw = 0
vim.opt.backspace = { "indent", "eol", "start" }
vim.o.wrap = false
-- Do not autowrap line by default
-- vim.opt.formatoptions = vim.opt.formatoptions - { "t" }

vim.o.ruler = true
vim.opt.iskeyword = vim.opt.iskeyword - { "(" }
vim.o.readonly = true
vim.o.magic = true
vim.o.vb = true
-- vim.o.t_vb = true
vim.o.autowrite = true
vim.o.matchtime = 4
-- Insert 2 spaces after . when joining lines
vim.o.joinspaces = true

if vim.fn.executable("rg") == 1 then
  vim.o.grepprg = "rg --vimgrep"
  vim.o.grepformat = "%f:%l:%c:%m"
elseif vim.fn.executable("ag") == 1 then
  vim.o.grepprg = "ag --nogroup --nocolor"
elseif vim.fn.executable("grep") == 1 then
  vim.o.grepprg = "grep -n"
elseif vim.fn.executable("findstr.exe") == 1 then
  vim.o.grepprg = "findstr.exe /s /n"
end

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.equalalways = false

-- Min windows height to be 0
vim.o.wmh = 0

-- Set border length for scrolling
vim.o.scrolloff = 10
vim.o.wildmenu = true
vim.o.wildmode = "longest:list"

-- Search incrementally
vim.o.incsearch = true
vim.o.clipboard = "unnamedplus"

-- Note that we need to find xclip
local function find_xclip()
  local xclip_path = "xclip"
  if vim.fn.executable(xclip_path) == 1 then
    return xclip_path
  end
  return ""
end

local function is_in_wsl()
  return (vim.env.WSL_DISTRO_NAME ~= nil)
end

if is_in_wsl() then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
else
  local xclip_path = find_xclip()
  if xclip_path ~= "" then
    vim.g.clipboard = {
      name = "myClipboard",
      copy = {
        ["+"] = { xclip_path, "-sel", "clipboard" },
        ["*"] = { xclip_path, "-sel", "clipboard" },
      },
      paste = {
        ["+"] = { xclip_path, "-out", "-sel", "clipboard" },
        ["*"] = { xclip_path, "-out", "-sel", "clipboard" },
      },
    }
  end
end

-- No highlight Search
vim.o.hls = false

-- Syntax
vim.o.showmatch = true
vim.o.showmode = true

-- max line for syntax highlighting
vim.o.synmaxcol = 256

-- Folding
vim.o.fillchars = "vert:|,fold:."

-- It's ultra annoying as other plugins keep turning this off
-- vim.o.autochdir = true

-- lsp configuration.  Unfortunately there's somewhere else that it's overriding the virtual_text so
-- this is not effective.
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  float = {
    border = "single",
    format = function(diagnostic)
      return string.format(
        "%s (%s) [%s]",
        diagnostic.message,
        diagnostic.source,
        diagnostic.code or diagnostic.user_data.lsp.code
      )
    end,
  },
})
