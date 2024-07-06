local M = {}

local create_aucmd = vim.api.nvim_create_autocmd

M.config = function()
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
      require("user.theme").telescope_theme {}
      if lvim.builtin.dap.active then
        require("user.dev_icons").define_dap_signs()
      end
      if lvim.use_icons == false and lvim.builtin.custom_web_devicons then
        require("user.dev_icons").set_icon()
      end
    end,
  })
  vim.api.nvim_clear_autocmds { pattern = "lir", group = "_filetype_settings" }
  vim.api.nvim_clear_autocmds { pattern = "*", group = "_lvim_colorscheme" }
  vim.api.nvim_create_augroup("_lvim_user", {})
  -- Autocommands
  if lvim.builtin.nonumber_unfocus then
    create_aucmd("WinEnter", { group = "_lvim_user", pattern = "*", command = "set relativenumber number cursorline" })
    create_aucmd(
      "WinLeave",
      { group = "_lvim_user", pattern = "*", command = "set norelativenumber nonumber nocursorline" }
    )
  end

  if lvim.builtin.bigfile.active == false then
    vim.cmd [[
  " disable syntax highlighting in big files
  function! DisableSyntaxTreesitter()
      echo("Big file, disabling syntax, treesitter and folding")
      if exists(':TSBufDisable')
          exec 'TSBufDisable autotag'
          exec 'TSBufDisable highlight'
      endif

      set foldmethod=manual
      syntax clear
      syntax off
      filetype off
      set noundofile
      set noswapfile
      set noloadplugins
      set lazyredraw
  endfunction

  augroup BigFileDisable
      autocmd!
      autocmd BufReadPre,FileReadPre * if getfsize(expand("%")) > 1024 * 1024 | exec DisableSyntaxTreesitter() | endif
  augroup END
    ]]
  end

  create_aucmd("BufWritePre", {
    group = "_lvim_user",
    pattern = { "/tmp/*", "COMMIT_EDITMSG", "MERGE_MSG", "*.tmp", "*.bak" },
    callback = function()
      vim.opt_local.undofile = false
    end,
  })

  create_aucmd("TermOpen", {
    group = "_lvim_user",
    pattern = "term://*",
    command = "lua require('user.keybindings').set_terminal_keymaps()",
  })
  create_aucmd("FileType", {
    group = "_lvim_user",
    pattern = "toml",
    command = "lua require('cmp').setup.buffer { sources = { { name = 'crates' } } }",
  })

  local codelens_viewer = "lua require('user.codelens').show_line_sign()"
  local user = os.getenv "USER"
  if user and (user == "hgh" or user == "yh") then
    create_aucmd("CursorHold", {
      group = "_lvim_user",
      pattern = { "*.rs", "*.go", "*.ts", "*.tsx" },
      command = codelens_viewer,
    })
  end
end

M.make_run = function()
  create_aucmd("FileType", {
    group = "_lvim_user",
    pattern = { "c", "cpp" },
    callback = function()
      vim.keymap.set(
        "n",
        "<leader>m",
        "<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='make ;read',count=2,direction='float'})<CR>"
      )
      vim.keymap.set(
        "n",
        "<leader>r",
        "<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='make run;read',count=3,direction='float'})<CR>"
      )
    end,
  })
  create_aucmd("FileType", {
    group = "_lvim_user",
    pattern = "go",
    callback = function()
      vim.keymap.set(
        "n",
        "<leader>m",
        "<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='go build -v .;read',count=2,direction='float'})<CR>"
      )
      vim.keymap.set(
        "n",
        "<leader>r",
        "<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='go run .;read',count=3,direction='float'})<CR>"
      )
    end,
  })
  create_aucmd("FileType", {
    group = "_lvim_user",
    pattern = "python",
    callback = function()
      vim.keymap.set(
        "n",
        "<leader>r",
        "<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='python "
          .. vim.fn.expand "%"
          .. ";read',count=2,direction='float'})<CR>"
      )
      vim.keymap.set(
        "n",
        "<leader>m",
        "<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='echo \"compile :pepelaugh:\";read',count=2,direction='float'})<cr>"
      )
    end,
  })
  create_aucmd("FileType", {
    group = "_lvim_user",
    pattern = "rust",
    callback = function()
      vim.keymap.set(
        "n",
        "<leader>m",
        "<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='cargo build;read',count=2,direction='float'})<CR>"
      )
      vim.keymap.set("n", "<leader>r", "<cmd>lua require('rust-tools.runnables').runnables()<CR>")
    end,
  })
end

return M
