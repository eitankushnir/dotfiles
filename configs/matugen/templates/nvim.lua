local set_hl = vim.api.nvim_set_hl

-- ==========================================
-- 1. EDITOR UI & WINDOWS
-- ==========================================
set_hl(0, "Normal", { bg = "NONE", fg = "{{colors.on_surface.default.hex}}" })
set_hl(0, "NormalFloat", { bg = "NONE", fg = "{{colors.on_surface_variant.default.hex}}" })
set_hl(0, "SignColumn", { bg = "NONE" })
set_hl(0, "EndOfBuffer", { bg = "NONE", fg = "{{colors.surface.default.hex}}" })
set_hl(0, "FloatBorder", { bg = "NONE", fg = "{{colors.outline.default.hex}}" })
set_hl(0, "LineNr", { fg = "{{colors.outline_variant.default.hex}}" })
set_hl(0, "CursorLineNr", { fg = "{{colors.primary.default.hex}}", bold = true })
set_hl(0, "CursorLine", { bg = "NONE" })
set_hl(0, "Visual", { bg = "{{colors.secondary_container.default.hex}}" })
set_hl(0, "VertSplit", { bg = "NONE", fg = "{{colors.outline.default.hex}}" })

-- set_hl(0, "StatusLine", { bg = "{{colors.surface.default.hex}}", fg = "{{colors.on_surface.default.hex}}" })
-- set_hl(0, "StatusLineNC", { bg = "{{colors.surface.default.hex}}", fg = "{{colors.outline_variant.default.hex}}" })

-- Autocomplete Menu (Pmenu)
set_hl(0, "Pmenu", { bg = "{{colors.surface_variant.default.hex}}", fg = "{{colors.on_surface_variant.default.hex}}" })
set_hl(0, "PmenuSel", { bg = "{{colors.primary.default.hex}}", fg = "{{colors.on_primary.default.hex}}", bold = true })
set_hl(0, "PmenuSbar", { bg = "{{colors.surface.default.hex}}" })
set_hl(0, "PmenuThumb", { bg = "{{colors.outline.default.hex}}" })

-- ==========================================
-- 2. STANDARD SYNTAX (Fallbacks)
-- ==========================================
set_hl(0, "Comment", { fg = "{{colors.outline.default.hex}}", italic = true })
set_hl(0, "Keyword", { fg = "{{colors.primary.default.hex}}", bold = true })
set_hl(0, "Statement", { fg = "{{colors.primary.default.hex}}" })
set_hl(0, "Conditional", { fg = "{{colors.primary.default.hex}}" })
set_hl(0, "Repeat", { fg = "{{colors.primary.default.hex}}" })
set_hl(0, "Function", { fg = "{{colors.secondary.default.hex}}" })
set_hl(0, "String", { fg = "{{colors.tertiary.default.hex}}" })
set_hl(0, "Number", { fg = "{{colors.on_tertiary_container.default.hex}}" })
set_hl(0, "Boolean", { fg = "{{colors.on_tertiary_container.default.hex}}", bold = true })
set_hl(0, "Type", { fg = "{{colors.on_primary_container.default.hex}}" })
set_hl(0, "Identifier", { fg = "{{colors.on_surface.default.hex}}" })
set_hl(0, "Constant", { fg = "{{colors.on_tertiary_container.default.hex}}", bold = true })
set_hl(0, "Operator", { fg = "{{colors.outline.default.hex}}" })
set_hl(0, "PreProc", { fg = "{{colors.secondary.default.hex}}" })

-- ==========================================
-- 3. TREE-SITTER (Modern Syntax Highlighting)
-- ==========================================
-- Variables and Properties
set_hl(0, "@variable", { fg = "{{colors.on_surface.default.hex}}" })
set_hl(0, "@variable.builtin", { fg = "{{colors.primary.default.hex}}", italic = true })
set_hl(0, "@property", { fg = "{{colors.on_surface_variant.default.hex}}" })
set_hl(0, "@parameter", { fg = "{{colors.on_surface_variant.default.hex}}", italic = true })

-- Functions and Methods
set_hl(0, "@function", { fg = "{{colors.secondary.default.hex}}" })
set_hl(0, "@function.builtin", { fg = "{{colors.secondary.default.hex}}", bold = true })
set_hl(0, "@function.call", { fg = "{{colors.secondary.default.hex}}" })
set_hl(0, "@method", { fg = "{{colors.secondary.default.hex}}" })
set_hl(0, "@method.call", { fg = "{{colors.secondary.default.hex}}" })
set_hl(0, "@constructor", { fg = "{{colors.on_primary_container.default.hex}}" })

-- Keywords and Operators
set_hl(0, "@keyword", { fg = "{{colors.primary.default.hex}}", bold = true })
set_hl(0, "@keyword.function", { fg = "{{colors.primary.default.hex}}", italic = true })
set_hl(0, "@keyword.return", { fg = "{{colors.error.default.hex}}", italic = true })
set_hl(0, "@operator", { fg = "{{colors.outline.default.hex}}" })

-- Types and Classes
set_hl(0, "@type", { fg = "{{colors.on_primary_container.default.hex}}" })
set_hl(0, "@type.builtin", { fg = "{{colors.on_primary_container.default.hex}}", italic = true })
set_hl(0, "@class", { fg = "{{colors.on_primary_container.default.hex}}" })

-- Strings, Numbers, and Constants
set_hl(0, "@string", { fg = "{{colors.tertiary.default.hex}}" })
set_hl(0, "@string.escape", { fg = "{{colors.on_tertiary_container.default.hex}}", bold = true })
set_hl(0, "@number", { fg = "{{colors.on_tertiary_container.default.hex}}" })
set_hl(0, "@boolean", { fg = "{{colors.on_tertiary_container.default.hex}}", bold = true })
set_hl(0, "@constant", { fg = "{{colors.on_tertiary_container.default.hex}}" })
set_hl(0, "@constant.builtin", { fg = "{{colors.on_tertiary_container.default.hex}}", italic = true })

-- Punctuation (Brackets, Commas, etc.)
set_hl(0, "@punctuation.bracket", { fg = "{{colors.outline.default.hex}}" })
set_hl(0, "@punctuation.delimiter", { fg = "{{colors.outline.default.hex}}" })
set_hl(0, "@punctuation.special", { fg = "{{colors.primary.default.hex}}" })

-- Comments
set_hl(0, "@comment", { fg = "{{colors.outline.default.hex}}", italic = true })
set_hl(0, "@comment.error",
  { fg = "{{colors.error.default.hex}}", bg = "{{colors.error_container.default.hex}}", bold = true })
set_hl(0, "@comment.warning", { fg = "{{colors.tertiary.default.hex}}", bold = true })

-- ==========================================
-- 4. DIAGNOSTICS (LSP Errors/Warnings)
-- ==========================================
set_hl(0, "DiagnosticError", { fg = "{{colors.error.default.hex}}" })
set_hl(0, "DiagnosticWarn", { fg = "{{colors.tertiary.default.hex}}" })
set_hl(0, "DiagnosticInfo", { fg = "{{colors.secondary.default.hex}}" })
set_hl(0, "DiagnosticHint", { fg = "{{colors.primary.default.hex}}" })
set_hl(0, "DiagnosticUnderlineError", { sp = "{{colors.error.default.hex}}", undercurl = true })
set_hl(0, "DiagnosticUnderlineWarn", { sp = "{{colors.tertiary.default.hex}}", undercurl = true })

local custom_theme = {
  -- NORMAL MODE
  normal = {
    a = { bg = "{{colors.primary.default.hex}}", fg = "{{colors.on_primary.default.hex}}", gui = "bold" },
    -- surface_variant is slightly lighter/different than surface, making it the perfect bridge
    b = { bg = "{{colors.surface_variant.default.hex}}", fg = "{{colors.on_surface_variant.default.hex}}" },
    c = { bg = "{{colors.surface.default.hex}}", fg = "{{colors.on_surface.default.hex}}" }
  },

  -- INSERT MODE
  insert = {
    -- tertiary is usually a complementary accent (like mint or pink), perfect for insert mode
    a = { bg = "{{colors.tertiary.default.hex}}", fg = "{{colors.on_tertiary.default.hex}}", gui = "bold" },
    b = { bg = "{{colors.surface_variant.default.hex}}", fg = "{{colors.on_surface_variant.default.hex}}" },
    c = { bg = "{{colors.surface.default.hex}}", fg = "{{colors.on_surface.default.hex}}" }
  },

  -- VISUAL MODE
  visual = {
    -- secondary is related to primary but less aggressive, great for highlighting
    a = { bg = "{{colors.secondary.default.hex}}", fg = "{{colors.on_secondary.default.hex}}", gui = "bold" },
    b = { bg = "{{colors.surface_variant.default.hex}}", fg = "{{colors.on_surface_variant.default.hex}}" },
    c = { bg = "{{colors.surface.default.hex}}", fg = "{{colors.on_surface.default.hex}}" }
  },

  -- REPLACE MODE
  replace = {
    -- error is universally red/orange in MD3, exactly what you want for destructive replacement
    a = { bg = "{{colors.error.default.hex}}", fg = "{{colors.on_error.default.hex}}", gui = "bold" },
    b = { bg = "{{colors.surface_variant.default.hex}}", fg = "{{colors.on_surface_variant.default.hex}}" },
    c = { bg = "{{colors.surface.default.hex}}", fg = "{{colors.on_surface.default.hex}}" }
  },

  -- COMMAND MODE
  command = {
    -- primary_container is a muted version of primary, good for the command line
    a = { bg = "{{colors.primary_container.default.hex}}", fg = "{{colors.on_primary_container.default.hex}}", gui = "bold" },
    b = { bg = "{{colors.surface_variant.default.hex}}", fg = "{{colors.on_surface_variant.default.hex}}" },
    c = { bg = "{{colors.surface.default.hex}}", fg = "{{colors.on_surface.default.hex}}" }
  },

  -- INACTIVE (Unfocused Splits)
  inactive = {
    -- Flatten everything out so it doesn't distract you from your active buffer
    a = { bg = "{{colors.surface_variant.default.hex}}", fg = "{{colors.on_surface_variant.default.hex}}" },
    b = { bg = "{{colors.surface.default.hex}}", fg = "{{colors.on_surface.default.hex}}" },
    c = { bg = "{{colors.surface.default.hex}}", fg = "{{colors.on_surface.default.hex}}" }
  }
}

require('lualine').setup({
  options = {
    theme = custom_theme,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
})

vim.opt.laststatus = 0

vim.g.tpipeline_autoembed = 1
vim.g.tpipeline_restore = 1
vim.g.tpipeline_clearstl = 1

vim.g.colors_name = "matugen"
