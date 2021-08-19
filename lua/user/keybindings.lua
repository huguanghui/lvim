local M = {}

M.config = function ()
  lvim.keys.normal_mode["<S-x>"] = ":BufferClose<CR>"
  lvim.keys.normal_mode["<esc><esc>"] = "<cmd>nohlsearch<cr>"
  lvim.keys.normal_mode["Y"] = "y$"
  lvim.keys.normal_mode["gv"] = "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>"
  lvim.keys.normal_mode["<C-]>"] = "<cmd>lua vim.lsp.buf.definition()<cr>"
  lvim.keys.visual_mode["p"] = [["_dP]]
  -- lvim.keys.insert_mode["jk"] = "<ESC>:w<CR>"
  lvim.keys.term_mode["jj"] = "<C-\\><C-N>"
  lvim.keys.term_mode["jk"] = "<C-\\><C-N>"
  lvim.keys.term_mode["kj"] = "<C-\\><C-N>"
  -- Whichkey
  lvim.builtin.which_key.mappings.l.d = { "<cmd>TroubleToggle<cr>", "Diagnostics" }
  lvim.builtin.which_key.mappings.l.R = { "<cmd>TroubleToggle lsp_references<cr>", "References" }
  lvim.builtin.which_key.mappings.l.o = { "<cmd>SymbolsOutline<cr>", "Outline" }
  -- lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<cr>", "Zen" }
  lvim.builtin.which_key.mappings["r"] = {
  name = "Replace",
  r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
}
  lvim.builtin.which_key.mappings.G = {"<cmd>Dox<cr>", "Doxygen"}
  -- lvim.builtin.which_key.mappings.f = { "<cmd>lua require('lir.float').toggle()<cr>", "Files" }
  lvim.keys.normal_mode["gv"] = "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>"
end

return M