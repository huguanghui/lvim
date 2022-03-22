-- Neovim
-- =========================================
lvim.format_on_save = false
lvim.leader = " "
lvim.colorscheme = "pablo"
lvim.debug = false
vim.lsp.set_log_level "warn"
lvim.log.level = "warn"
require("user.neovim").config()

-- Customization
-- =========================================
lvim.builtin.sell_your_soul_to_devil = true -- if you want microsoft to abuse your soul
lvim.builtin.lastplace = { active = false } -- change to false if you are jumping to future
lvim.builtin.tabnine = { active = true } -- change to false if you don't like tabnine
lvim.builtin.dap = { active = false } -- change this to enable/disable debugging
lvim.builtin.fancy_statusline = { active = true } -- change this to enable/disable fancy statusline
lvim.builtin.fancy_rename = { active = true } -- enable/disable custom rename
lvim.builtin.lua_dev = { active = true } -- change this to enable/disable folke/lua_dev
lvim.builtin.cheat = { active = true } -- enable cheat.sh integration
lvim.builtin.neoscroll = { active = true } -- smooth scrolling
lvim.builtin.sidebar = { active = false } -- enable/disable sidebar
lvim.builtin.async_tasks = { active = true } -- enable/disable async tasks
lvim.lsp.diagnostics.virtual_text = false -- remove this line if you want to see inline errors
lvim.builtin.notify.active = true
lvim.lsp.automatic_servers_installation = false
lvim.lsp.document_highlight = true
lvim.lsp.code_lens_refresh = true
lvim.builtin.file_browser = { active = true } -- enable/disable telescope file browser
lvim.builtin.tag_provider = "symbols-outline" -- change this to use different tag providers ( symbols-outline or vista )
lvim.builtin.nvim_web_devicons = { active = false }
lvim.builtin.editorconfig = { active = true } -- enable/disable editorconfig
lvim.builtin.fancy_telescope = { active = true } -- enable/disable fancy telescope
lvim.builtin.global_statusline = false

local user = os.getenv "USER"
if user and user == "hgh" then
  lvim.builtin.dap.active = false
  lvim.builtin.global_statusline = true
end

require("user.builtin").config()

-- StatusLine
-- =========================================
if lvim.builtin.fancy_statusline.active then
  require("user.lualine").config()
end

-- Language Specific
-- =========================================
vim.list_extend(
  lvim.lsp.override,
  { "clangd", "pyright", "r_language_server", "rust_analyzer", "tsserver", "dockerls", "texlab", "sumneko_lua", "gopls", "taplo" }
)
require("user.null_ls").config()

-- Additional Plugins
-- =========================================
require("user.plugins").config()

-- Autocommands
-- =========================================
require("user.autocommands").config()

-- Additional keybindings
-- =========================================
require("user.keybindings").config()
