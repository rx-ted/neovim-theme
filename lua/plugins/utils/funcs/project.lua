return -- project
{
  "ahmedkhalf/project.nvim",
  optional = true,
  opts = function(_, opts)
    opts.manual_mode = false
    opts.detection_methods = { "lsp", "pattern" }
    opts.patterns = {
      ".git",
      ".hg",
      ".svn",
    }
  end,
}
