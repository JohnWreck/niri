vim.o.background = "dark"

local colors = {
    bg       = "#282828",
    bg0      = "#1d2021",
    bg1      = "#3c3836",
    bg2      = "#504945",
    fg       = "#ebdbb2",
    gray     = "#928374",
    red      = "#fb4934",
    green    = "#b8bb26",
    yellow   = "#fabd2f",
    blue     = "#83a598",
    purple   = "#d3869b",
    aqua     = "#8ec07c",
    orange   = "#fe8019",
}

local groups = {
    Normal       = { fg = colors.fg, bg = colors.bg },
    NormalFloat  = { fg = colors.fg, bg = colors.bg1 },
    CursorLine   = { bg = colors.bg1 },
    LineNr       = { fg = colors.gray },
    CursorLineNr = { fg = colors.yellow },
    Visual       = { bg = colors.bg2 },

    Comment      = { fg = colors.gray, italic = true },
    Constant     = { fg = colors.purple },
    String       = { fg = colors.green },
    Character    = { fg = colors.green },
    Number       = { fg = colors.purple },
    Boolean      = { fg = colors.purple },
    Identifier   = { fg = colors.blue },
    Function     = { fg = colors.green },
    Statement    = { fg = colors.red },
    Keyword      = { fg = colors.red },
    Operator     = { fg = colors.fg },
    Type         = { fg = colors.yellow },
    Special      = { fg = colors.orange },

    PreProc      = { fg = colors.aqua },
    Search       = { fg = colors.bg, bg = colors.yellow },
    IncSearch    = { fg = colors.bg, bg = colors.orange },
    Pmenu        = { fg = colors.fg, bg = colors.bg1 },
    PmenuSel     = { fg = colors.bg, bg = colors.blue },

    DiagnosticError = { fg = colors.red },
    DiagnosticWarn  = { fg = colors.yellow },
    DiagnosticInfo  = { fg = colors.blue },
    DiagnosticHint  = { fg = colors.aqua },
}

for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
end

