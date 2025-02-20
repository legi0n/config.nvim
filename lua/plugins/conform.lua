-- https://github.com/stevearc/conform.nvim

return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' }, -- Trigger on buffer write (before save)
    cmd = { 'ConformInfo' }, -- Command to display Conform's information
    keys = {
        {
            '<leader>f', -- Shortcut to trigger formatting
            function()
                require('conform').format { async = true, lsp_format = 'fallback' }
            end,
            mode = '', -- Normal mode (default)
            desc = '[F]ormat buffer', -- Description for key mapping
        },
    },
    opts = {
        notify_on_error = false, -- Do not notify on error
        format_on_save = function(bufnr)
            -- Disable "format_on_save lsp_fallback" for languages that don't
            -- have a well standardized coding style. You can add additional
            -- languages here or re-enable it for the disabled ones.
            local disable_filetypes = { c = true, cpp = true }
            if disable_filetypes[vim.bo[bufnr].filetype] then
                return
            else
                return {
                    timeout_ms = 500,
                    lsp_format = 'fallback',
                }
            end
        end,
        formatters_by_ft = {
            -- Formatter settings by filetype
            lua = { 'stylua' }, -- Use 'stylua' for Lua files
            c = { 'clang-format' }, -- Use 'clang-format' for C files
            cpp = { 'clang-format' }, -- Use 'clang-format' for C++ files
            python = { 'black', 'isort' }, -- Use 'isort' and 'black' for Python files
            -- Example: You can run the first available formatter from the list
            -- javascript = { 'prettierd', 'prettier', stop_after_first = true },
        },
        formatters = {
            ['clang-format'] = {
                prepend_args = {
                    '--style',
                    '{IndentWidth: 4, TabWidth: 4, UseTab: Never}',
                },
            },
        },
    },
}
