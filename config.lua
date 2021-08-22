-- general
lvim.format_on_save = false
lvim.leader = " "
lvim.colorscheme = "darkplus"
lvim.debug = false
-- lvim.log.level = "debug"
-- lvim.lint_on_save = true
lvim.transparent_window = false
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.timeoutlen = 200
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 5
vim.opt.guifont = "FiraCode Nerd Font:h13"
vim.opt.cmdheight = 1
vim.opt.pumblend = 10
vim.opt.joinspaces = false
vim.opt.list = true

-- Customization
-- =============================================
lvim.builtin.terminal.active = true
-- lvim.builtin.nvimtree.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 0
require("user.builtin").config()

-- StatusLine
-- =============================================

-- Language Specific
-- =========================================
lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.override = {"java"}

-- Additional Plugins
-- =============================================
require("user.plugins").config()

-- Autocommands
-- =============================================
require("user.autocommands").config()

-- Additional Keybindings
-- =============================================
require("user.keybindings").config()
