-- OSC52 clipboard provider for nvim.
--
-- Works over SSH / headless terminals: the escape sequence is written to
-- stdout and the LOCAL terminal client puts it into the LOCAL clipboard,
-- so yank/delete/put all target the user's machine instead of the server.
local M = {}

local function detect_ssh()
  return vim.env.SSH_CONNECTION ~= nil and vim.env.SSH_CONNECTION ~= "" --
    or vim.env.SSH_TTY ~= nil
end

local function copy_lines(reg, lines)
  local text = table.concat(lines, "\n")
  if not text or text == "" then
    return
  end

  local clipboard = reg == "+" and "c" or "p"
  local encoded = vim.base64.encode(text)
  io.write(string.format("\027]52;%s;%s\027\\", clipboard, encoded))
  io.flush()
end

local function paste_lines(reg)
  local ok, osc52 = pcall(require, "vim.ui.clipboard.osc52")
  if not ok then
    vim.notify("OSC52 paste unavailable: module not found", vim.log.levels.WARN)
    return nil
  end
  local fn = osc52.paste(reg)
  return fn()
end

local function configure()
  vim.g.clipboard = {
    name = "osc52",
    copy = {
      ["+"] = function(lines)
        copy_lines("+", lines)
      end,
      ["*"] = function(lines)
        copy_lines("*", lines)
      end,
    },
    paste = {
      ["+"] = function()
        return paste_lines("+")
      end,
      ["*"] = function()
        return paste_lines("*")
      end,
    },
  }
end

---@param text string
---@return string? text
M.copy = function(text)
  if not text or text == "" then
    return nil
  end
  copy_lines("+", { text })
  return text
end

M.detect_ssh = detect_ssh
M.configure = configure
M.copy_lines = copy_lines
M.paste_lines = paste_lines

return M