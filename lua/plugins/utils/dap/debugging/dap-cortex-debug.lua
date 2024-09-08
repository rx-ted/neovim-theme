return {
  "jedrzejboczar/nvim-dap-cortex-debug",
  requires = "mfussenegger/nvim-dap",
  config = function()
    local dap_cortex_debug = require("dap-cortex-debug")
    dap_cortex_debug.openocd_config({
      toolchainPath = "/opt/arm-gcc.13.3/bin",
    })
    dap_cortex_debug.setup({
      debug = false,
      extension_path = nil,
      lib_extension = nil,
      node_path = "node",
      dapui_rtt = true,
      dap_vscode_filetypes = { "c", "cpp" },
    })
  end,
}
