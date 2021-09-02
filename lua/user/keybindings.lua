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
  lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<cr>", "Symbol Outline" }
  lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    t = { "<cmd>TodoLocList <cr>", "Todo" },
    w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
  }
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
  -- lvim.builtin.which_key.mappings.f = { "<cmd>lua require('lir.float').toggle()<cr>", "Files" }
  lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
  lvim.builtin.which_key.mappings["se"] = { "<cmd>lua require('user.telescope').file_browser()<cr>", "File Browser" }
  lvim.builtin.which_key.mappings["ss"] = { "<cmd>lua require('user.telescope').find_string()<cr>", "String" }
  lvim.builtin.which_key.mappings["n"] = {
    name = "Neogen",
    c = { "<cmd>lua require('neogen').generate({ type = 'class'})<CR>", "Class Documentation" },
    f = { "<cmd>lua require('neogen').generate({ type = 'func'})<CR>", "Function Documentation" },
  }
  lvim.builtin.which_key.mappings["H"] = "Help"
  lvim.builtin.which_key.mappings["lf"] = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" }
  lvim.builtin.which_key.mappings["lh"] = {
    "<cmd>hi LspReferenceRead cterm=bold ctermbg=red guibg=#24283b<cr><cmd>hi LspReferenceText cterm=bold ctermbg=red guibg=#24283b<cr><cmd>hi LspReferenceWrite cterm=bold ctermbg=red guibg=#24283b<cr>",
    "Clear HL",
  }
end

return M
