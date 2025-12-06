-- Only enable on macOS
if vim.fn.has "macunix" ~= 1 then
  return
end

vim.opt.clipboard = "unnamedplus"


vim.g.clipboard = {
  name = "macOS-clipboard",
  copy = {
    ["+"] = "pbcopy",
    ["*"] = "pbcopy",
  },
  paste = {
    ["+"] = "pbpaste",
    ["*"] = "pbpaste",
  },
  cache_enabled = 1,
}
