local M = {}

M.set_hop_keymaps = function()
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", opts)
  vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", opts)
  vim.api.nvim_set_keymap("n", "f", ":HopChar1LineAC<cr>", opts)
  vim.api.nvim_set_keymap("n", "F", ":HopChar1LineBC<cr>", opts)
end

local function set_bufferline_keymaps()
  lvim.keys.normal_mode["<S-x>"] = ":bdelete!<CR>"
  lvim.keys.normal_mode["<S-l>"] = "<Cmd>BufferLineCycleNext<CR>"
  lvim.keys.normal_mode["<S-h>"] = "<Cmd>BufferLineCyclePrev<CR>"
  lvim.keys.normal_mode["[b"] = "<Cmd>BufferLineMoveNext<CR>"
  lvim.keys.normal_mode["]b"] = "<Cmd>BufferLineMovePrev<CR>"
  lvim.builtin.which_key.mappings["c"] = { "<CMD>bdelete!<CR>", "Close Buffer" }
  lvim.builtin.which_key.mappings.b = {
    name = "Buffers",
    ["1"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "goto 1" },
    ["2"] = { "<Cmd>BufferLineGoToBuffer 2<CR>", "goto 2" },
    ["3"] = { "<Cmd>BufferLineGoToBuffer 3<CR>", "goto 3" },
    ["4"] = { "<Cmd>BufferLineGoToBuffer 4<CR>", "goto 4" },
    ["5"] = { "<Cmd>BufferLineGoToBuffer 5<CR>", "goto 5" },
    ["6"] = { "<Cmd>BufferLineGoToBuffer 6<CR>", "goto 6" },
    ["7"] = { "<Cmd>BufferLineGoToBuffer 7<CR>", "goto 7" },
    ["8"] = { "<Cmd>BufferLineGoToBuffer 8<CR>", "goto 8" },
    ["9"] = { "<Cmd>BufferLineGoToBuffer 9<CR>", "goto 9" },
    c = { "<Cmd>BufferLinePickClose<CR>", "delete buffer" },
    p = { "<Cmd>BufferLinePick<CR>", "pick buffer" },
    t = { "<Cmd>BufferLineGroupToggle docs<CR>", "toggle groups" },
    f = { "<cmd>Telescope buffers<cr>", "Find" },
    b = { "<cmd>b#<cr>", "Previous" },
  }
end

M.set_async_tasks_keymaps = function()
  local poor_mans_autocmds = require("user.autocommands").make_run()
  if lvim.builtin.async_tasks.active then
    lvim.builtin.which_key.mappings["m"] = {
      name = "Make",
      f = { "<cmd>AsyncTask file-build<cr>", "File" },
      p = { "<cmd>AsyncTask project-build<cr>", "Project" },
      t = { "<cmd>AsyncTask tmp-build<cr>", "Tmp" },
      e = { "<cmd>AsyncTaskEdit<cr>", "Edit" },
      l = { "<cmd>AsyncTaskList<cr>", "List" },
    }
    lvim.builtin.which_key.mappings["r"] = {
      name = "Run",
      f = { "<cmd>AsyncTask file-run<cr>", "File" },
      t = { "<cmd>AsyncTask tmp-run<cr>", "Tmp" },
      p = { "<cmd>AsyncTask project-run<cr>", "Project" },
    }
  else
    lvim.builtin.which_key.mappings["m"] = "Make"
    lvim.builtin.which_key.mappings["r"] = "Run"
    vim.tbl_deep_extend("force", lvim.autocommands.custom_groups, poor_mans_autocmds)
  end
end

M.config = function()
  -- Additional keybindings
  -- =========================================
  lvim.keys.normal_mode["<CR>"] = {
    "<cmd>lua require('user.neovim').maximize_current_split()<CR>",
    { noremap = true, silent = true, nowait = true },
  }
  lvim.keys.normal_mode["A-a"] = "<C-a>"
  lvim.keys.normal_mode["A-x"] = "<C-x>"
  -- lvim.keys.insert_mode["A-a"] = "<ESC>ggVG<CR>"
  lvim.keys.insert_mode["jk"] = "<ESC>:w<CR>"
  lvim.keys.insert_mode["<C-s>"] = "<cmd>lua vim.lsp.buf.signature_help()<cr>"
  lvim.keys.insert_mode["<C-l>"] = "<C-o>$<cmd>silent! LuaSnipUnlinkCurrent<CR>"
  lvim.keys.insert_mode["<C-j>"] = "<C-o>o<cmd>silent! LuaSnipUnlinkCurrent<CR>"
  lvim.keys.normal_mode["]d"] = "<cmd>lua vim.diagnostic.goto_next()<CR>"
  lvim.keys.normal_mode["[d"] = "<cmd>lua vim.diagnostic.goto_prev()<CR>"
  lvim.keys.normal_mode["<C-n>i"] = { "<C-i>", { noremap = true } }
  lvim.keys.normal_mode["<leader>lr"] = "<Cmd>lua require('renamer').rename()<CR>"
  if lvim.builtin.fancy_bufferline.active then
    set_bufferline_keymaps()
  else
    lvim.keys.normal_mode["<S-x>"] = ":BufferClose<CR>"
  end
  if lvim.builtin.sidebar.active then
    lvim.keys.normal_mode["E"] = ":SidebarNvimToggle<cr>"
  end
  lvim.keys.normal_mode["<esc><esc>"] = "<cmd>nohlsearch<cr>"
  lvim.keys.normal_mode["Y"] = "y$"
  lvim.keys.normal_mode["gv"] = "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>"
  lvim.keys.normal_mode["gA"] = "<cmd>lua vim.lsp.codelens.run()<cr>"
  lvim.keys.normal_mode["<C-]>"] = "<cmd>lua vim.lsp.buf.definition()<cr>"
  lvim.keys.visual_mode["p"] = [["_dP]]

  lvim.keys.term_mode["jj"] = "<C-\\><C-N>"
  lvim.keys.term_mode["jk"] = "<C-\\><C-N>"
  lvim.keys.term_mode["kj"] = "<C-\\><C-N>"
  -- Whichkey
  -- ==============================
  M.set_async_tasks_keymaps()
  if lvim.builtin.fancy_dashboard.active then
    lvim.builtin.which_key.mappings[";"] = { "<cmd>Alpha<CR>", "Dashboard" }
  end
  if lvim.builtin.cheat.active then
    lvim.builtin.which_key.mappings["?"] = { "<cmd>Cheat<CR>", "Cheat.sh" }
  end
  lvim.builtin.which_key.mappings["F"] = {
    name = "Find",
    b = { "<cmd>lua require('user.telescope').builtin()<cr>", "Builtin" },
    f = { "<cmd>lua require('user.telescope').curbuf()<cr>", "Current Buffer" },
    g = { "<cmd>lua require('user.telescope').git_files()<cr>", "Git Files" },
    i = { "<cmd>lua require('user.telescope').installed_plugins()<cr>", "Installed Plugins" },
    l = {
      "<cmd>lua require('telescope.builtin').resume()<cr>",
      "Last Search",
    },
    p = { "<cmd>lua require('user.telescope').project_search()<cr>", "Project" },
    s = { "<cmd>lua require('user.telescope').git_status()<cr>", "Git Status" },
    z = { "<cmd>lua require('user.telescope').search_only_certain_files()<cr>", "Certain Filetype" },
  }
  lvim.builtin.which_key.mappings["C"] = {
    "<cmd>lua require('telescope').extensions.command_palette.command_palette()<cr>",
    "Command Palette",
  }
  lvim.builtin.which_key.mappings["H"] = "Help"
  local ok, _ = pcall(require, "vim.diagnostic")
  if ok then
    lvim.builtin.which_key.mappings["l"]["j"] = {
      "<cmd>lua vim.diagnostic.goto_next({float = {border = 'rounded', focusable = false, source = 'always'}})<cr>",
      "Next Diagnostic",
    }
    lvim.builtin.which_key.mappings["l"]["k"] = {
      "<cmd>lua vim.diagnostic.goto_prev({float = {border = 'rounded', focusable = false, source = 'always'}})<cr>",
      "Prev Diagnostic",
    }
  end
  lvim.builtin.which_key.mappings["wl"] = { "<Plug>VimwikiToggleListItem<cr>", "Wiki Toggle" }
  if lvim.builtin.fancy_rename then
    lvim.builtin.which_key.mappings["l"]["r"] = { "<cmd>lua require('renamer').rename()<cr>", "Rename" }
    lvim.builtin.which_key.vmappings["l"] = {
      name = "+Lsp",
      r = { "<ESC><CMD>lua require('renamer').rename()<CR>", "Rename" },
    }
  end
  lvim.builtin.which_key.mappings["l"]["f"] = {
    "<cmd>lua vim.lsp.buf.formatting_seq_sync()<cr>",
    "Format",
  }
  lvim.builtin.which_key.mappings["lh"] = {
    "<cmd>hi LspReferenceRead cterm=bold ctermbg=red guibg=#24283b<cr><cmd>hi LspReferenceText cterm=bold ctermbg=red guibg=#24283b<cr><cmd>hi LspReferenceWrite cterm=bold ctermbg=red guibg=#24283b<cr>",
    "Clear HL",
  }
  lvim.builtin.which_key.mappings["n"] = {
    name = "Neogen",
    c = { "<cmd>lua require('neogen').generate({ type = 'class'})<CR>", "Class Documentation" },
    f = { "<cmd>lua require('neogen').generate({ type = 'func'})<CR>", "Function Documentation" },
    t = { "<cmd>lua require('neogen').generate({ type = 'type'}<CR>", "Type Documentation" },
    F = { "<cmd>lua require('neogen').generate({ type = 'file'}<CR>", "File Documentation" },
  }
  lvim.builtin.which_key.mappings["N"] = { "<cmd>Telescope file_create<CR>", "Create new file" }
  lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<cr>", "Symbol Outline" }
  lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
  lvim.builtin.which_key.mappings["R"] = {
    name = "Replace",
    f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Current Buffer" },
    p = { "<cmd>lua require('spectre').open()<cr>", "Project" },
    w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  }

  lvim.builtin.which_key.mappings["se"] = { "<cmd>lua require('user.telescope').file_browser()<cr>", "File Browser" }
  lvim.builtin.which_key.mappings["ss"] = { "<cmd>lua require('user.telescope').find_string()<cr>", "String" }
  lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnosticss" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    t = { "<cmd>TodoLocList <cr>", "Todo" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Diagnosticss" },
  }
end

return M
