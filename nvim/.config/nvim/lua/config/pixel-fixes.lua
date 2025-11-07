local ok, colors = pcall(require, "pixel.colorscheme")
if not ok then
    return
end
local config = require("pixel").config or {}

-- Snacks Input
vim.api.nvim_set_hl(0, "SnacksInputBorder", { ctermfg = colors.br_black, ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "SnacksInputNormal", { ctermfg = colors.white, ctermbg = colors.black })

-- Snacks Picker
vim.api.nvim_set_hl(0, "SnacksPickerBorder", { ctermfg = colors.br_black, ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "SnacksPickerTitle", { ctermfg = colors.blue, ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "SnacksTitle", { ctermfg = colors.blue, ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { ctermfg = colors.cyan, ctermbg = colors.br_black })
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = colors.yellow })

-- Snacks Indent
vim.api.nvim_set_hl(0, "SnacksIndent", { ctermfg = colors.white })
vim.api.nvim_set_hl(0, "SnacksIndentScope", { ctermfg = colors.blue })

-- Blink completion menu
vim.api.nvim_set_hl(0, "BlinkCmpMenu", { ctermfg = colors.white, ctermbg = colors.black })
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { ctermfg = colors.black })
vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { ctermfg = colors.green, ctermbg = "NONE" })

-- Blink completion items

vim.api.nvim_set_hl(0, "BlinkCmpLabelDetail", { ctermfg = colors.black })
vim.api.nvim_set_hl(0, "BlinkCmpLabelDetail", { ctermfg = colors.black })
vim.api.nvim_set_hl(0, "BlinkCmpLabelDescription", { ctermfg = colors.black, italic = config.disable_italics })
vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { ctermfg = colors.green, bold = true })

-- Blink completion documentation
vim.api.nvim_set_hl(0, "BlinkCmpDoc", { ctermfg = colors.white, ctermbg = colors.black })

-- Blink completion scrollbar
vim.api.nvim_set_hl(0, "BlinkCmpScrollbar", { ctermfg = colors.black, ctermbg = colors.black })
vim.api.nvim_set_hl(0, "BlinkCmpScrollbarThumb", { ctermfg = colors.white, ctermbg = colors.white })
vim.api.nvim_set_hl(0, "BlinkCmpScrollbarGutter", { ctermfg = colors.black, ctermbg = colors.black })

-- Blink signature help
vim.api.nvim_set_hl(0, "BlinkCmpSignatureActiveParameter", { ctermfg = colors.red, ctermbg = colors.br_black })
vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", { ctermfg = colors.white, ctermbg = colors.br_black })
vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { ctermfg = colors.white, ctermbg = colors.br_black })

-- Blink icons
vim.api.nvim_set_hl(0, "PmenuKind", { ctermbg = "NONE" })
