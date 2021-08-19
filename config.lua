-- general
lvim.format_on_save = true
lvim.colorscheme = "darkplus"
lvim.debug = false
-- lvim.log.level = "debug"
-- lvim.lint_on_save = true
lvim.transparent_window = false

-- Default options
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.timeoutlen = 200
vim.opt.guifont = "FiraCode Nerd Font:h13"
vim.opt.cmdheight = 1

-- keymappings
lvim.leader = "space"

-- LSP
lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.override = {"java"}

-- Builtins
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
-- lvim.builtin.nvimtree.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 0

require("user.builtin").config()

-- Additional Plugins
-- =============================================
require("user.plugins").config()

-- Additional Keybindings
-- =============================================
require("user.keybindings").config()
