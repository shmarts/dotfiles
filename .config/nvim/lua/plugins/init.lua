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
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = true,
    config = function() require("telescope").setup{
      pickers = {
        find_files = {
          find_command = {'rg', '--files', '--hidden', '-g', '!.git'},
        },
      },
    } end,
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
    config = function()
      require "plugins.onedark"
    end,
  }
})

