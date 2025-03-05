return {
    notify_on_error = false, -- Do not notify on error
    format_on_save = false,
    formatters_by_ft = {
        -- Formatter settings by filetype
        lua = { "stylua" },
        python = { "black", "isort" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
    },
    formatters = {
        ["clang-format"] = {
            prepend_args = {
                "--style",
                "{IndentWidth: 4, TabWidth: 4, UseTab: Never}",
            },
        },
    },
}
