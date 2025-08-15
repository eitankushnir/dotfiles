return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            require("dapui").setup()
            vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", { noremap = true })
            vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true })
            vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })
            vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>",
                { noremap = true })
            vim.fn.sign_define('DapBreakpoint',
                { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })

            local dap = require('dap')
            --CSHARP
            local mason_path = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg"
            local dotnet = require("eitan.configs.dap-dotnet")

            local netcoredbg_adapter = {
                type = "executable",
                command = mason_path,
                args = { "--interpreter=vscode" },
            }

            dap.adapters.netcoredbg = netcoredbg_adapter
            dap.adapters.coreclr = netcoredbg_adapter
            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    program = function()
                        return dotnet.build_dll_path()
                    end,
                },
            }
            --END CSHARP
        end
    }
}
