return {
    -- Ensure these languages are installed for Treesitter
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "diff",
        "html",
        "javascript",
        "json",
        "lua",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "xml",
        "yaml",
    },

    -- Automatically install missing parsers
    auto_install = true,

    -- Highlighting configurations
    highlight = {
        enable = true, -- Enable Treesitter-based syntax highlighting
        -- Some languages (like Ruby) use Vim's regex-based highlighting system for indent rules.
        -- If you are experiencing weird indenting issues, you can add the language to the list of
        -- additional_vim_regex_highlighting to disable Treesitter for indentation.
        -- additional_vim_regex_highlighting = { },
    },

    -- Indentation configurations
    indent = {
        enable = true, -- Enable Treesitter-based indentation
        -- disable = { },
    },
}
