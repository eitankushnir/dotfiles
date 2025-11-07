require("config.globals")


require("config.options")
require("config.keymap")
require("config.autocmd")
require("config.lsp")
require("config.lazy")

vim.cmd [[ TransparentEnable ]]
vim.cmd [[ hi TreesitterContextBottom cterm=underline ]]

require("config.pixel-fixes")
