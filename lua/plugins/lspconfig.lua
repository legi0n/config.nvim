-- https://github.com/neovim/nvim-lspconfig

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'williamboman/mason.nvim', opts = {} }, -- Mason for managing LSPs
        'williamboman/mason-lspconfig.nvim', -- LSP integration with Mason
        'WhoIsSethDaniel/mason-tool-installer.nvim', -- Install tools using Mason
        { 'j-hui/fidget.nvim', opts = {} }, -- LSP status updates
        'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for LSP
    },
    config = function()
        -- Function to easily map keys for LSP actions
        local function map(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { desc = 'LSP: ' .. desc })
        end

        -- Create autocommand for LSP attach events
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
            callback = function(event)
                local buf = event.buf
                local client = vim.lsp.get_client_by_id(event.data.client_id)

                -- Key mappings for LSP actions
                map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
                map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
                map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
                map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
                map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
                map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                -- Highlight references
                if client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                    local highlight_group = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
                    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                        buffer = buf,
                        group = highlight_group,
                        callback = vim.lsp.buf.document_highlight,
                    })
                    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                        buffer = buf,
                        group = highlight_group,
                        callback = vim.lsp.buf.clear_references,
                    })
                end

                -- Toggle inlay hints if supported
                if client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                    map('<leader>th', function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = buf })
                    end, '[T]oggle Inlay [H]ints')
                end
            end,
        })

        -- Set up LSP client capabilities (with nvim-cmp support)
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

        -- LSP Servers configuration
        local servers = {
            clangd = {
                format = { enable = true }, -- Ensure formatting is enabled
            },
            pyright = {},
            ts_ls = {},
            lua_ls = {
                settings = {
                    Lua = {
                        completion = { callSnippet = 'Replace' },
                    },
                },
            },
        }

        -- Install required LSP servers and tools via Mason
        local ensure_installed = vim.tbl_keys(servers)
        vim.list_extend(ensure_installed, { 'stylua', 'isort', 'black' })

        -- Setup Mason Tool Installer
        require('mason-tool-installer').setup { ensure_installed = ensure_installed }

        -- Setup Mason LSPconfig
        require('mason-lspconfig').setup {
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    require('lspconfig')[server_name].setup(server)
                end,
            },
        }
    end,
}
