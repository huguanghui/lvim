local M = {}

M.config = function()
  -- Your custom config
  local user = os.getenv "USER"
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
  lvim.builtin.rust_programming = { active = true }
  lvim.builtin.borderless_cmp = true
  lvim.builtin.colored_args = true
end

return M
