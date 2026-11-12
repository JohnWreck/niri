-- ==========================================
-- Neovim Configuration
-- ==========================================

-- Ensure Neovim can find Lua config modules
local config_path = vim.fn.stdpath("config")
package.path = config_path .. "/?.lua;" .. package.path

require("options")
require("keymaps")
require("statusline")

