local vim = vim
local o = vim.opt
local g = vim.g
local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

local set_transparent = function()
  local groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "FloatTitle",
    "CursorLine",
    "EndOfBuffer",
    "SignColumn",
    "StatusLineNC",
    "StatusLine",
    "TabLine",
    "TabLineFill",
    "TabLineSet",
    "ColorColumn",
  }
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { ctermbg = "none", bg = "none" })
  end

  vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none", fg = "#f2f2f2" })
  vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = "#6c7086" })
  vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "#181825" })
  vim.api.nvim_set_hl(0, "BlinkSignatureHelp", { bg = "#181825" })
  vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", { bg = "#181825" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#4F4C5C" })
end

local function HebewToggle()
  if not vim.b.hebrew_mode_enabled then
    vim.opt_local.keymap = "hebrew"
    vim.opt_local.iminsert = 1
    vim.opt_local.imsearch = 1
    vim.opt_local.rightleft = true
    vim.b.hebrew_mode_enabled = true
    vim.notify("Hebrew mode: ON")
  else
    vim.opt_local.keymap = ""
    vim.opt_local.iminsert = 0
    vim.opt_local.imsearch = 0
    vim.opt_local.rightleft = false
    vim.b.hebrew_mode_enabled = false
    vim.notify("Hebrew mode: OFF")
  end
end
map("n", "<F1>", function() HebewToggle() end)
vim.api.nvim_create_user_command("HebrewToggle", HebewToggle, {})


local set_colorscheme = function(colorscheme, is_transparent)
  vim.cmd.colorscheme(colorscheme)
  if is_transparent then set_transparent() end
end

vim.api.nvim_create_user_command("Colorscheme", function(args)
  set_colorscheme(args.args, true)
end, { nargs = 1 })

vim.filetype.add({ extension = { pl = "prolog" } })

-- ==============================================
-- OPTIONS
-- ==============================================

o.termguicolors = true

o.number = true
o.relativenumber = true
o.cursorline = true
o.wrap = false
o.scrolloff = 10
o.sidescrolloff = 10

o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true

o.smartindent = true
o.autoindent = true

o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true

o.signcolumn = "yes"
o.colorcolumn = "120"
o.showmatch = true
o.cmdheight = 1
o.completeopt = "menuone,noinsert,noselect"
o.showmode = false
o.pumheight = 10
o.pumblend = 10
o.winblend = 0
o.conceallevel = 0
o.concealcursor = ""
o.synmaxcol = 300
o.fillchars = { eob = " " }

local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir == 0) then
  vim.fn.mkdir(undodir, "p")
end

o.backup = false
o.writebackup = false
o.swapfile = false
o.undofile = true
o.undodir = undodir
o.updatetime = 300
o.timeoutlen = 500
o.ttimeoutlen = 0
o.autoread = true
o.autowrite = false

o.hidden = true
o.errorbells = false
o.backspace = "indent,eol,start"
o.autochdir = false
o.iskeyword:append("-")
o.path:append("**")
o.selection = "inclusive"
o.mouse = "a"
o.clipboard:append("unnamedplus")
o.modifiable = true
o.encoding = "UTF-8"

o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldlevel = 99

o.splitbelow = true
o.splitright = true

o.wildmenu = true
o.wildmode = "longest:full,full"
o.diffopt:append("linematch:60")
o.redrawtime = 10000
o.maxmempattern = 20000

-- ==============================================
-- KEYMAPS
-- ==============================================

g.mapleader = " "
g.maplocalleader = " "

map("n", "j", function()
  return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })

map("n", "k", function()
  return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })

map("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search hl" })
map("n", "-", ":Ex<CR>", { desc = "Open Netrw" })

map("i", "<C-c>", "<Esc>", { noremap = true })
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>r", ":w<CR>:restart<CR>")

map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

map("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
map({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })

map("n", "<leader>-", ":split<CR>", { desc = "Split horizontally" })
map("n", "<leader>|", ":vsplit<CR>", { desc = "Split vertically" })

map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase width" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

map("v", "<", "<gv", { desc = "Indent selection left and reselect" })
map("v", ">", ">gv", { desc = "Indent selection right and reselect" })

map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

map("n", "<leader>fp", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("file:", path)
end, { desc = "Copy full file path" })

map("n", "<leader>td", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })


-- ==============================================
-- AUTOCMDS
-- ==============================================

-- Highligh on yank
autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Return cursor to previous position
autocmd("BufReadPost", {
  group = augroup,
  desc = "Restore last cursor position",
  callback = function()
    if vim.o.diff then
      return
    end

    local last_pos = vim.api.nvim_buf_get_mark(0, '"') -- {line, col}
    local last_line = vim.api.nvim_buf_line_count(0)

    local row = last_pos[1]
    if row < 1 or row > last_line then
      return
    end

    pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
  end,
})

-- wrap, linebreak and spellchecking on markdown and text files
autocmd("FileType", {
  group = augroup,
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.spell = true
  end,
})

autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    --   require("lualine").setup({ options = { theme = "auto" } })
    vim.defer_fn(function()
      vim.opt.laststatus = 0
    end, 10)
  end,
})


-- ==============================================
-- PLUGINS (vim.pack)
-- ==============================================

vim.pack.add({
  "https://github.com/mbbill/undotree",
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
  },
  "https://github.com/christoomey/vim-tmux-navigator",
  "https://github.com/folke/snacks.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/vimpostor/vim-tpipeline",
  "https://github.com/RRethy/base16-nvim",

  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/catgoose/nvim-colorizer.lua",

  -- LSP STUFF
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mfussenegger/nvim-lint",
  "https://github.com/stevearc/conform.nvim",
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("1.*")
  },
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/rafamadriz/friendly-snippets",

  -- COLORS
  "https://github.com/catppuccin/nvim",
  "https://github.com/mofiqul/dracula.nvim",
  "https://github.com/ellisonleao/gruvbox.nvim",
  "https://github.com/maxmx03/solarized.nvim",
  "https://github.com/neanias/everforest-nvim",
  "https://github.com/mhartington/oceanic-next",
  "https://github.com/shaunsingh/nord.nvim",
  "https://github.com/rose-pine/neovim"
})

-- ==============================================
-- PLUGIN CONFIGS
-- ==============================================

-- ==============================================
-- UNDOTREE & TREE-SITTER
-- ==============================================
map("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Toggle undo tree" })

local setup_treesitter = function()
  local treesitter = require("nvim-treesitter")
  treesitter.setup({})
  local ensure_installed = {
    "vim",
    "vimdoc",
    "c",
    "cpp",
    "python",
    "java",
    "javascript",
    "css",
    "html",
    "lua",
    "markdown",
    "typescript",
    "bash",
    "rasi",
    "asm",
  }

  local config = require("nvim-treesitter.config")

  local already_installed = config.get_installed()
  local parsers_to_install = {}

  for _, parser in ipairs(ensure_installed) do
    if not vim.tbl_contains(already_installed, parser) then
      table.insert(parsers_to_install, parser)
    end
  end

  if #parsers_to_install > 0 then
    treesitter.install(parsers_to_install)
  end

  local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
  autocmd("FileType", {
    group = group,
    callback = function(args)
      if vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(args.match)) then
        vim.treesitter.start(args.buf)
      end
    end,
  })
end

setup_treesitter()

-- ==============================================
-- NVIM TMUX NAVIGATION
-- ==============================================

map("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>")
map("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>")
map("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>")

-- ==============================================
-- SNACKS NVIM
-- ==============================================

require("snacks").setup({
  bigfile = { enabled = true },
  indent = { enabled = true },
  picker = {
    matcher = {
      frecency = true,
    },
  },
})

map("n", "<leader><space>", function()
  Snacks.picker.files({ hidden = true })
end)

map("n", "<C-f>", function()
  Snacks.picker.grep({ hidden = true })
end)

map("n", "<M-h>", function()
  Snacks.picker.highlights()
end)

map("n", "<M-k>", function()
  Snacks.picker.keymaps({ layout = "vertical" })
end)


-- ==============================================
-- UI - Statusline, Colorschemes and Notifs
-- ==============================================

require("catppuccin").setup({})
set_colorscheme("catppuccin-mocha", true)

--Making lualine transparent magic
-- local theme = require('lualine.themes.auto')
-- for _, mode in pairs(theme) do
--   if type(mode) == 'table' then
--     mode.c = { fg = (mode.c or {}).fg, bg = 'NONE' }
--   end
-- end

local setup_lualine = function(theme)
  require('lualine').setup({
    options = {
      theme = theme,
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

  o.laststatus = 0

  vim.g.tpipeline_autoembed = 1
  vim.g.tpipeline_restore = 1
  vim.g.tpipeline_clearstl = 1
end
setup_lualine("auto")

require("nvim-autopairs").setup({})
require("colorizer").setup({})



-- ==============================================
-- Diagnostics and LSP Binds
-- ==============================================

local diagnostic_signs = {
  Error = " ",
  Warn = " ",
  Hint = "",
  Info = "",
}

vim.diagnostic.config({
  virtual_text = { prefix = "●", spacing = 4 },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
      [vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
      [vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
      [vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
    focusable = false,
    style = "minimal",
  },
})

do
  local orig = vim.lsp.util.open_floating_preview
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "rounded"
    return orig(contents, syntax, opts, ...)
  end
end

local function lsp_on_attach(ev)
  local client = vim.lsp.get_client_by_id(ev.data.client_id)
  if not client then
    return
  end

  local bufnr = ev.buf
  local opts = { noremap = true, silent = true, buffer = bufnr }

  map("n", "<leader>D", function()
    vim.diagnostic.open_float({ scope = "line" })
  end, opts)
  map("n", "<leader>d", function()
    vim.diagnostic.open_float({ scope = "cursor" })
  end, opts)

  map("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
  map("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
  map("n", "grr", function() Snacks.picker.lsp_references() end, { nowait = true, desc = "References" })
  map("n", "gi", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
  map("n", "gt", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
  map("n", "gci", function() Snacks.picker.lsp_incoming_calls() end, { desc = "C[a]lls Incoming" })
  map("n", "gco", function() Snacks.picker.lsp_outgoing_calls() end, { desc = "C[a]lls Outgoing" })
  map("n", "gs", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
  map("n", "gS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })
  map("n", "gca", function() vim.lsp.buf.code_action() end, { desc = "LSP Workspace Symbols" })

  if client:supports_method("textDocument/codeAction", bufnr) then
    vim.keymap.set("n", "<leader>oi", function()
      vim.lsp.buf.code_action({
        context = { only = { "source.organizeImports" }, diagnostics = {} },
        apply = true,
        bufnr = bufnr,
      })
      vim.defer_fn(function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end, 50)
    end, opts)
  end
end
autocmd("LspAttach", { group = augroup, callback = lsp_on_attach })

vim.keymap.set("n", "<leader>q", function()
  vim.diagnostic.setloclist({ open = true })
end, { desc = "Open diagnostic list" })

-- ==============================================
-- BLINK COMPLETION
-- ==============================================

require("blink.cmp").setup({
  keymap = {
    preset = "none",
    ["<C-Space>"] = { "show", "hide" },
    ["<CR>"] = { "accept", "fallback" },
    ["<C-j>"] = { "select_next", "fallback" },
    ["<C-k>"] = { "select_prev", "fallback" },
    ["<Tab>"] = { "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "snippet_backward", "fallback" },
    ["<C-s>"] = { 'show_signature', 'hide_signature', 'fallback' },
  },
  appearance = { nerd_font_variant = "mono" },
  completion = { menu = { auto_show = true }, documentation = { auto_show = true }, },
  sources = { default = { "lsp", "path", "buffer", "snippets" } },
  snippets = { preset = "luasnip" },

  fuzzy = {
    implementation = "prefer_rust",
    prebuilt_binaries = { download = true },
  },

  signature = { enabled = true }
})

vim.lsp.config["*"] = {
  capabilitiesg = require("blink.cmp").get_lsp_capabilities(),
}

-- ==============================================
-- LSP CONFIGS
-- ==============================================

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim", "Snacks" } },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.config("asm_lsp", {
  settings = {
    assembler = {
      dialect = "att"
    }
  }
})

vim.lsp.enable({
  "lua_ls",
  "bashls",
  "clangd",
  "ty",
  "asm_lsp",
  "prolog_ls"
})

-- ==============================================
-- MASON
-- ==============================================

local setup_mason = function()
  local mason = require("mason")
  local registry = require("mason-registry")

  mason.setup({})

  local ensure_installed = {
    "lua-language-server",
    "bash-language-server",
    "shfmt",
    "shellcheck",
    "clangd",
    "clang-format",
    "ty",   -- python lsp
    "ruff", -- python lint and format
  }

  -- 3. Hook into the registry to install missing tools
  registry.refresh(function()
    for _, tool_name in ipairs(ensure_installed) do
      if registry.has_package(tool_name) then
        local pkg = registry.get_package(tool_name)

        if not pkg:is_installed() then
          vim.notify("Mason installing: " .. tool_name, vim.log.levels.INFO)
          pkg:install()
        end
      else
        vim.notify("Mason: " .. tool_name .. " not found in registry", vim.log.levels.WARN)
      end
    end
  end)
end

setup_mason()

-- ==============================================
-- LINTING, FORMATTING
-- ==============================================

local lint = require("lint")

lint.linters_by_ft = {
  sh = { "shellcheck" },
  python = { "ruff" },
}

local lint_augroup = vim.api.nvim_create_augroup("LintConfig", { clear = true })

autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end
})

require("conform").setup({
  formatters_by_ft = {
    sh = { "shfmt" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    python = { "ruff_format" },
    --   asm = { "asmfmt" }
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})

-- ==============================================
-- AUTO THEMING
-- ==============================================

local handle_matugen = function()
  local command = os.getenv("HOME") .. "/dotfiles/bin/theme-hue"
  local hue_file = io.popen(command, 'r')

  if hue_file then
    local hue = tonumber(hue_file:read('*a'))
    hue_file:close()

    -- if hue >= 345 or hue < 15 then
    --   -- Red
    --   set_colorscheme("dracula", true)
    -- elseif hue >= 15 and hue < 45 then
    --   -- Orange
    --   set_colorscheme("gruvbox", true)
    -- elseif hue >= 45 and hue < 75 then
    --   -- Yellow
    --   set_colorscheme("solarized", true)
    -- elseif hue >= 75 and hue < 165 then
    --   -- Green
    --   set_colorscheme("everforest", true)
    -- elseif hue >= 165 and hue < 195 then
    --   -- Cyan
    --   set_colorscheme("OceanicNext", true)
    -- elseif hue >= 195 and hue < 255 then
    --   -- Blue
    --   set_colorscheme("nord", true)
    -- elseif hue >= 255 and hue < 285 then
    --   -- Purple
    --   set_colorscheme("catppuccin-mocha", true)
    -- elseif hue >= 285 and hue < 345 then
    --   -- Pink
    --   set_colorscheme("rose-pine", true)
    -- end
  end

  local matugen_path = os.getenv("HOME") .. '/.config/nvim/matugen.lua'

  local file = io.open(matugen_path)
  if not file then
    return false
  else
    dofile(matugen_path)
    io.close(file)
  end

  vim.schedule(function()
    vim.cmd("redraw!")
  end)

  return true
end

local detect_theme = function()
  local default = "catppuccin"
  local theme_path = os.getenv("HOME") .. '/dotfiles/current/theme/nvim'
  local theme_file = io.open(theme_path, "r")

  if not theme_file then
    set_colorscheme(default, true)
    return
  end

  local theme = theme_file:read()
  theme_file:close()

  if not theme then
    set_colorscheme(default, true);
    return
  end

  if theme == "matugen" then
    if handle_matugen() then
      return
    else
      set_colorscheme(default, true)
    end
  end

  set_colorscheme(theme, true)
  vim.schedule(function()
    vim.cmd("redraw!")
  end)
end
detect_theme() -- at the start

autocmd("Signal", {
  pattern = "SIGUSR1",
  group = augroup,
  callback = detect_theme,
  nested = true,
})
