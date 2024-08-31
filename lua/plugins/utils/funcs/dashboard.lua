return -- dashboard
{
  "nvimdev/dashboard-nvim",
  optional = true,
  opts = function(_, opts)
    -- show dashboard when new tab page is opened
    vim.api.nvim_create_autocmd("TabNewEntered", { command = "Dashboard" })
  end,
}
