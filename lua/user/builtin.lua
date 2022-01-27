local M = {}
M.config = function()
  local kind = require "user.lsp_kind"
  -- Snippets
  -- =========================================
  require("luasnip/loaders/from_vscode").load { paths = { "~/.config/lvim/snippets" } }

  -- Command Palette
  -- =========================================
  lvim.builtin.cpmenu = M.cpmenu()

  -- Barbar
  -- =========================================
  if lvim.builtin.fancy_bufferline.active then
    lvim.builtin.bufferline.active = false
  end

  -- CMP
  -- =========================================
  lvim.builtin.cmp.sources = {
    { name = "nvim_lsp" },
    { name = "cmp_tabnine", max_item_count = 3 },
    { name = "buffer", max_item_count = 5, keyword_length = 5 },
    { name = "path", max_item_count = 5 },
    { name = "luasnip", max_item_count = 3 },
    { name = "nvim_lua" },
    { name = "calc" },
    { name = "emoji" },
    { name = "treesitter" },
    { name = "crates" },
  }
  lvim.builtin.cmp.documentation.border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
  lvim.builtin.cmp.experimental = {
    ghost_text = false,
    native_menu = false,
    custom_menu = true,
  }
  lvim.builtin.cmp.formatting.kind_icons = kind.cmp_kind
  lvim.builtin.cmp.formatting.source_names = {
    buffer = "(Buffer)",
    nvim_lsp = "(LSP)",
    luasnip = "(Snip)",
    treesitter = "",
    nvim_lua = "(NvLua)",
    spell = "暈",
    emoji = "",
    path = "",
    calc = "",
    cmp_tabnine = "ﮧ",
  }

  if lvim.builtin.sell_your_soul_to_devil then
    lvim.keys.insert_mode["<c-h>"] = { [[copilot#Accept("\<CR>")]], { expr = true, script = true } }
    local cmp = require "cmp"
    lvim.builtin.cmp.mapping["<Tab>"] = cmp.mapping(M.tab, { "i", "c" })
    lvim.builtin.cmp.mapping["<S-Tab>"] = cmp.mapping(M.shift_tab, { "i", "c" })
  end

  -- Dashboard
  -- =========================================
  lvim.builtin.dashboard.active = not lvim.builtin.fancy_dashboard.active
  if not lvim.builtin.fancy_dashboard.active then
    lvim.builtin.dashboard.custom_section["m"] = {
      description = { "  Marks              " },
      command = "Telescope marks",
    }
  end

  -- LSP
  -- =========================================
  lvim.lsp.diagnostics.float.border = "rounded"
  lvim.lsp.diagnostics.float.focusable = false
  lvim.lsp.diagnostics.signs.values = {
    { name = "DiagnosticSignError", text = kind.icons.error },
    { name = "DiagnosticSignWarn", text = kind.icons.warn },
    { name = "DiagnosticSignInfo", text = kind.icons.info },
    { name = "DiagnosticSignHint", text = kind.icons.hint },
  }
  local ok, _ = pcall(require, "vim.diagnostic")
  if ok then
    vim.diagnostic.config { virtual_text = false }
  end

  -- Lualine
  -- =========================================
  lvim.builtin.lualine.active = true
  lvim.builtin.lualine.sections.lualine_b = { "branch" }

  -- NvimTree
  -- =========================================
  lvim.builtin.nvimtree.setup.diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  }
  -- lvim.builtin.nvimtree.hide_dotfiles = 0

  -- Project
  -- =========================================
  lvim.builtin.project.active = true

  -- Treesitter
  -- =========================================
  lvim.builtin.treesitter.context_commentstring.enable = true
  lvim.builtin.treesitter.ensure_installed = "maintained"
  lvim.builtin.treesitter.highlight.disable = { "org" }
  lvim.builtin.treesitter.ignore_install = { "haskell", "tlaplus", "php", "org" }
  lvim.builtin.treesitter.incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-n>",
      node_incremental = "<C-n>",
      scope_incremental = "<C-s>",
      node_decremental = "<C-r>",
    },
  }
  lvim.builtin.treesitter.indent = { enable = true, disable = { "yaml", "python" } } -- treesitter is buggy :(
  lvim.builtin.treesitter.matchup.enable = true
  lvim.builtin.treesitter.query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  }
  lvim.builtin.treesitter.on_config_done = function()
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.solidity = {
      install_info = {
        url = "https://github.com/JoranHonig/tree-sitter-solidity",
        files = { "src/parser.c" },
        requires_generate_from_grammar = true,
      },
      filetype = "solidity",
    }
    parser_config.jsonc.used_by = "json"
    parser_config.markdown = {
      install_info = {
        url = "https://github.com/ikatyang/tree-sitter-markdown",
        files = { "src/parser.c", "src/scanner.cc" },
      },
    }
  end

  -- Telescope
  -- =========================================
  lvim.builtin.telescope.defaults.path_display = { shorten = 10 }
  lvim.builtin.telescope.defaults.winblend = 6
  lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
  lvim.builtin.telescope.defaults.file_ignore_patterns = {
    "vendor/*",
    "%.lock",
    "__pycache__/*",
    "%.sqlite3",
    "%.ipynb",
    "node_modules/*",
    "%.jpg",
    "%.jpeg",
    "%.png",
    "%.svg",
    "%.otf",
    "%.ttf",
    ".git/",
    "%.webp",
    ".dart_tool/",
    ".github/",
    ".gradle/",
    ".idea/",
    ".settings/",
    ".vscode/",
    "__pycache__/",
    "build/",
    "env/",
    "gradle/",
    "node_modules/",
    "target/",
    "%.pdb",
    "%.dll",
    "%.class",
    "%.exe",
    "%.cache",
    "%.ico",
    "%.pdf",
    "%.dylib",
    "%.jar",
    "%.docx",
    "%.met",
    "smalljre_*/*",
    ".vale/",
  }
  lvim.builtin.telescope.defaults.layout_config = require("user.telescope").layout_config()
  local actions = require "telescope.actions"
  local custom_actions = require "user.telescope"
  lvim.builtin.telescope.defaults.mappings = {
    i = {
      ["<c-j>"] = actions.move_selection_next,
      ["<c-k>"] = actions.move_selection_previous,
      ["<c-n>"] = actions.cycle_history_next,
      ["<c-p>"] = actions.cycle_history_prev,
      ["<c-c>"] = actions.close,
      ["<c-y>"] = actions.which_key,
      ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
      ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
      ["<cr>"] = custom_actions.multi_selection_open,
      ["<c-v>"] = custom_actions.multi_selection_open_vsplit,
      ["<c-s>"] = custom_actions.multi_selection_open_split,
      ["<c-t>"] = custom_actions.multi_selection_open_tab,
    },
    n = {
      ["<esc>"] = actions.close,
      ["<c-c>"] = actions.close,
      ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
      ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
      ["<cr>"] = custom_actions.multi_selection_open,
      ["<c-v>"] = custom_actions.multi_selection_open_vsplit,
      ["<c-s>"] = custom_actions.multi_selection_open_split,
      ["<c-t>"] = custom_actions.multi_selection_open_tab,
      ["<c-j>"] = actions.move_selection_next,
      ["<c-k>"] = actions.move_selection_previous,
      ["<c-n>"] = actions.cycle_history_next,
      ["<c-p>"] = actions.cycle_history_prev,
      ["<c-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
    },
  }
  local telescope_actions = require "telescope.actions.set"
  lvim.builtin.telescope.defaults.pickers.find_files = {
    attach_mappings = function(_)
      telescope_actions.select:enhance {
        post = function()
          vim.cmd ":normal! zx"
        end,
      }
      return true
    end,
    find_command = { "fd", "--type=file", "--hidden", "--smart-case" },
  }
  lvim.builtin.telescope.on_config_done = function(telescope)
    telescope.load_extension "file_create"
    telescope.load_extension "command_palette"
  end

  -- Terminal
  -- =========================================
  lvim.builtin.terminal.active = true

  -- WhichKey
  -- =========================================
  lvim.builtin.which_key.setup.window.winblend = 10
  lvim.builtin.which_key.setup.window.border = "none"
  lvim.builtin.which_key.setup.ignore_missing = true
  lvim.builtin.which_key.on_config_done = function(wk)
    local keys = {
      ["ga"] = { "<cmd>lua require('user.telescope').code_actions()<CR>", "Code Action" },
      ["gR"] = { "<cmd>lua require('user.telescope').lsp_references()<CR>", "Goto references" },
      ["gI"] = { "<cmd>lua require('user.telescope').lsp_implementations()<CR>", "Goto Implementation" },
      ["gA"] = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
    }

    -- better keybindings for ts and tsx files
    local langs = { "typescript", "typescriptreact" }
    local ftype = vim.bo.filetype
    if vim.tbl_contains(langs, ftype) then
      local ts_keys = {
        ["gA"] = { "<cmd>TSLspImportAll<CR>", "Import All" },
        ["gr"] = { "<cmd>TSLspRenameFile<CR>", "Rename File" },
        ["gS"] = { "<cmd>TSLspOrganize<CR>", "Organize Imports" },
      }
      wk.register(ts_keys, { mode = "n" })
    end
    wk.register(keys, { mode = "n" })
  end

  -- ETC
  -- =========================================
  local _time = os.date "*t"
  if _time.hour >= 21 and _time.hour <= 24 then
    lvim.colorscheme = "onedarker"
  end

  -- override lsp rename handler
  if lvim.builtin.fancy_rename then
    vim.lsp.handlers["textDocument/rename"] = function(err, result)
      if err then
        vim.notify(("Error running lsp query 'rename': " .. err), vim.log.levels.ERROR)
      end
      if result and result.changes then
        local msg = ""
        for f, c in pairs(result.changes) do
          local new = c[1].newText
          msg = msg .. string.format("%d changes -> %s", #c, f:gsub("file://", ""):gsub(vim.fn.getcwd(), ".")) .. "\n"
          msg = msg:sub(1, #msg - 1)
          vim.notify(
            msg,
            vim.log.levels.INFO,
            { title = string.format("Rename: %s -> %s", vim.fn.expand "<cword>", new) }
          )
        end
      end
      vim.lsp.util.apply_workspace_edit(result)
    end
  end
  --   if lvim.builtin.lastplace.active == false then
  --     -- go to last loc when opening a buffer
  --     vim.cmd [[
  --   autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
  -- ]]
  --   end
end

function M.rename(curr, win)
  local name = vim.trim(vim.fn.getline ".")
  vim.api.nvim_win_close(win, true)
  if #name > 0 and name ~= curr then
    local params = vim.lsp.util.make_position_params()
    params.newName = name
    vim.lsp.buf_request(0, "textDocument/rename", params)
  end
end

function M.lsp_rename()
  local name = vim.fn.expand "<cword>"
  local ok, ts = pcall(require, "nvim-treesitter-playground.hl-info")
  local tshl = ""
  if ok and ts then
    if #ts <= 0 then
      return
    end
    tshl = ts.get_treesitter_hl()
    local ind = tshl[#tshl]:match "^.*()%*%*.*%*%*"
    tshl = tshl[#tshl]:sub(ind + 2, -3)
  end

  local win = require("plenary.popup").create(name, {
    title = "New Name",
    style = "minimal",
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    relative = "cursor",
    borderhighlight = "FloatBorder",
    titlehighlight = "Title",
    highlight = tshl,
    focusable = true,
    width = 25,
    height = 1,
    line = "cursor+2",
    col = "cursor-1",
  })
  -- Move cursor to the end of the prefix
  vim.cmd "stopinsert"
  vim.cmd "startinsert!"
  vim.cmd [[lua require('cmp').setup.buffer { enabled = false }]]

  local opts = { noremap = false, silent = true }
  vim.api.nvim_buf_set_keymap(0, "i", "<Esc>", "<cmd>stopinsert | q!<CR>", opts)
  vim.api.nvim_buf_set_keymap(0, "n", "<Esc>", "<cmd>stopinsert | q!<CR>", opts)
  vim.api.nvim_buf_set_keymap(
    0,
    "i",
    "<CR>",
    "<cmd>stopinsert | lua require('user.builtin').rename(" .. name .. "," .. win .. ")<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    0,
    "n",
    "<CR>",
    "<cmd>stopinsert | lua require('user.builtin').rename(" .. name .. "," .. win .. ")<CR>",
    opts
  )
end

function M.tab(fallback)
  local methods = require("lvim.core.cmp").methods
  local cmp = require "cmp"
  local luasnip = require "luasnip"
  local copilot_keys = vim.fn["copilot#Accept"]()
  if cmp.visible() then
    cmp.select_next_item()
  elseif vim.api.nvim_get_mode().mode == "c" then
    fallback()
  elseif copilot_keys ~= "" then -- prioritise copilot over snippets
    -- Copilot keys do not need to be wrapped in termcodes
    vim.api.nvim_feedkeys(copilot_keys, "i", true)
  elseif luasnip.expandable() then
    luasnip.expand()
  elseif methods.jumpable() then
    luasnip.jump(1)
  elseif methods.check_backspace() then
    fallback()
  else
    methods.feedkeys("<Plug>(Tabout)", "")
  end
end

function M.shift_tab(fallback)
  local methods = require("lvim.core.cmp").methods
  local luasnip = require "luasnip"
  local cmp = require "cmp"
  if cmp.visible() then
    cmp.select_prev_item()
  elseif vim.api.nvim_get_mode().mode == "c" then
    fallback()
  elseif methods.jumpable(-1) then
    luasnip.jump(-1)
  else
    local copilot_keys = vim.fn["copilot#Accept"]()
    if copilot_keys ~= "" then
      methods.feedkeys(copilot_keys, "i")
    else
      methods.feedkeys("<Plug>(Tabout)", "")
    end
  end
end

function M.cpmenu()
  return {
    {
      "File",
      { "entire selection", ':call feedkeys("GVgg")' },
      { "file browser", ":lua require('user.telescope').file_browser()", 1 },
      { "files", ":lua require('telescope.builtin').find_files()", 1 },
      { "git files", ":lua require('user.telescope').git_files()", 1 },
      { "last search", ":lua require('user.telescope').grep_last_search()", 1 },
      { "quit", ":qa" },
      { "save all files", ":wa" },
      { "save current file", ":w" },
      { "search word", ":lua require('user.telescope').find_string()", 1 },
    },
    {
      "Lsp",
      { "formatting", ":lua vim.lsp.buf.formatting_seq_sync()" },
      { "workspace diagnostics", ":Telescope diagnostics" },
      { "workspace symbols", ":Telescope lsp_workspace_symbols" },
    },
    {
      "Project",
      { "list", ":Telescope projects" },
      { "build", ":AsyncTask project-build" },
      { "run", ":AsyncTask project-run" },
    },
    {
      "Vim",
      { "buffers", ":Telescope buffers" },
      { "check health", ":checkhealth" },
      { "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
      { "command history", ":lua require('telescope.builtin').command_history()" },
      { "commands", ":lua require('telescope.builtin').commands()" },
      { "cursor column", ":set cursorcolumn!" },
      { "cursor line", ":set cursorline!" },
      { "jumps", ":lua require('telescope.builtin').jumplist()" },
      { "keymaps", ":lua require('telescope.builtin').keymaps()" },
      { "paste mode", ":set paste!" },
      { "registers (A-e)", ":lua require('telescope.builtin').registers()" },
      { "relative number", ":set relativenumber!" },
      { "reload vimrc", ":source $MYVIMRC" },
      { "search highlighting", ":set hlsearch!" },
      { "search history", ":lua require('telescope.builtin').search_history()" },
      { "spell checker", ":set spell!" },
      { "vim options", ":lua require('telescope.builtin').vim_options()" },
    },
    {
      "Help",
      { "cheatsheet", ":help index" },
      { "quick reference", ":help quickref" },
      { "search help", ":lua require('telescope.builtin').help_tags()", 1 },
      { "summary", ":help summary" },
      { "tips", ":help tips" },
      { "tutorial", ":help tutor" },
    },
    {
      "Dap",
      { "brakpoints", ":lua require'telescope'.extensions.dap.list_breakpoints{}" },
      { "clear breakpoints", ":lua require('dap.breakpoints').clear()" },
      { "close", ":lua require'dap'.close(); require'dap'.repl.close()" },
      { "commands", ":lua require'telescope'.extensions.dap.commands{}" },
      { "configurations", ":lua require'telescope'.extensions.dap.configurations{}" },
      { "continue", ":lua require'dap'.continue()" },
      { "current scopes floating window", ":lua ViewCurrentScopesFloatingWindow()" },
      { "current scopes", ':lua ViewCurrentScopes(); vim.cmd("wincmd w|vertical resize 40")' },
      { "current value floating window", ":lua ViewCurrentValueFloatingWindow()" },
      { "frames", ":lua require'telescope'.extensions.dap.frames{}" },
      { "pause", ":lua require'dap'.pause()" },
      { "repl", ":lua require'dap'.repl.open(); vim.cmd(\"wincmd w|resize 12\")" },
      { "run to cursor", ":lua require'dap'.run_to_cursor()" },
      { "step back", ":lua require'dap'.step_back()" },
      { "step into", ":lua require'dap'.step_into()" },
      { "step out", ":lua require'dap'.step_out()" },
      { "step over", ":lua require'dap'.step_over()" },
      { "toggle breakpoint", ":lua require'dap'.toggle_breakpoint()" },
    },
  }
end

return M
