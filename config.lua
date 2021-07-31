-- general
lvim.format_on_save = true
lvim.colorscheme = "darkplus"
-- lvim.lint_on_save = true
lvim.transparent_window = false
vim.opt.wrap = false


-- keymappings
lvim.leader = "space"

vim.cmd [[
  nnoremap <esc><esc> <cmd>nohlsearch<cr>
  nnoremap Y y$
  vnoremap p "_dP
]]

-- LSP
lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.override = {"java"}
-- require("user.json_schemas").setup()

-- Builtins
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
-- lvim.builtin.nvimtree.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 0

-- Whichkey
lvim.builtin.which_key.mappings.l.d = { "<cmd>TroubleToggle<cr>", "Diagnostics" }
lvim.builtin.which_key.mappings.l.R = { "<cmd>TroubleToggle lsp_references<cr>", "References" }
lvim.builtin.which_key.mappings.l.o = { "<cmd>SymbolsOutline<cr>", "Outline" }
lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<cr>", "Zen" }
lvim.builtin.which_key.mappings["r"] = {
  name = "Replace",
  r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
}
lvim.builtin.which_key.mappings.f = { "<cmd>lua require('lir.float').toggle()<cr>", "Files" }

-- Treesitter
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.playground.enable = true

lvim.plugins = {
  {"lunarvim/colorschemes"},
  {"editorconfig/editorconfig-vim"},
  {
    "babaybus/DoxygenToolkit.vim",
    event = "VimEnter",
    config = function ()
      require("user.doxygen").setup()
    end,
  },
}
