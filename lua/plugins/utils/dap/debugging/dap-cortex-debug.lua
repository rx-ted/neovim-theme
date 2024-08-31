local utils = require("plugins.extras.utils.utils")

return {
  "mfussenegger/nvim-dap",
  config = function(_, opts)
    local dap = require("dap")
    dap.configurations.c = {
      {
        name = "Example debugging with OpenOCD",
        type = "cortex-debug",
        request = "launch",
        servertype = "openocd",
        serverpath = "openocd",
        gdbPath = "arm-none-eabi-gdb",
        -- toolchainPath = "/usr/bin",
        -- toolchainPrefix = "arm-none-eabi",
        runToEntryPoint = "main",
        -- runToEntryPoint = function()
        --   local name = vim.fn.input("Please input the entry point name: ")
        --   if name == "" or name == nil then
        --     name = "main"
        --   end
        --   return name
        -- end,
        swoConfig = { enabled = false },
        showDevDebugOutput = "raw",
        gdbTarget = "localhost:3333",
        cwd = "${workspaceFolder}",
        executable = function()
          return utils.select_or_return_file(vim.fn.getcwd(), "elf")
        end,
        configFiles = {
          "/usr/share/openocd/scripts/interface/cmsis-dap.cfg",
          "/usr/share/openocd/scripts/target/stm32f4x.cfg",
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
      },
    }
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}", -- This configuration will launch the current file
        pythonPath = function()
          return "/usr/bin/python"
        end,
      },
    }
  end,
}
