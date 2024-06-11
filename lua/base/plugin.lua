-- use git proxy
local proxy = 'https://gitclone.com/github.com/'

-- 自动安装packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
vim.cmd([[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugin.lua source <afile> | PackerSync
    augroup end
  ]])

return require('packer').startup(function(use)
  -- download package
  use 'wbthomason/packer.nvim'
  -- theme
  use 'folke/tokyonight.nvim'

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      -- 'archibate/lualine-time',
    }
  }
  -- buffer line
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons'
  }

  use({
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons",     -- keep this if you're using NvChad
  })



  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    requires = {
      'p00f/nvim-ts-rainbow',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'windwp/nvim-ts-autotag',
      'andymass/vim-matchup',
      'mfussenegger/nvim-treehopper',
    },
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'onsails/lspkind-nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'f3fora/cmp-spell',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-emoji',
      'chrisgrieser/cmp_yanky',
      'petertriho/cmp-git',
      'lukas-reineke/cmp-rg',
      'roobert/tailwindcss-colorizer-cmp.nvim',
      "lukas-reineke/cmp-under-comparator",
      'hrsh7th/cmp-copilot', -- TODO: uncomment this for AI completion
      'saadparwaiz1/cmp_luasnip',
    }
  }

  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }

  use {
    "rcarriga/nvim-notify"
  }


  -- use control key to control hjkl to navigate windows
  use "christoomey/vim-tmux-navigator"

  -- with treesitter, has differences to dicrect for colors
  use "p00f/nvim-ts-rainbow"
  -- auto format
  use "hrsh7th/cmp-path" -- 文件路径

  -- use "numToStr/Comment.nvim" -- gcc和gc注释
  use "windwp/nvim-autopairs"   -- 自动补全括号

  use "lewis6991/gitsigns.nvim" -- 左则git提示


  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make || true",
      },
      {
        "nvim-telescope/telescope-frecency.nvim",
        requires = { "tami5/sqlite.lua" }, -- need to install sqlite lib
      },
      "nvim-telescope/telescope-ui-select.nvim",
      'LinArcX/telescope-changes.nvim',
      'nvim-telescope/telescope-github.nvim',
      -- "nvim-telescope/telescope-live-grep-raw.nvim",
    },
  }

  use {
    'voldikss/vim-translator'
  }

  use({
    "L3MON4D3/LuaSnip",
    tag = "v2.*",
    run = "make install_jsregexp"
  })

  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"

  use "lukas-reineke/lsp-format.nvim"

  use {
    "stevearc/conform.nvim",
  }

  use {
    "NeogitOrg/neogit",
    tag = 'v0.0.1',
    requires = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = function() require('neogit').setup {} end,
  }


  use({
    'nvimdev/lspsaga.nvim',
    after = 'nvim-lspconfig',
  })

  -- indent line
  -- use {
  --   'nvimdev/indentmini.nvim',
  --   event = 'BufEnter',
  -- }
  use "lukas-reineke/indent-blankline.nvim"

  -- use {
  --   'neoclide/coc.nvim',
  --   branch = 'release'
  -- }

  use {
    "MunifTanjim/nui.nvim"
  }
  use "nvim-lua/plenary.nvim"

  use "gbprod/yanky.nvim"

  use {
    "ray-x/lsp_signature.nvim",
  }

  use { 'dgagn/diagflow.nvim' }

  use {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  }

  use {
    'folke/noice.nvim',
    requires = {
      "MunifTanjim/nui.nvim",
    },
  }

  use {
    "folke/trouble.nvim",
  }

  use {
    "folke/zen-mode.nvim",
    "folke/twilight.nvim",

  }

  use {
    'rcarriga/nvim-dap-ui',
    requires = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',
    },
  }
  use {
    "akinsho/toggleterm.nvim"
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn["mkdp#util#install"]() end,
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    config = function() vim.cmd [[let g:mkdp_browser = '/usr/bin/google-chrome']] end,
    ft = { "markdown" },
    requires = 'iamcco/mathjax-support-for-mkdp',
  }
  use {
    'mzlogin/vim-markdown-toc',
    ft = { "markdown" },
  }

  use {
    'ferrine/md-img-paste.vim',
    config = function()
      vim.cmd [[
let g:mdip_imgdir = 'img' " save image in ./img
let g:mdip_imgname = 'image'
autocmd FileType markdown nnoremap <silent> mp :call mdip#MarkdownClipboardImage()<CR>
        ]]
    end,
    ft = { "markdown" },
  }

  use {
    'folke/todo-comments.nvim'
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
