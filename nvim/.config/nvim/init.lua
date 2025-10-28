require("config.globals")
require("config.options")
require("config.keymap")
require("config.autocmd")
require("config.lsp")
require("config.lazy")

vim.cmd[[colorscheme tokyonight]]

-- Function to make background transparent
--vim.cmd [[
--  hi Normal guibg=NONE ctermbg=NONE
--  hi NormalNC guibg=NONE ctermbg=NONE
--  hi NormalFloat guibg=NONE ctermbg=NONE
--  hi FloatBorder guibg=NONE ctermbg=NONE
--  hi SignColumn guibg=NONE ctermbg=NONE
--  hi LineNr guibg=NONE ctermbg=NONE
--  hi EndOfBuffer guibg=NONE ctermbg=NONE
--]]
