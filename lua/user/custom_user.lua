local M = {}

M.config = function()
  if vim.fn.has "nvim-0.9" == 1 then
    vim.opt.mousescroll = { "ver:1", "hor:6" }
    vim.o.mousefocus = true
    vim.o.mousemoveevent = true
    vim.o.splitkeep = "screen"
  end
  -- Your custom config
  local user = os.getenv "USER"
  lvim.builtin.chatgpt.active = true
  lvim.builtin.tmux_lualine = false
  if lvim.builtin.tmux_lualine then
    vim.opt.cmdheight = 1 -- WARN: =0 is broken on neovim head (https://github.com/neovim/neovim/issues/20281)
    vim.g.tpipeline_cursormoved = 1
  end
  lvim.use_icons = true
  lvim.builtin.dap.active = true
  vim.g.instant_username = user
  lvim.builtin.collaborative_editing.active = true
  lvim.builtin.global_statusline = true
  lvim.builtin.dressing.active = true
  lvim.builtin.fancy_wild_menu.active = true
  lvim.builtin.refactoring.active = true
  lvim.builtin.test_runner.runner = "neotest"
  lvim.format_on_save = {
    enabled = true,
    pattern = { "*.rs", "*.py" },
    timeout = 2000,
    filter = require("lvim.lsp.utils").format_filter,
  }
  lvim.builtin.smooth_scroll = "cinnamon"
  lvim.builtin.python_programming.active = true
  lvim.builtin.rust_programming.active = true
  lvim.builtin.cpp_programming.active = true
  lvim.builtin.borderless_cmp = true
  lvim.builtin.colored_args = true
  lvim.reload_config_on_save = false -- NOTE: i don't like this
  lvim.builtin.mind.active = false
  lvim.builtin.motion_provider = "flash"
  lvim.builtin.harpoon.active = true
  lvim.builtin.symbols_usage.active = true
  lvim.builtin.tag_provider = "outline"
  -- require("lvim.lsp.manager").setup("prosemd_lsp", {})
end

return M
