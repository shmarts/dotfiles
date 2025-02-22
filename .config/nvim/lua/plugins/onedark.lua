local options = {
  style = "cool",
  colors = {
    black = "#151820",
    bg0 = "#2B303A",
    bg1 = "#2E3440",
    bg2 = "#3B4252",
    bg3 = "#434C5E",
    bg_d = "#242831",
    bg_blue = "#6db9f7",
    bg_yellow = "#f0d197",
    fg = "#c0c5ce",
    purple = "#B48EAD",
    green = "#AFCF96",
    orange = "#DE935F",
    brown = "#C88270",
    blue = "#81A2BE",
    yellow = "#EBCB8B",
    cyan = "#96B5B4",
    red = "#E66464",
    grey = "#546178",
    white = "#EFF1F5",
    dark_cyan = "#25747d",
    dark_red = "#a13131",
    dark_yellow = "#9a6b16",
    dark_purple = "#8f36a9",
    diff_add = "#0ED090",
    diff_delete = "#F24C4F",
    diff_change = "#E9D165",
    diff_text = "#265478",
  },
  highlights = {
    ["@annotation"] = {fg = '$fg'},
    ["@attribute"] = {fg = '$cyan'},
    ["@boolean"] = {fg = '$orange'},
    ["@character"] = {fg = '$orange'},
    ["@comment"] = {fg = '$grey'},
    ["@conditional"] = {fg = '$purple'},
    ["@constant"] = {fg = '$orange'},
    ["@constant.builtin"] = {fg = '$orange'},
    ["@constant.macro"] = {fg = '$orange'},
    ["@constructor"] = {fg = '$yellow', fmt = "bold"},
    ["@error"] = {fg = '$fg'},
    ["@exception"] = {fg = '$purple'},
    ["@field"] = {fg = '$fg'},
    ["@float"] = {fg = '$orange'},
    ["@function"] = {fg = '$blue'},
    ["@function.builtin"] = {fg = '$cyan'},
    ["@function.macro"] = {fg = '$cyan'},
    ["@include"] = {fg = '$purple'},
    ["@keyword"] = {fg = '$purple'},
    ["@keyword.function"] = {fg = '$purple'},
    ["@keyword.operator"] = {fg = '$purple'},
    ["@label"] = {fg = '$red'},
    ["@method"] = {fg = '$blue'},
    ["@namespace"] = {fg = '$yellow'},
    ["@none"] = {fg = '$fg'},
    ["@number"] = {fg = '$orange'},
    ["@operator"] = {fg = '$fg'},
    ["@parameter"] = {fg = '$red'},
    ["@parameter.reference"] = {fg = '$fg'},
    ["@property"] = {fg = '$fg'},
    ["@punctuation.delimiter"] = {fg = '$fg'},
    ["@punctuation.bracket"] = {fg = '$fg'},
    ["@punctuation.special"] = {fg = '$red'},
    ["@repeat"] = {fg = '$purple'},
    ["@string"] = {fg = '$green'},
    ["@string.regex"] = {fg = '$orange'},
    ["@string.escape"] = {fg = '$red'},
    ["@symbol"] = {fg = '$cyan'},
    ["@tag"] = {fg = '$purple'},
    ["@tag.attribute"] = {fg = '$yellow'},
    ["@tag.delimiter"] = {fg = '$purple'},
    ["@text"] = {fg = '$fg'},
    ["@text.strong"] = {fg = '$fg', fmt = 'bold'},
    ["@text.emphasis"] = {fg = '$fg', fmt = 'italic'},
    ["@text.underline"] = {fg = '$fg', fmt = 'underline'},
    ["@text.strike"] = {fg = '$fg', fmt = 'strikethrough'},
    ["@text.title"] = {fg = '$orange', fmt = 'bold'},
    ["@text.literal"] = {fg = '$green'},
    ["@text.uri"] = {fg = '$cyan', fmt = 'underline'},
    ["@text.todo"] = {fg = '$red'},
    ["@text.math"] = {fg = '$fg'},
    ["@text.reference"] = {fg = '$blue'},
    ["@text.environment"] = {fg = '$fg'},
    ["@text.environment.name"] = {fg = '$fg'},
    ["@text.diff.add"] = {fg = '$diff_add'},
    ["@text.diff.delete"] = {fg = '$diff_delete'},
    ["@note"] = {fg = '$fg'},
    ["@warning"] = {fg = '$fg'},
    ["@danger"] = {fg = '$fg'},
    ["@type"] = {fg = '$white'},
    ["@type.builtin"] = {fg = '$green'},
    ["@variable"] = {fg = '$red'},
    ["@variable.builtin"] = {fg = '$brown'},
  },
}

require("onedark").setup(options)
require("onedark").load()

-- TODO: improve the below with a function
-- gitsigns
vim.cmd('highlight GitSignsAdd guifg=#0ED090')
vim.cmd('highlight GitSignsChange guifg=#E9D165')
vim.cmd('highlight GitSignsDelete guifg=#F24C4F')

-- nvim-tree
vim.cmd('highlight NvimTreeRootFolder guifg=#81A2BE')

-- common
vim.cmd('highlight IndentBlanklineChar guifg=#434C5E')
vim.cmd('highlight MsgArea guibg=#242831')
vim.cmd('highlight WinSeparator guibg=#242831 guifg=#242831')
vim.cmd('highlight StatusLine guibg=#242831')
vim.cmd('highlight StatusLineNC guibg=#242831')

