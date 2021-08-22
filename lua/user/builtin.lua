local M = {}

M.config = function ()
  lvim.builtin.treesitter.ensure_installed = "maintained"
  lvim.builtin.treesitter.matchup.enable = true
  lvim.builtin.treesitter.ignore_install = { "haskell" }
  lvim.builtin.treesitter.context_commentstring.enable = true
  lvim.builtin.treesitter.indent = { enable = true, disable = { "yaml", "python" } } -- treesitter is buggy :(
  lvim.builtin.dashboard.active = true
  lvim.builtin.lualine.active = true
  lvim.builtin.project.active = true
  lvim.builtin.telescope.defaults.path_display = { shorten = 11 }
  lvim.builtin.terminal.active = true
  lvim.builtin.terminal.execs = {
    { "lazygit", "gg", "LazyGit" },
    { "python manage.py test;read", "jt", "Django tests" },
    { "python manage.py makemigrations;read", "jm", "Django makemigrations" },
    { "python manage.py migrate;read", "ji", "Django migrate" },
  }
  lvim.builtin.dashboard.custom_section["m"] = {
    description = { "  Marks              " },
    command = "Telescope marks",
  }
  lvim.builtin.compe.documentation.border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
  lvim.builtin.treesitter.incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-n>",
      node_incremental = "<C-n>",
      scope_incremental = "<C-s>",
      node_decremental = "<C-r>",
    },
  }
  lvim.builtin.treesitter.query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  }
  lvim.builtin.nvimtree.auto_open = 0
end

return M
