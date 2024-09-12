if require("nvim-treesitter.parsers").has_parser("python") then
  local folds_query = [[
  [
    (class_definition)
    (function_definition)
    (string)
  ] @fold
  ]]
  require("vim.treesitter.query").set("python", "folds", folds_query)
end

vim.opt_local.foldlevel = 0
