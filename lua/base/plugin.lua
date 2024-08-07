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
  -- use 'folke/tokyonight.nvim'
  use 'Mofiqul/vscode.nvim'
  
  -- dap-ui is not supported neo-tree
  -- use {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v3.x",
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --     -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  --   }
  -- }
  
  -- insert to nvim-tree
  use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
}

use ({
    'nvimdev/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = function()
        require('lspsaga').setup({})
    end,
})


  use {
    "MunifTanjim/nougat.nvim",
  }

  use {
    'romgrk/barbar.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      'lewis6991/gitsigns.nvim'
    }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
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
  use { 'ms-jpq/coq_nvim', run = 'python3 -m coq deps' }
  use 'ms-jpq/coq.artifacts'
  use 'ms-jpq/coq.thirdparty'

  use {
    "rcarriga/nvim-notify"
  }

  use "christoomey/vim-tmux-navigator"

  use "hrsh7th/cmp-path"        -- 文件路径

  use "windwp/nvim-autopairs"   -- 自动补全括号

  use "lewis6991/gitsigns.nvim" -- 左则git提示

  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "gbprod/yanky.nvim",
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

  use "saadparwaiz1/cmp_luasnip"

  use "lukas-reineke/lsp-format.nvim"

  use "lukas-reineke/indent-blankline.nvim"

  use {
    "MunifTanjim/nui.nvim"
  }
  use "nvim-lua/plenary.nvim"

  use {
    'folke/noice.nvim',
    requires = {
      "MunifTanjim/nui.nvim",
    },
  }

  use {
    'folke/todo-comments.nvim'
  }
  use({
    "L3MON4D3/LuaSnip",
    run = "make install_jsregexp"
  })

  use {
    'Civitasv/cmake-tools.nvim',
    config = function()
      require('cmake-tools').setup({})
    end
  }
  -- debugging
  use {
    'folke/neodev.nvim',
    'jedrzejboczar/nvim-dap-cortex-debug',
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    'theHamsta/nvim-dap-virtual-text',
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
