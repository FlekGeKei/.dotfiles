return {
  { 
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require "config.catppuccin"
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    config = function()
      require "config.gitsigns"
    end
  },
  {
    "stevearc/conform.nvim",
    config = function()
      require "config.conform"
    end
  },
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    config = function()
      return require "config.mason"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
  },
  {
    "ibhagwan/fzf-lua",
    lazy = false,
    opts = {}
  },
  {
    "folke/neoconf.nvim"
  },
  {
    "OXY2DEV/markview.nvim",
    priority = 49,
    dependencies = { "OXY2DEV/markview.nvim" },
    opts = {
      experimental = {
        check_rtp = false
      }
    }
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {  
      "nvim-treesitter/nvim-treesitter",
      "BurntSushi/ripgrep",

    },
    cmd = "Telescope",
    opts = function()
      return require "config.telescope"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require "config.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = function()
      require('config.blinkcmp')
    end,
    opts_extend = { "sources.default" }
  },
  {
  'neovim/nvim-lspconfig',
    dependencies = { 
      'saghen/blink.cmp',
      'mason-org/mason.nvim',
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer',
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function() 
      require('config.lspconfig')
    end,
  },
}
