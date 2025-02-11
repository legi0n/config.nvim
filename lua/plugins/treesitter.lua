-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate', -- Runs :TSUpdate to install or update parsers
    main = 'nvim-treesitter.configs', -- Sets main module to use for options
    opts = {
        -- Ensure these languages are installed for Treesitter
        ensure_installed = {
            'bash',
            'c',
            'cpp',
            'diff',
            'html',
            'javascript',
            'lua',
            'luadoc',
            'markdown',
            'markdown_inline',
            'python',
            'query',
            'typescript',
            'vim',
            'vimdoc',
        },

        -- Automatically install missing parsers
        auto_install = true,

        -- Highlighting configurations
        highlight = {
            enable = true, -- Enable Treesitter-based syntax highlighting
            -- Some languages (like Ruby) use Vim's regex-based highlighting system for indent rules.
            -- If you are experiencing weird indenting issues, you can add the language to the list of
            -- additional_vim_regex_highlighting to disable Treesitter for indentation.
            additional_vim_regex_highlighting = { 'ruby' },
        },

        -- Indentation configurations
        indent = {
            enable = true, -- Enable Treesitter-based indentation
            disable = { 'ruby' }, -- Disable Treesitter indentation for Ruby
        },
    },
}
