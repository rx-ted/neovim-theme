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

local dap_keys = {
  { "<leader>d", "", desc = "+debug", mode = { "n", "v" } },
  {
    "<leader>dB",
    function()
      require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end,
    desc = "Breakpoint Condition",
  },
  {
    "<leader>db",
    function()
      require("dap").toggle_breakpoint()
    end,
    desc = "Toggle Breakpoint",
  },
  {
    "<leader>dc",
    function()
      require("dap").continue()
    end,
    desc = "Continue",
  },
  {
    "<leader>da",
    function()
      require("dap").continue({ before = get_args })
    end,
    desc = "Run with Args",
  },
  {
    "<leader>dC",
    function()
      require("dap").run_to_cursor()
    end,
    desc = "Run to Cursor",
  },
  {
    "<leader>dg",
    function()
      require("dap").goto_()
    end,
    desc = "Go to Line (No Execute)",
  },
  {
    "<leader>di",
    function()
      require("dap").step_into()
    end,
    desc = "Step Into",
  },
  {
    "<leader>dj",
    function()
      require("dap").down()
    end,
    desc = "Down",
  },
  {
    "<leader>dk",
    function()
      require("dap").up()
    end,
    desc = "Up",
  },
  {
    "<leader>dl",
    function()
      require("dap").run_last()
    end,
    desc = "Run Last",
  },
  {
    "<leader>do",
    function()
      require("dap").step_out()
    end,
    desc = "Step Out",
  },
  {
    "<leader>dO",
    function()
      require("dap").step_over()
    end,
    desc = "Step Over",
  },
  {
    "<leader>dp",
    function()
      require("dap").pause()
    end,
    desc = "Pause",
  },
  {
    "<leader>dr",
    function()
      require("dap").repl.toggle()
    end,
    desc = "Toggle REPL",
  },
  {
    "<leader>ds",
    function()
      require("dap").session()
    end,
    desc = "Session",
  },
  {
    "<leader>dt",
    function()
      require("dap").terminate()
    end,
    desc = "Terminate",
  },
  {
    "<leader>dw",
    function()
      require("dap.ui.widgets").hover()
    end,
    desc = "Widgets",
  },
  {
    "<leader>dwf",
    function()
      require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames, { border = "none" })
    end,
    desc = "Frames",
  },
  {
    "<leader>dws",
    function()
      require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes, { border = "none" })
    end,
    desc = "Scopes",
  },
  {
    "<leader>dwt",
    function()
      require("dap.ui.widgets").centered_float(require("dap.ui.widgets").threads, { border = "none" })
    end,
    desc = "Threads",
  },
  {
    "<F5>",
    function()
      vim.cmd([[lua require('dap').continue()]])
    end,
    desc = "dap continue",
  },
  {
    "<F6>",
    function()
      vim.cmd([[lua require('dap').step_over()]])
    end,
    desc = "dap step over",
  },
  {
    "<F7>",
    function()
      vim.cmd([[lua require('dap').step_into()]])
    end,
    desc = "dap step into",
  },
  {
    "<F8>",
    function()
      vim.cmd([[lua require('dap').step_out()]])
    end,
    desc = "dap step out",
  },
}

local dapui_keys = {
  {
    "<leader>du",
    function()
      require("dapui").toggle({})
    end,
    desc = "Dap UI",
  },
  {
    "<leader>de",
    function()
      require("dapui").eval()
    end,
    desc = "Eval",
    mode = { "n", "v" },
  },
}

return {
  dap_keys = dap_keys,
  dapui_keys = dapui_keys,
}
