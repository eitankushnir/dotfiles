require("eitan.set")
require("eitan.remap")
require("eitan.lazy")

local augroup = vim.api.nvim_create_augroup
local EitanGroup = augroup('Eitan', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('LspAttach', {
    group = EitanGroup,
    callback = function(e)
        local client = vim.lsp.get_client_by_id(e.data.client_id)
        if not client then return end

        if client:supports_method('textDocument/foramtting', 0) then
            autocmd('BufWritePre', {
                buffer = e.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = e.buf, id = client.id })
                end,
            })
        end

        local opts = { buffer = e.buf }
        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', '<leader>gws', function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set('n', '<leader>gd', function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set('n', '<leader>gca', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', '<leader>grr', function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', '<leader>grn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
        vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
    end
})

-- Toggle ColorColumn off for netrw and on for files.
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    group = vim.api.nvim_create_augroup("FixColorColumnNetrw", { clear = true }),
    callback = function()
        vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#3c3836" })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        vim.wo.colorcolumn = "" -- disable in netrw
    end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.h",
    callback = function()
        vim.bo.filetype = "c"
    end
})

-- Function to make background transparent
vim.cmd [[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
]]
