---@param config {args?:string[]|fun():string[]?}
local function get_args(config)
  local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
  config = vim.deepcopy(config)
  ---@cast args string[]
  config.args = function()
    local new_args = vim.fn.input("Run with args: ", table.concat(args, " ")) --[[@as string]]
    return vim.split(vim.fn.expand(new_args) --[[@as string]], " ")
  end
  return config
end

return {
  {
    "mfussenegger/nvim-dap",
    recommended = true,
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

    dependencies = {
      "rcarriga/nvim-dap-ui", -- virtual text for the debugger
      { "theHamsta/nvim-dap-virtual-text", opts = {} },
    },

        -- stylua: ignore
        keys = {
            {"<leader>d", "", desc = "+debug", mode = {"n", "v"}}, {
                "<leader>dB",
                function()
                    require("dap").set_breakpoint(vim.fn.input(
                                                      'Breakpoint condition: '))
                end,
                desc = "Breakpoint Condition"
            }, {
                "<leader>db",
                function() require("dap").toggle_breakpoint() end,
                desc = "Toggle Breakpoint"
            },
            {
                "<leader>dc",
                function() require("dap").continue() end,
                desc = "Continue"
            }, {
                "<leader>da",
                function()
                    require("dap").continue({before = get_args})
                end,
                desc = "Run with Args"
            }, {
                "<leader>dC",
                function() require("dap").run_to_cursor() end,
                desc = "Run to Cursor"
            }, {
                "<leader>dg",
                function() require("dap").goto_() end,
                desc = "Go to Line (No Execute)"
            },
            {
                "<leader>di",
                function() require("dap").step_into() end,
                desc = "Step Into"
            },
            {"<leader>dj", function() require("dap").down() end, desc = "Down"},
            {"<leader>dk", function() require("dap").up() end, desc = "Up"},
            {
                "<leader>dl",
                function() require("dap").run_last() end,
                desc = "Run Last"
            },
            {
                "<leader>do",
                function() require("dap").step_out() end,
                desc = "Step Out"
            },
            {
                "<leader>dO",
                function() require("dap").step_over() end,
                desc = "Step Over"
            },
            {
                "<leader>dp",
                function() require("dap").pause() end,
                desc = "Pause"
            }, {
                "<leader>dr",
                function() require("dap").repl.toggle() end,
                desc = "Toggle REPL"
            },
            {
                "<leader>ds",
                function() require("dap").session() end,
                desc = "Session"
            },
            {
                "<leader>dt",
                function() require("dap").terminate() end,
                desc = "Terminate"
            }, {
                "<leader>dw",
                function() require("dap.ui.widgets").hover() end,
                desc = "Widgets"
            }, {
                "<leader>dwf",
                function()
                    require("dap.ui.widgets").centered_float(require(
                                                                 "dap.ui.widgets").frames,
                                                             {border = "none"})
                end,
                desc = "Frames"
            }, {
                "<leader>dws",
                function()
                    require("dap.ui.widgets").centered_float(require(
                                                                 "dap.ui.widgets").scopes,
                                                             {border = "none"})
                end,
                desc = "Scopes"
            }, {
                "<leader>dwt",
                function()
                    require("dap.ui.widgets").centered_float(require(
                                                                 "dap.ui.widgets").threads,
                                                             {border = "none"})
                end,
                desc = "Threads"
            },
       {
                "<F5>",
                function()
                    vim.cmd([[lua require('dap').continue()]])
                end,
                desc = "dap continue"
            },
           {
                "<F6>",
                function()
                    vim.cmd([[lua require('dap').step_over()]])
                end,
                desc = "dap step over"
            }, {
                "<F7>",
                function()
                    vim.cmd([[lua require('dap').step_into()]])
                end,
                desc = "dap step into"
            }, {
                "<F8>",
                function()
                    vim.cmd([[lua require('dap').step_out()]])
                end,
                desc = "dap step out"
            }


        },

    config = function()
      -- load mason-nvim-dap here, after all adapters have been setup
      if LazyVim.has("mason-nvim-dap.nvim") then
        require("mason-nvim-dap").setup(LazyVim.opts("mason-nvim-dap.nvim"))
      end
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
      for name, sign in pairs(LazyVim.config.icons.dap) do
        sign = type(sign) == "table" and sign or { sign }

        --- @class vim.fn.sign_define.dict
        local dict = {
          text = sign[1],
          texthl = sign[2] or "DiagnosticInfo",
          linehl = sign[3],
          numhl = sign[3],
        }
        vim.fn.sign_define("Dap" .. name, dict)
      end
    end,
  }, -- fancy UI for the debugger
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
        -- stylua: ignore
        keys = {
            {
                "<leader>du",
                function() require("dapui").toggle({}) end,
                desc = "Dap UI"
            }, {
                "<leader>de",
                function() require("dapui").eval() end,
                desc = "Eval",
                mode = {"n", "v"}
            },
             },
    opts = {},
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      vim.fn.sign_define("DapBreakpoint", {
        text = " ",
        texthl = "DapBreakpoint",
        linehl = "",
        numhl = "",
      })
      vim.fn.sign_define("DapBreakpointCondition", {
        text = " ",
        texthl = "DapBreakpointCondition",
        linehl = "",
        numhl = "",
      })
      vim.fn.sign_define("DapLogPoint", {
        text = " ",
        texthl = "DapLogPoint",
        linehl = "",
        numhl = "",
      })

      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
    end,
  }, -- mason.nvim integration
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = "mason.nvim",
    cmd = { "DapInstall", "DapUninstall" },
    opts = {
      automatic_installation = true,
      handlers = {},
      ensure_installed = {},
    },
    -- mason-nvim-dap is loaded when nvim-dap loads
    config = function() end,
  },
  { "mpx/lua-cjson" },
}
