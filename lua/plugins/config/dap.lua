local dap = require "dap"
local dapui = require "dapui"

-- DAP UI setup
dapui.setup {
    icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
    controls = {
        icons = {
            pause = "⏸",
            play = "▶",
            step_into = "⏎",
            step_over = "⏭",
            step_out = "⏮",
            step_back = "b",
            run_last = "▶▶",
            terminate = "⏹",
            disconnect = "⏏",
        },
    },
}

-- DAP listeners
dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

-- Mason DAP setup
require("mason-nvim-dap").setup {
    automatic_installation = true,
    ensure_installed = {},
}

-- Keybindings
vim.keymap.set("n", "<leader>dc", function()
    dap.continue()
end, { desc = "[D]ebug: [C]ontinue" })

vim.keymap.set("n", "<leader>di", function()
    dap.step_into()
end, { desc = "[D]ebug: Step [I]nto function" })

vim.keymap.set("n", "<leader>do", function()
    dap.step_over()
end, { desc = "[D]ebug: Step [O]ver current line" })

vim.keymap.set("n", "<leader>dx", function()
    dap.step_out()
end, { desc = "[D]ebug: Step e[X]it function" })

vim.keymap.set("n", "<leader>db", function()
    dap.toggle_breakpoint()
end, { desc = "[D]ebug: Toggle [B]reakpoint" })

vim.keymap.set("n", "<leader>dB", function()
    dap.set_breakpoint(vim.fn.input "Condition: ")
end, { desc = "[D]ebug: Set [B]reakpoint with condition" })

vim.keymap.set("n", "<leader>ds", function()
    dap.set_breakpoint(nil, nil, vim.fn.input "Log message: ")
end, { desc = "[D]ebug: Set [S]tandard Logpoint" })

vim.keymap.set("n", "<leader>dt", function()
    require("dapui").toggle()
end, { desc = "[D]ebug: [T]oggle Frontend Debug UI" })

vim.keymap.set("n", "<leader>dl", function()
    dap.run_last()
end, { desc = "[D]ebug: Run [L]ast session" })

vim.keymap.set("n", "<leader>dr", function()
    dap.restart()
end, { desc = "[D]ebug: [R]estart session" })

-- Setup debuggers for specific languages
