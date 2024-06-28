local function get_python_path()
  local venv_path = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
  local python_path = venv_path
      and ((vim.fn.has("win32") == 1 and venv_path .. "/Scripts/python") or venv_path .. "/bin/python")
    or nil
  return python_path
end

local function get_args()
  local argument_string = vim.fn.input("Arguments: ")
  local rtn = vim.fn.split(argument_string, " ", true)
  return rtn
end

local function get_module()
  local rtn = vim.fn.input("Module: ")
  if rtn == "" then
    return require("dap").ABORT
  end
  return rtn
end

-- local function dump(o)
--   if type(o) == "table" then
--     local s = "{ "
--     for k, v in pairs(o) do
--       if type(k) ~= "number" then
--         k = '"' .. k .. '"'
--       end
--       s = s .. "[" .. k .. "] = " .. dump(v) .. ","
--     end
--     return s .. "} "
--   else
--     return tostring(o)
--   end
-- end

return {
  "mfussenegger/nvim-dap",
  opts = function()
    local dap = require("dap")
    dap.configurations["python"] = {
      {
        type = "python",
        request = "launch",
        name = "Python: Launch module with arguments",
        pythonPath = get_python_path,
        module = get_module,
        console = "integratedTerminal",
      },
      {
        type = "python",
        request = "launch",
        name = "Python: Launch file with arguments",
        pythonPath = get_python_path,
        module = get_args,
        console = "integratedTerminal",
      },
      {
        type = "python",
        request = "launch",
        name = "Python: Launch file",
        program = "${file}",
        module = get_python_path,
        console = "integratedTerminal",
      },
    }
  end,
}
