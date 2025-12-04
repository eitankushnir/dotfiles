require("config.globals")


require("config.options")
require("config.keymap")
require("config.autocmd")
require("config.lsp")
require("config.lazy")

-- Run the theme change autocmd on launch
vim.api.nvim_exec_autocmds("Signal", { group = "toggle_bg_on_SIGUSR1", pattern = "SIGUSR1" })
require("config.pixel-fixes")
