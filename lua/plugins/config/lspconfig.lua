-- LSP Key mappings

-- Create autocommand for LSP attach events
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
        local buf = event.buf
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        -- Key mappings for LSP actions
        vim.keymap.set("n", "<leader>lfd", require("telescope.builtin").lsp_definitions, { desc = "[L]SP: [F]ind [D]efinitions" })
        vim.keymap.set("n", "<leader>lfr", require("telescope.builtin").lsp_references, { desc = "[L]SP: [F]ind [R]eferences" })
        vim.keymap.set("n", "<leader>lfi", require("telescope.builtin").lsp_implementations, { desc = "[L]SP: [F]ind [I]mplementations" })
        vim.keymap.set("n", "<leader>ltd", require("telescope.builtin").lsp_type_definitions, { desc = "[L]SP: [T]ype [D]efinitions" })
        vim.keymap.set("n", "<leader>lds", require("telescope.builtin").lsp_document_symbols, { desc = "[L]SP: [D]ocument [S]ymbols" })
        vim.keymap.set("n", "<leader>lws", require("telescope.builtin").lsp_dynamic_workspace_symbols, { desc = "[L]SP: [W]orkspace [S]ymbols" })
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "LSP: [C]ode [R]ename" })
        vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction" })
        vim.keymap.set("n", "<leader>lgd", vim.lsp.buf.declaration, { desc = "[L]SP: [G]oto [D]eclaration" })

        -- Highlight references
        if client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = buf,
                group = highlight_group,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = buf,
                group = highlight_group,
                callback = vim.lsp.buf.clear_references,
            })
        end

        -- Toggle inlay hints if supported
        if client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            vim.keymap.set("n", "<leader>th", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = buf })
            end, { desc = "LSP: [T]oggle Inlay [H]ints" })
        end
    end,
})

-- Set up LSP client capabilities (with nvim-cmp support)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

-- LSP Servers configuration
local servers = {
    clangd = {},
    pyright = {},
    ts_ls = {},
    lua_ls = {
        settings = {
            Lua = {
                completion = { callSnippet = "Replace" },
            },
        },
    },
}

-- Install required LSP servers and tools via Mason
local ensure_installed = vim.tbl_keys(servers)
vim.list_extend(ensure_installed, { "stylua", "clang-format", "isort", "black", "flake8", "prettier" })

-- Setup Mason Tool Installer for additional tools required for Conform
require("mason-tool-installer").setup {
    ensure_installed = ensure_installed,
}

-- Setup Mason LSPconfig
require("mason-lspconfig").setup {
    handlers = {
        function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
        end,
    },
}
