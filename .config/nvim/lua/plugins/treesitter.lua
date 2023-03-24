local options = {
  ensure_installed = {
    "help",
    "bash",
    "css",
    "dockerfile",
    "go",
    "graphql",
    "html",
    "javascript",
    "lua",
    "markdown",
    "rust",
    "svelte",
    "terraform",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vue",
    "vim",
    "yaml",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
}

require("nvim-treesitter.configs").setup(options)

