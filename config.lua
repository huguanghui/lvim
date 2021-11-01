-- Neovim
-- =========================================
lvim.format_on_save = false
lvim.leader = " "
lvim.colorscheme = "pablo"
lvim.debug = false
lvim.log.level = "warn"
require("user.neovim").config()

-- Customization
-- =========================================
lvim.builtin.sell_your_soul_to_devil = true -- if you want microsoft to abuse your soul
lvim.builtin.lastplace = { active = false } -- change to false if you are jumping to future
lvim.builtin.tabnine = { active = true } -- change to false if you don't like tabnine
lvim.builtin.fancy_statusline = { active = true } -- change this to enable/disable fancy statusline
lvim.builtin.fancy_bufferline = { active = true } -- change this to enable/disable fancy bufferline
lvim.builtin.fancy_dashboard = { active = true } -- change this to enable/disable fancy dashboard
lvim.builtin.lua_dev = { active = true } -- change this to enable/disable folke/lua_dev
lvim.builtin.cheat = { active = true } -- enable cheat.sh integration
lvim.builtin.neoscroll = { active = true } -- smooth scrolling
lvim.lsp.diagnostics.virtual_text = false -- remove this line if you want to see inline errors
lvim.lsp.automatic_servers_installation = false
lvim.lsp.document_highlight = true
lvim.lsp.code_lens_refresh = true
require("user.builtin").config()

-- StatusLine
-- =========================================
if lvim.builtin.fancy_statusline.active then
  require("user.lualine").config()
end

-- Language Specific
-- =========================================
local custom_servers = { "dockerls", "sumneko_lua", "texlab", "tsserver", "jsonls", "gopls" }
lvim.lsp.override = { "dockerls", "sumneko_lua", "texlab", "tsserver", "rust_analyzer" }
vim.list_extend(lvim.lsp.override, { "rust_analyzer" })
vim.list_extend(lvim.lsp.override, custom_servers)
require("user.null_ls").config()
for _, server_name in ipairs(custom_servers) do
 local status_ok, custom_config = pcall(require, "user/providers/" .. server_name) 
 if status_ok then
   require("lvim.lsp.manager").setup(server_name, custom_config)
 end
end

-- Additional Plugins
-- =========================================
require("user.plugins").config()

-- Autocommands
-- =========================================
require("user.autocommands").config()

-- Additional keybindings
-- =========================================
require("user.keybindings").config()
