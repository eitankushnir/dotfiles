return {
    'mfussenegger/nvim-dap',
    dependencies = {
        -- UI for nvim-dap
        'rcarriga/nvim-dap-ui',

        --Dependency for nvim-dap-ui
        'nvim-neotest/nvim-nio',

        -- Virtual text to display values inline why debugging
        'theHamsta/nvim-dap-virtual-text',

        -- Debug adapter for python
        'mfussenegger/nvim-dap-python',
    },
    keys = {
        { "<leader>dc",  function() require('dap').continue() end,                                             desc = "Continue debug session" },
        { "<leader>dsi", function() require('dap').step_into() end,                                            desc = "Step into while in debug session" },
        { "<leader>dso", function() require('dap').step_over() end,                                            desc = "Step over while in a debug session" },
        { "<leader>dsO", function() require('dap').step_out() end,                                             desc = "Step out while in a debug session" },
        { "<leader>db",  function() require('dap').toggle_breakpoint() end,                                    desc = "Set breakpoint" },
        { "<leader>dB",  function() require('dap').set_breakpoint(vim.fn.input('Breakpoint Condition: ')) end, desc = "Set conditional breakpoint" },
        { "<leader>dt",  function() require('dapui').toggle() end,                                             desc = "Toggle DapUI" },
        { "<leader>dT",  function() require('dap').terminate() end,                                            desc = "Terminate debug session" },
        { "<leader>dl",  function() require('dap').run_last() end,                                             desc = "Run the last debug session configuration" },
        {
            "<leader>dr",
            function()
                require('dapui').close()
                require('dapui').setup()
                require('dapui').open()
            end,
            desc = "Reset DapUI windows"
        },
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')

        dapui.setup()

        -- Automatically open/close DAP UI
        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close

        require('nvim-dap-virtual-text').setup()

        local mason_path = vim.fn.stdpath('data') .. "/mason/packages"
        -- C/C++/Rust Adapater configuration.
        local cpptools_path = mason_path .. '/cpptools/extension/debugAdapters/bin/OpenDebugAD7'
        dap.adapters.cppdbg = {
            id = 'cppdbg',
            type = 'executable',
            command = cpptools_path,
        }
        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "cppdbg",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopAtEntry = true,
            },
            {
                name = 'Attach to gdbserver :1234',
                type = 'cppdbg',
                request = 'launch',
                MIMode = 'gdb',
                miDebuggerServerAddress = 'localhost:1234',
                miDebuggerPath = '/usr/bin/gdb',
                cwd = '${workspaceFolder}',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
            },
        }
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp

        -- Python adapter configuration
        require('dap-python').setup("python3")
    end

}
