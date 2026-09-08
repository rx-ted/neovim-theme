-- Env loader: reads key=value pairs from .env (gitignored) at startup,
-- falling back to .env.example (committed template).
-- Exposes the result as vim.g.env.* with string values, e.g. vim.g.env.MARKDOWN_PREVIEW_PORT.
-- Private values live only in .env and never reach git.

local M = {}
local config_dir = vim.fn.stdpath "config"

local function read_env_file(path)
  local f = io.open(path, "r")
  if not f then
    return {}
  end

  local result = {}
  for line in f:lines() do
    local trimmed = line:gsub("^%s+", ""):gsub("%s+$", "")
    if trimmed ~= "" and not trimmed:match "^#" then
      local key, value = trimmed:match "^([%w_]+)=(.*)$"
      if key then
        -- strip surrounding quotes and inline comments
        value = value:gsub("^['\"]", ""):gsub("['\"]$", "")
        value = value:gsub("%s+#.*$", "")
        result[key] = value:gsub("%s+$", "")
      end
    end
  end
  f:close()
  return result
end

local function merge(defaults, overrides)
  for k, v in pairs(defaults) do
    if overrides[k] == nil then
      overrides[k] = v
    end
  end
  return overrides
end

---@return table<string, string>
function M.load()
  local defaults = read_env_file(config_dir .. "/.env.example")
  local overrides = read_env_file(config_dir .. "/.env")
  local env = merge(defaults, overrides)

  vim.g.env = env
  return env
end

return M