
local custom_onedark = require 'lualine.themes.onedark'

custom_onedark.normal.c.bg = '#242831'
custom_onedark.inactive.a.bg = '#242831'
custom_onedark.inactive.b.bg = '#242831'
custom_onedark.inactive.c.bg = '#242831'

require("lualine").setup({
  options = { theme = custom_onedark }
})

