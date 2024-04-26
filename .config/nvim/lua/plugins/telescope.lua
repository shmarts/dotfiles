local telescope = require("telescope")
local config = require("telescope.config")
local actions = require "telescope.actions"

local vimgrep_arguments = { unpack(config.values.vimgrep_arguments) }
table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

local options = {
  defaults = {
    vimgrep_arguments = vimgrep_arguments,
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
      }
    }
  },
  pickers = {
    find_files = {
      find_command = {'rg', '--files', '--hidden', '-g', '!.git'},
    },
  },
}

require("telescope").setup(options)
