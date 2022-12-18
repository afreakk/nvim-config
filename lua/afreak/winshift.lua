require("winshift").setup({
    highlight_moving_win = true, -- Highlight the window being moved
    focused_hl_group = "Visual", -- The highlight group used for the moving window
    moving_win_options = {
        -- These are local options applied to the moving window while it's
        -- being moved. They are unset when you leave Win-Move mode.
        wrap = false,
        cursorline = false,
        cursorcolumn = false,
        colorcolumn = "",
    },

    ---A function that should prompt the user to select a window.
    ---
    ---The window picker is used to select a window while swapping windows with
    ---`:WinShift swap`.
    ---@return integer? winid # Either the selected window ID, or `nil` to
    ---   indicate that the user cancelled / gave an invalid selection.
    window_picker = function()
        return require("winshift.lib").pick_window({
            -- A string of chars used as identifiers by the window picker.
            picker_chars = "ARSTDHNEIOQWFPGJLUYZXCVBKM",
            filter_rules = {
                -- This table allows you to indicate to the window picker that a window
                -- should be ignored if its buffer matches any of the following criteria.
                cur_win = true, -- Filter out the current window
                floats = true, -- Filter out floating windows
                filetype = {
                    "NvimTree",
                    "coc-explorer",
                }, -- List of ignored file types
                buftype = {
                    "terminal",
                    "quickfix",
                }, -- List of ignored buftypes
                bufname = {}, -- List of vim regex patterns matching ignored buffer names
            },
            ---@diagnostic disable-next-line: assign-type-mismatch
            filter_func = nil,
        })
    end,
})
vim.keymap.set("n", "<C-W><C-M>", "<Cmd>WinShift<CR>")
vim.keymap.set("n", "<C-W>m", "<Cmd>WinShift<CR>")
vim.keymap.set("n", "<C-W>X", "<Cmd>WinShift swap<CR>")
vim.keymap.set("n", "<S-Left>", "<Cmd>WinShift left<CR>")
vim.keymap.set("n", "<S-Down>", "<Cmd>WinShift down<CR>")
vim.keymap.set("n", "<S-Up>", "<Cmd>WinShift up<CR>")
vim.keymap.set("n", "<S-Right>", "<Cmd>WinShift right<CR>")
