local cmd = vim.cmd
local function run_command(cmd)
  local handle = io.popen(cmd .. " 2>&1")
  local output = handle:read("*all")
  local status = handle:close()
  -- print(output,status)
  return status, output
end

local status, output = run_command("nvim --version")
if status then
  require("base")
else
  vim.notify("NeoVim is not installed or cannot be run.")
end
