local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- splitting windows
opt.splitright = true
opt.splitbelow = true

-- keywords
opt.iskeyword:append("-")

-- scrolling
opt.scrolloff = 8

opt.completeopt = "menu,menuone,noselect"

