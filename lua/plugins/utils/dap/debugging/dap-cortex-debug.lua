local utils = require("plugins.extras.utils.utils")

return {
  "jedrzejboczar/nvim-dap-cortex-debug",
  dependencies = "mfussenegger/nvim-dap",
  opts = {
    -- debug = false,
    -- extension_path = nil,
    -- lib_extension = nil,
    node_path = "node",
    dapui_rtt = true,
    -- make :DapLoadLaunchJSON register cortex-debug for C/C++, set false to disable
    dap_vscode_filetypes = { "c", "cpp" },
  },
  config = function(_, opts)
    local dap_cortex_debug = require("dap-cortex-debug")
    dap_cortex_debug.setup(opts)
    require("dap").configurations.c = {
      dap_cortex_debug.openocd_config({
        name = "Example debugging with OpenOCD",
        type = "cortex-debug",
        request = "launch",
        servertype = "openocd",
        serverpath = "openocd",
        gdbPath = "arm-none-eabi-gdb",
        -- toolchainPath = "/usr/bin",
        -- toolchainPrefix = "arm-none-eabi",
        runToEntryPoint = function()
          local name = vim.fn.input("Please input the entry point name: ")
          if name == "" or name == nil then
            name = "main"
          end
          return name
        end,
        swoConfig = { enabled = false },
        showDevDebugOutput = "raw",
        gdbTarget = "localhost:3333",
        cwd = "${workspaceFolder}",
        executable = function()
          return utils.select_or_return_file(vim.fn.getcwd(), "elf")
        end,
        configFiles = {
          "/usr/share/openocd/scripts/interface/stlink-v2.cfg",
          "/usr/share/openocd/scripts/target/stm32f1x.cfg",
        },
        rttConfig = {
          address = "auto",
          decoders = {
            {
              label = "RTT:0",
              port = 0,
              type = "console",
            },
          },
          enabled = true,
        },
      }),
    }
  end,
}
