return {
    on_attach = function(bufnr)
        local gitsigns = require "gitsigns"

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "<leader>gn", function()
            if vim.wo.diff then
                vim.cmd.normal { "]c", bang = true }
            else
                gitsigns.nav_hunk "next"
            end
        end, { desc = "[G]it [N]ext change" })

        map("n", "<leader>gp", function()
            if vim.wo.diff then
                vim.cmd.normal { "[c", bang = true }
            else
                gitsigns.nav_hunk "prev"
            end
        end, { desc = "[G]it [P]revious change" })

        -- Visual mode
        map("v", "<leader>gs", function()
            gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
        end, { desc = "[G]it [S]tage hunk" })
        map("v", "<leader>gr", function()
            gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
        end, { desc = "[G]it [R]eset hunk" })

        -- Normal mode
        map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "[G]it [S]tage hunk" })
        map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "[G]it [R]eset hunk" })
        map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "[G]it [S]tage buffer" })
        map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "[G]it [R]eset buffer" })
        map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "[G]it [P]review hunk" })
        map("n", "<leader>gb", gitsigns.blame_line, { desc = "[G]it [B]lame line" })
        map("n", "<leader>gd", gitsigns.diffthis, { desc = "[G]it [D]iff" })
        map("n", "<leader>gD", function()
            gitsigns.diffthis "@"
        end, { desc = "[G]it [D]iff against last commit" })

        -- Toggles
        map("n", "<leader>tgb", gitsigns.toggle_current_line_blame, { desc = "[T]oggle [G]it [B]lame line" })
        map("n", "<leader>tgd", gitsigns.preview_hunk_inline, { desc = "[T]oggle [G]it [D]eleted" })
        map("n", "<leader>tgw", gitsigns.toggle_word_diff, { desc = "[T]oggle [G]it [W]ord diff" })
    end,
}
