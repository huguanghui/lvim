-- general
lvim.colorscheme = "onedarker"
lvim.format_on_save = true
lvim.leader = " "
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
vim.opt.fileencodings = "utf-8,ucs-bom,gb18030,gb2312"
vim.opt.encoding = "utf-8"

-- Customization
-- =============================================
lvim.builtin.tabnine = { active = true }
lvim.builtin.fancy_statusline = { active = true } -- change this to enable/disable fancy statusline
lvim.builtin.fancy_bufferline = { active = true } -- change this to enable/disable fancy bufferline
require("user.builtin").config()

-- StatusLine
-- =========================================
if lvim.builtin.fancy_statusline.active then
	require("user.lualine").config()
end

-- Language Specific
-- =========================================
lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.override = { "java" }

-- Additional Plugins
-- =========================================
require("user.plugins").config()

-- Autocommands
-- =========================================
require("user.autocommands").config()

-- Additional keybindings
-- =========================================
require("user.keybindings").config()
