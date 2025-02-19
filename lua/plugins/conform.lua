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
            -- have a well-standardized coding style. You can add additional
            -- languages here or re-enable it for the disabled ones.

            local disable_filetypes = { c = true, cpp = true } -- Disable for C/C++ files
            local lsp_format_opt

            -- Choose formatter based on filetype
            if disable_filetypes[vim.bo[bufnr].filetype] then
                lsp_format_opt = 'never' -- Disable LSP formatting for disabled filetypes
            else
                lsp_format_opt = 'fallback' -- Use fallback formatting for others
            end

            return {
                timeout_ms = 500, -- Timeout for formatting operation
                lsp_format = lsp_format_opt, -- LSP fallback or never based on filetype
            }
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
                prepend_args = function(ctx)
                    local config_file = vim.fs.find({ '.clang-format' }, { path = ctx.filename, upward = true })
                    if config_file[1] then
                        return {}
                    else
                        return {
                            '--style',
                            '{IndentWidth: 4, TabWidth: 4, UseTab: Never}',
                        }
                    end
                end,
            },
        },
    },
}
