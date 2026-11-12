
-- ==========================================
-- Statusline
-- ==========================================

vim.opt.laststatus = 2
vim.opt.showmode = false

-- ==========================================
-- Mode Indicator Colors
-- ==========================================

vim.api.nvim_set_hl(0, "ModeNormal", {
    fg = "#282828",
    bg = "#ebdbb2",
    bold = true,
})

vim.api.nvim_set_hl(0, "ModeInsert", {
    fg = "#282828",
    bg = "#fb4934",
    bold = true,
})

vim.api.nvim_set_hl(0, "ModeVisual", {
    fg = "#282828",
    bg = "#fabd2f",
    bold = true,
})

vim.api.nvim_set_hl(0, "ModeReplace", {
    fg = "#282828",
    bg = "#fe8019",
    bold = true,
})

vim.api.nvim_set_hl(0, "ModeCommand", {
    fg = "#282828",
    bg = "#b8bb26",
    bold = true,
})

vim.api.nvim_set_hl(0, "ModeTerminal", {
    fg = "#282828",
    bg = "#83a598",
    bold = true,
})

-- ==========================================
-- Mode Indicator Function
-- ==========================================

_G.mode_status = function()
    local mode = vim.api.nvim_get_mode().mode

    local modes = {
        n = { " NORMAL ", "ModeNormal" },
        i = { " INSERT ", "ModeInsert" },
        v = { " VISUAL ", "ModeVisual" },
        V = { " V-LINE ", "ModeVisual" },
        ["\22"] = { " V-BLOCK ", "ModeVisual" },
        s = { " SELECT ", "ModeVisual" },
        S = { " S-LINE ", "ModeVisual" },
        ["\19"] = { " S-BLOCK ", "ModeVisual" },
        R = { " REPLACE ", "ModeReplace" },
        c = { " COMMAND ", "ModeCommand" },
        t = { " TERMINAL ", "ModeTerminal" },
    }

    local current = modes[mode] or {
        " " .. mode:upper() .. " ",
        "ModeNormal",
    }

    return "%#" .. current[2] .. "#" .. current[1] .. "%#StatusLine#"
end

-- ==========================================
-- Statusline Layout
-- ==========================================

vim.opt.statusline = table.concat({
    "%{%v:lua.mode_status()%}",
    " ",
    "%f",
    " %m",
    " %r",
    "%=",
    "%{&filetype}",
    " | ",
    "%{&fileencoding}",
    " | ",
    "%{&fileformat}",
    " │ ",
    "Ln %l/%L",
    " │ ",
    "%p%%",
    " ",
})

-- ==========================================
-- Statusline Background
-- ==========================================

vim.api.nvim_set_hl(0, "StatusLine", {
    fg = "#ebdbb2",
    bg = "#3c3836",
})

vim.api.nvim_set_hl(0, "StatusLineNC", {
    fg = "#928374",
    bg = "#282828",
})

