-- 环境分派：
-- 1. SSH/远程 → OSC52（经终端写入本地剪贴板，与服务器是否有图形环境无关）
-- 2. 非 SSH → 平台原生剪贴板（WSL / macOS / Linux）
local osc52 = require "gale.clipboard.osc52"

if osc52.detect_ssh() then
  osc52.configure()
  return
end

-- 平台判断
local is_wsl = (vim.fn.has "wsl" == 1)
local is_mac = (vim.fn.has "macunix" == 1) -- macOS
local is_unix = (vim.fn.has "unix" == 1) -- Linux/Unix（包含 mac，但上面已排除）

-- 1. WSL → win32yank
-- 2. macOS → pbcopy/pbpaste
-- 3. Linux → wl-copy / xclip / xsel
if is_wsl then
  require "gale.clipboard.wsl"
elseif is_mac then
  require "gale.clipboard.mac"

  -- Unix 且不是 WSL / macOS → Linux
elseif is_unix then
  require "gale.clipboard.linux"
else
  vim.notify(
    "No suitable clipboard provider found. Install wl-copy/xclip/xsel or configure manually.",
    vim.log.levels.WARN
  )
end