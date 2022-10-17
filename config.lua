-- Neovim
-- =========================================
lvim.format_on_save = false
lvim.leader = " "
lvim.colorscheme = "tokyonight" -- set to a custom theme
lvim.builtin.time_based_themes = true -- set false to use your own configured theme
lvim.transparent_window = false -- enable/disable transparency
lvim.debug = false
vim.lsp.set_log_level "warn"
lvim.log.level = "warn"
require("user.neovim").config()
lvim.lsp.code_lens_refresh = true
lvim.lsp.diagnostics.virtual_text = false -- remove this line if you want to see inline errors
lvim.lsp.automatic_servers_installation = false

-- Customization
-- =========================================
lvim.builtin.sell_your_soul_to_devil = true -- if you want microsoft to abuse your soul
lvim.builtin.lastplace = { active = false } -- change to false if you are jumping to future
lvim.builtin.tabnine = { active = true } -- change to false if you don't like tabnine
lvim.builtin.persistence = { active = true } -- change to false if you don't want persistence
lvim.builtin.dap.active = false -- change this to enable/disable debugging
lvim.builtin.fancy_statusline = { active = true } -- change this to enable/disable fancy statusline
lvim.builtin.fancy_wild_menu = { active = true } -- enable/disable cmp-cmdline
lvim.builtin.lua_dev = { active = true } -- change this to enable/disable folke/lua_dev
lvim.builtin.test_runner = { active = true, runner = "ultest" } -- change this to enable/disable ultest or neotest
lvim.builtin.cheat = { active = true } -- enable cheat.sh integration
lvim.builtin.smooth_scroll = "cinnamon" -- for smoth scrolling, can be "cinnamon", "neoscroll" or ""
lvim.builtin.neoclip = { active = true, enable_persistent_history = false }
lvim.builtin.harpoon = { active = true } -- use the harpoon plugin
lvim.builtin.cursorline = { active = false } -- use a bit fancier cursorline
lvim.builtin.motion_provider = "hop" -- change this to use different motion providers ( hop or lightspeed )
lvim.builtin.csv_support = false -- enable/disable csv support
lvim.builtin.sidebar = { active = false } -- enable/disable sidebar
lvim.builtin.winbar_provider = "filename" -- can be "filename" or "treesitter" or "navic" or ""
lvim.builtin.async_tasks = { active = true } -- enable/disable async tasks
lvim.builtin.collaborative_editing = { active = false } -- enable/disable collaborative editing
lvim.builtin.file_browser = { active = true } -- enable/disable telescope file browser
lvim.builtin.tag_provider = "symbols-outline" -- change this to use different tag providers ( symbols-outline or vista )
lvim.builtin.custom_web_devicons = false
lvim.builtin.editorconfig = { active = true } -- enable/disable editorconfig
lvim.builtin.global_statusline = false
lvim.builtin.dressing = { active = true } -- enable to override vim.ui.input and vim.ui.select with telescope
lvim.builtin.refactoring = { active = false } -- enable to use refactoring.nvim code_actions
lvim.builtin.tmux_lualine = false -- use vim-tpipeline to integrate lualine and tmux
lvim.builtin.lsp_lines = false -- enable/disable lsp_lines to display lsp virtual text below instead of behind
if lvim.builtin.lsp_lines then
  lvim.lsp.diagnostics.virtual_text = false
end
lvim.builtin.tree_provider = "nvimtree" -- can be "neo-tree" or "nvimtree" or ""
lvim.builtin.lir.active = false
lvim.builtin.breadcrumbs.active = false
lvim.builtin.illuminate.active = false
lvim.builtin.indentlines.active = true
lvim.builtin.notify.active = true
lvim.builtin.noice = { active = true } -- enable/disable noice

local user = os.getenv "USER"
if user and (user == "hgh" or user == "yh") then
  lvim.reload_config_on_save = true
  lvim.builtin.tmux_lualine = false
  if lvim.builtin.tmux_lualine then
    vim.opt.cmdheight = 1 -- WARN: =0 is broken on neovim head (https://github.com/neovim/neovim/issues/20281)
    vim.g.tpipeline_cursormoved = 1
  end
  if user == "hgh" then
    lvim.builtin.custom_web_devicons = true
    lvim.use_icons = false -- only set to false if you know what are you doing
  else
    lvim.builtin.custom_web_devicons = false
    lvim.use_icons = true -- only set to false if you know what are you doing
  end
  lvim.builtin.dap.active = true
  vim.g.instant_username = user
  lvim.builtin.collaborative_editing.active = true
  lvim.builtin.global_statusline = true
  lvim.builtin.dressing.active = true
  lvim.builtin.fancy_wild_menu.active = true
  lvim.builtin.refactoring.active = true
  lvim.builtin.test_runner.runner = "neotest"
  lvim.format_on_save = {
    pattern = "*.rs",
    timeout = 2000,
    filter = require("lvim.lsp.utils").format_filter,
  }
  lvim.builtin.smooth_scroll = "cinnamon"
  -- require("lvim.lsp.manager").setup("prosemd_lsp", {})
end
if lvim.builtin.winbar_provider == "navic" then
  lvim.builtin.breadcrumbs.active = false
end
if lvim.builtin.cursorline.active then
  lvim.lsp.document_highlight = false
end

-- Override Lunarvim defaults
-- =========================================
require("user.builtin").config()

-- StatusLine
-- =========================================
if lvim.builtin.fancy_statusline.active then
  require("user.lualine").config()
end

-- Debugging
-- =========================================
if lvim.builtin.dap.active then
  require("user.dap").config()
end

-- Language Specific
-- =========================================
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, {
  "clangd",
  "dockerls",
  "gopls",
  "golangci_lint_ls",
  "jdtls",
  "pyright",
  "rust_analyzer",
  "taplo",
  "texlab",
  "tsserver",
  "yamlls",
})
require("user.null_ls").config()

-- Additional Plugins
-- =========================================
require("user.plugins").config()

-- Autocommands
-- =========================================
require("user.autocommands").config()

-- Additional Keybindings
-- =========================================
require("user.keybindings").config()
