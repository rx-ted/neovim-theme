return {
  -- notify customization
  {
    "rcarriga/nvim-notify",
    opts = {
      stages = "fade_in_slide_out",
      timeout = 3000,
      render = "compact",
    },
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
        color_icons = false,
        diagnostics = false,
        highlights = {
          buffer_selected = {
            gui = "none",
          },
        },
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
          {
            filetype = "Outline",
            text = "Symbols Outline",
            highlight = "TSType",
            text_align = "left",
          },
        },
      },
    },
  },

  -- scrollbar for Neovim
  {
    "dstein64/nvim-scrollview",
    event = "BufReadPre",
    opts = {
      excluded_filetypes = { "alpha", "dashboard", "neo-tree" },
      current_only = true,
      winblend = 75,
    },
  },

  -- theme toggle
  {
    "Mofiqul/vscode.nvim",
    event = "VimEnter",
    config = function(_, opts)
      require("vscode").setup(opts)
      local colorscheme = "vscode"
      vim.cmd("colorscheme " .. colorscheme)
    end,
    keys = {
      {
        "<leader>ub",
        function()
          if vim.o.background == "light" then
            vim.o.background = "dark"
          else
            vim.o.background = "light"
          end
          print("The current background: " .. vim.o.background)
          vim.cmd([[lua require("vscode").load()]])
        end,
        desc = "Toggle Background",
      },
    },
  },

  -- dashboard
  {
    "nvimdev/dashboard-nvim",
    optional = true,
    opts = function(_, opts)
      -- show dashboard when new tab page is opened
      vim.api.nvim_create_autocmd("TabNewEntered", { command = "Dashboard" })
    end,
  },

  -- alpha
  {
    "goolord/alpha-nvim",
    optional = true,
    opts = function(_, opts)
      opts.config.opts.setup = function()
        local alpha_start_group = vim.api.nvim_create_augroup("AlphaStart", { clear = true })
        vim.api.nvim_create_autocmd("TabNewEntered", {
          callback = function()
            require("alpha").start()
          end,
          group = alpha_start_group,
        })
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          desc = "disable tabline for alpha",
          callback = function()
            vim.opt.showtabline = 0
          end,
        })
        vim.api.nvim_create_autocmd("BufUnload", {
          buffer = 0,
          desc = "enable tabline after alpha",
          callback = function()
            vim.opt.showtabline = 2
          end,
        })
      end
    end,
  },

  -- project
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
  },

  -- rest
  {
    "mistweaverco/kulala.nvim",
    optional = true,
    opts = {
      -- default_view, body or headers
      default_view = "body",
      -- dev, test, prod, can be anything
      -- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
      default_env = "dev",
      -- enable/disable debug mode
      debug = false,
      -- default formatters for different content types
      formatters = {
        json = { "jq", "." },
        xml = { "xmllint", "--format", "-" },
        html = { "xmllint", "--format", "--html", "-" },
      },
      -- default icons
      icons = {
        inlay = {
          loading = "󰔟 ",
          done = " ",
        },
        lualine = "󱂛",
      },
      -- additional cURL options
      -- e.g. { "--insecure", "-A", "Mozilla/5.0" }
      additional_curl_options = {},
    },
  },
}
