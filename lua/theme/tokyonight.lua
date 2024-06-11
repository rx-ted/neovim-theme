local _, tokyonight = pcall(require, "tokyonight")
if not _ then
  vim.notify("Not found tokyonight module!")
  return
end

tokyonight.setup({
  style = "night",       -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "light", -- The theme is used when the background is set to light

})

local cmd = vim.cmd
-- cmd [[colorscheme tokyonight-moon]]
-- cmd [[colorscheme tokyonight]]
cmd [[ colorscheme tokyonight-night]]
-- cmd [[colorscheme tokyonight-storm]]
-- cmd [[colorscheme tokyonight-day]]
