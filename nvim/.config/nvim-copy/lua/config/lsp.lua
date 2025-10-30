vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("hyprls")
vim.lsp.enable("pyright")


vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then return end

        if client:supports_method("textDocument/formatting", 0) then
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = ev.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = ev.buf, id = client.id })
                end,
            })
        end
    end
})

vim.diagnostic.config({
    virtual_lines = {
        current_line = true,
    },
})
