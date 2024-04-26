local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
  'tpope/vim-fugitive',
  'tpope/vim-sleuth',
  'tpope/vim-surround',
  'christoomey/vim-tmux-navigator',
  'szw/vim-maximizer',
  'vim-scripts/ReplaceWithRegister',
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = true,
    config = function()
      require "plugins.telescope"
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      require "plugins.treesitter"
    end,
  },
  {
    'navarasu/onedark.nvim',
    lazy = false,
    config = function()
      require "plugins.onedark"
    end,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    },
    config = function ()
      require "plugins.lsp"
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  'folke/which-key.nvim',
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require 'plugins.lualine'
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '│',
      show_trailing_blankline_indent = false,
    },
  },
  { 'numToStr/Comment.nvim', opts = {} },
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require 'plugins.nvim-tree'
    end
  },
  'nvim-tree/nvim-web-devicons',
  'MunifTanjim/nui.nvim',
  {
    "folke/noice.nvim",
    config = function()
      require 'plugins.noice'
    end,
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  }
})

