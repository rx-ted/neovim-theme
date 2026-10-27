---@type NvPluginSpec
return {
  "windwp/nvim-ts-autotag",
  -- https://github.com/windwp/nvim-ts-autotag?tab=readme-ov-file#a-note-on-lazy-loading
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-ts-autotag").setup({
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
    })
  end,
}
