
-- ==========================================
-- General Settings
-- ==========================================

vim.opt.encoding = "utf-8"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"

-- Enable filetype detection, plugins and indentation
vim.cmd("filetype plugin indent on")

-- Disable providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0

-- Themes
vim.opt.termguicolors = true
--vim.cmd.colorscheme("habamax")
vim.cmd.colorscheme("gruvbox")

-- ==========================================
-- Indentation
-- ==========================================

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Preserve indentation when wrapping lines
vim.opt.breakindent = true

-- ==========================================
-- Search
-- ==========================================

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- ==========================================
-- Visual Settings
-- ==========================================

vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.showmatch = true
vim.opt.wrap = false
vim.opt.scrolloff = 10

vim.opt.list = false
vim.opt.listchars = {
    tab = ">-",
    trail = ".",
    extends = ">",
    precedes = "<",
    space = "·",
    eol = "$",
}

-- ==========================================
-- Clipboard
-- ==========================================

vim.opt.clipboard = "unnamedplus"

-- ==========================================
-- Spell Checking
-- ==========================================

vim.opt.spelllang = { "en", "hr" }
vim.opt.spell = false

-- ==========================================
-- Syntax Highlighting
-- ==========================================

vim.opt.syntax = "on"
vim.opt.termguicolors = true

