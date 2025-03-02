-- https://github.com/mfussenegger/nvim-dap

return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui', -- UI for DAP
        'nvim-neotest/nvim-nio', -- Neotest integration
        'williamboman/mason.nvim', -- For managing installations
        'jay-babu/mason-nvim-dap.nvim', -- DAP integration with Mason
    },
    keys = {
        {
            '<leader>dc',
            function()
                require('dap').continue()
            end,
            desc = '[D]ebug: [C]ontinue',
        },
        {
            '<leader>di',
            function()
                require('dap').step_into()
            end,
            desc = '[D]ebug: Step [I]nto',
        },
        {
            '<leader>do',
            function()
                require('dap').step_over()
            end,
            desc = '[D]ebug: Step [O]ver',
        },
        {
            '<leader>dx',
            function()
                require('dap').step_out()
            end,
            desc = '[D]ebug: Step [X]ut',
        },
        {
            '<leader>db',
            function()
                require('dap').toggle_breakpoint()
            end,
            desc = '[D]ebug: Toggle [B]reakpoint',
        },
        {
            '<leader>dB',
            function()
                require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
            end,
            desc = '[D]ebug: Set Breakpoint [B]reakpoint condition',
        },
        {
            '<leader>ds',
            function()
                require('dap').set_breakpoint(nil, nil, vim.fn.input 'Logpoint message: ')
            end,
            desc = '[D]ebug: Set Logpoint',
        },
        {
            '<leader>df',
            function()
                require('dapui').toggle()
            end,
            desc = '[D]ebug: Toggle Debug UI',
        },
        {
            '<leader>dl',
            function()
                require('dap').run_last()
            end,
            desc = '[D]ebug: Last [L]ast session',
        },
        {
            '<leader>dr',
            function()
                require('dap').restart()
            end,
            desc = '[D]ebug: [R]estart Debugger',
        },
    },
    config = function()
        local dap = require 'dap'
        local dapui = require 'dapui'

        -- DAP UI setup
        dapui.setup {
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        }

        -- DAP listeners
        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close

        -- Mason DAP setup
        require('mason-nvim-dap').setup {
            automatic_installation = true,
            ensure_installed = {},
        }

        -- Setup debuggers for specific languages
    end,
}
