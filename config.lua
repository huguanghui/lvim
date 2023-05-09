-- Neovim
-- =========================================
lvim.leader = " "
lvim.colorscheme = "tokyonight" -- set to a custom theme
lvim.builtin.time_based_themes = true -- set false to use your own configured theme
lvim.transparent_window = false -- enable/disable transparency
lvim.debug = false
vim.lsp.set_log_level "error"
lvim.log.level = "warn"
require("user.neovim").config()
lvim.lsp.code_lens_refresh = true
lvim.lsp.installer.setup.automatic_installation = false

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
lvim.builtin.global_statusline = false
lvim.builtin.dressing = { active = true } -- enable to override vim.ui.input and vim.ui.select with telescope
lvim.builtin.refactoring = { active = false } -- enable to use refactoring.nvim code_actions
lvim.builtin.tmux_lualine = false -- use vim-tpipeline to integrate lualine and tmux
lvim.builtin.lsp_lines = false -- enable/disable lsp_lines to display lsp virtual text below instead of behind
lvim.builtin.lsp_signature = { active = false } -- enable/disable lsp_signature
lvim.builtin.tree_provider = "nvimtree" -- can be "neo-tree" or "nvimtree" or ""
lvim.builtin.lir.active = true
lvim.builtin.breadcrumbs.active = false
lvim.builtin.illuminate.active = false
lvim.builtin.indentlines.active = true
lvim.builtin.noice = { active = false } -- enables noice.nvim and inc-rename.nvim
lvim.builtin.go_programming = { active = false } -- gopher.nvim + nvim-dap-go
lvim.builtin.python_programming = { active = false } -- swenv.nvim + nvim-dap-python + requirements.txt.vim
lvim.builtin.web_programming = { active = false } -- typescript.nvim + package-info.nvim
lvim.builtin.rust_programming = { active = false } -- rust_tools.nvim + crates.nvim
lvim.builtin.cpp_programming = { active = false } -- clangd_extensions.nvim + make-tools.nvim
lvim.builtin.borderless_cmp = false
lvim.builtin.colored_args = false -- if true then sets up hlargs.nvim
lvim.builtin.bigfile.active = true
lvim.builtin.inlay_hints = { active = false } -- enable/disable inlay hints
lvim.builtin.mind = { active = false, root_path = "~/.mind" } -- enable/disable mind.nvim
lvim.builtin.chatgpt = { active = false }
lvim.builtin.typst = { active = true }

local user = os.getenv "USER"
if user and (user == "hgh" or user == "yh") then
  lvim.reload_config_on_save = true
  require("user.custom_user").config()
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
