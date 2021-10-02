-- general
lvim.format_on_save = false
lvim.leader = " "
lvim.colorscheme = "pablo"
lvim.debug = false
lvim.log.level = "warn"
-- lvim.transparent_window = false

require("user.neovim").config()

-- Customization
-- =============================================
lvim.builtin.lastplace = { active = false } -- change to false if you are jumping to future
lvim.builtin.tabnine = { active = true }
lvim.builtin.fancy_statusline = { active = true } -- change this to enable/disable fancy statusline
lvim.builtin.fancy_bufferline = { active = true } -- change this to enable/disable fancy bufferline
lvim.builtin.cheat = { active = true } -- enable cheat.sh integration
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
