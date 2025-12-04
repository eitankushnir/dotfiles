local ensured_installed = {
    "lua_ls",
    "clangd",
    "hyprls",
    "ty",
    "bashls",
    "jdtls",
    "docker_language_server",
    "ts_ls",
    "html",
    "emmet_language_server",
}

-- Download all lsps that are in ensure_installed
for _, config in ipairs(ensured_installed) do
    local cmd = "$HOME/.dotfiles/bin/nvim-download-lspconf " .. config
    local f = io.popen(cmd, "r")
    if not f then
        print("failed to pipe for cmd " .. cmd)
    end

    local output = f:read('*all')
    --vim.notify(output)
end

vim.lsp.enable(ensured_installed)


-- vim.api.nvim_create_autocmd('LspAttach', {
--     callback = function(ev)
--         local client = vim.lsp.get_client_by_id(ev.data.client_id)
--         if not client then return end
--
--         if client:supports_method("textDocument/formatting", 0) then
--             vim.api.nvim_create_autocmd('BufWritePre', {
--                 buffer = ev.buf,
--                 callback = function()
--                     vim.lsp.buf.format({ bufnr = ev.buf, id = client.id })
--                 end,
--             })
--         end
--     end
-- })

vim.diagnostic.config({
    virtual_text = true
})
