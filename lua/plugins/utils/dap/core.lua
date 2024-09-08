local keys = require("plugins.utils.dap.config.keys")
local configs = require("plugins.utils.dap.config.configs")

return {
  {
    "mfussenegger/nvim-dap",
    recommended = true,
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
    keys = keys.dap_keys,
    config = function()
      require("dap.ext.vscode").load_launchjs(nil, { cppdbg = { "c", "cpp" } })
    end,
  }, -- fancy UI for the debugger
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
    keys = keys.dapui_keys,
    config = configs.dapui_configs(),
  }, -- mason.nvim integration
}
