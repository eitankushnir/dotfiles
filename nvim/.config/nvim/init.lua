require("config.globals")


require("config.options")
require("config.keymap")
require("config.autocmd")
require("config.lsp")
require("config.lazy")

vim.cmd [[ colorscheme kanagawa ]]
vim.cmd [[ TransparentEnable ]]
vim.cmd [[ hi TreesitterContextBottom gui=underline ]]
vim.cmd [[ hi TreesitterContextLineNumber guibg=none ]]
require("config.pixel-fixes")
