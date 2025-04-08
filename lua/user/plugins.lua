local M = {}

M.config = function()
  local neoclip_req = { "kkharji/sqlite.lua" }
  if lvim.builtin.neoclip.enable_persistent_history == false then
    neoclip_req = {}
  end
  lvim.plugins = {
    {
      "folke/tokyonight.nvim",
      config = function()
        require("user.theme").tokyonight()
        local _time = os.date "*t"
        if (_time.hour >= 9 and _time.hour < 17) and lvim.builtin.time_based_themes then
          lvim.colorscheme = "tokyonight-moon"
        end
      end,
    },
    {
      "rose-pine/neovim",
      name = "rose-pine",
      config = function()
        require("user.theme").rose_pine()
        lvim.colorscheme = "rose-pine"
      end,
      cond = function()
        local _time = os.date "*t"
        return (_time.hour >= 1 and _time.hour < 9) and lvim.builtin.time_based_themes
      end,
    },
    {
      "catppuccin/nvim",
      name = "catppuccin",
      config = function()
        require("user.theme").catppuccin()
        local _time = os.date "*t"
        if (_time.hour >= 17 and _time.hour < 21) and lvim.builtin.time_based_themes then
          lvim.colorscheme = "catppuccin-mocha"
        end
      end,
    },
    {
      "rebelot/kanagawa.nvim",
      config = function()
        require("user.theme").kanagawa()
        lvim.colorscheme = "kanagawa"
      end,
      cond = function()
        local _time = os.date "*t"
        return ((_time.hour >= 21 and _time.hour < 24) or (_time.hour >= 0 and _time.hour < 1))
          and lvim.builtin.time_based_themes
      end,
    },
    {
      "ray-x/lsp_signature.nvim",
      config = function()
        require("user/lsp_signature").config()
      end,
      event = { "BufRead", "BufNew" },
    },
    {
      "ethanholz/nvim-lastplace",
      config = function()
        require("nvim-lastplace").setup {
          lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
          lastplace_ignore_filetype = {
            "gitcommit",
            "gitrebase",
            "svn",
            "hgcommit",
          },
          lastplace_open_folds = true,
        }
      end,
      enabled = lvim.builtin.lastplace.active,
    },
    {
      "folke/todo-comments.nvim",
      dependencies = "nvim-lua/plenary.nvim",
      config = function()
        require("user.todo_comments").config()
      end,
      event = "BufRead",
    },
    {
      "folke/trouble.nvim",
      config = function()
        require("user.troubl").config()
      end,
      event = "VeryLazy",
      cmd = "Trouble",
      enabled = lvim.builtin.trouble.active,
    },
    {
      "phaazon/hop.nvim",
      event = "VeryLazy",
      cmd = { "HopChar1CurrentLineAC", "HopChar1CurrentLineBC", "HopChar2MW", "HopWordMW" },
      config = function()
        require("user.hop").config()
      end,
      enabled = lvim.builtin.motion_provider == "hop",
    },
    {
      "simrat39/symbols-outline.nvim",
      config = function()
        require("user.symbols_outline").config()
      end,
      event = "BufReadPost",
      enabled = lvim.builtin.tag_provider == "symbols-outline",
    },
    {
      "tzachar/cmp-tabnine",
      build = "./install.sh",
      dependencies = "hrsh7th/nvim-cmp",
      config = function()
        local tabnine = require "cmp_tabnine.config"
        tabnine:setup {
          max_lines = 1000,
          max_num_results = 10,
          sort = true,
        }
      end,
      lazy = true,
      event = "InsertEnter",
      enabled = lvim.builtin.tabnine.active,
    },
    {
      "kevinhwang91/nvim-bqf",
      event = "WinEnter",
      config = function()
        require("user.bqf").config()
      end,
    },
    {
      "simrat39/rust-tools.nvim",
      lazy = true,
      config = function()
        require("user.rust_tools").config()
      end,
      ft = { "rust", "rs" },
      enabled = lvim.builtin.rust_programming.active,
    },
    {
      url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      lazy = true,
      config = function()
        require("lsp_lines").setup()
      end,
      enabled = lvim.builtin.lsp_lines,
    },
    {
      -- 搜索替换
      "nvim-pack/nvim-spectre",
      lazy = true,
      config = function()
        require("user.spectre").config()
      end,
    },
    {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("user.colorizer").config()
      end,
      event = "BufReadPre",
    },
    {
      "folke/persistence.nvim",
      event = "BufReadPre",
      lazy = true,
      config = function()
        require("persistence").setup {
          dir = vim.fn.expand(get_cache_dir() .. "/sessions/"), -- directory where session files are saved
          options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
        }
      end,
      enabled = lvim.builtin.persistence.active,
    },
    {
      "kristijanhusak/orgmode.nvim",
      keys = { "go", "gC" },
      ft = { "org" },
      config = function()
        require("user.orgmode").setup()
      end,
      enabled = lvim.builtin.orgmode.active,
    },
    {
      "danymat/neogen",
      lazy = true,
      config = function()
        require("neogen").setup {
          enabled = true,
        }
      end,
      dependencies = "nvim-treesitter/nvim-treesitter",
    },
    { "psliwka/vim-smoothie" },
    -- {
    --   "vimwiki/vimwiki",
    -- },
    {
      "RishabhRD/nvim-cheat.sh",
      dependencies = "RishabhRD/popfix",
      config = function()
        vim.g.cheat_default_window_layout = "vertical_split"
      end,
      lazy = true,
      cmd = { "Cheat", "CheatWithoutComments", "CheatList", "CheatListWithoutComments" },
      keys = "<leader>?",
      enabled = lvim.builtin.cheat.active,
    },
    {
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("user.neoclip").config()
      end,
      lazy = true,
      keys = "<leader>y",
      dependencies = neoclip_req,
      enabled = lvim.builtin.neoclip.active,
    },
    {
      "karb94/neoscroll.nvim",
      config = function()
        require("neoscroll").setup {
          easing_function = "quadratic",
          hide_cursor = true,
        }
      end,
      event = "BufRead",
      enabled = lvim.builtin.smooth_scroll == "neoscroll",
    },
    {
      "declancm/cinnamon.nvim",
      config = function()
        require("cinnamon").setup {
          keymaps = { basic = true, extra = false },
          options = { mode = "window" },
        }
      end,
      event = "BufRead",
      enabled = lvim.builtin.smooth_scroll == "cinnamon",
    },
    {
      "github/copilot.vim",
      config = function()
        require("user.copilot").config()
      end,
      enabled = lvim.builtin.sell_your_soul_to_devil,
    },
    {
      "ThePrimeagen/harpoon",
      dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-lua/popup.nvim" },
      },
      enabled = lvim.builtin.harpoon.active,
    },
    { "mtdl9/vim-log-highlighting", ft = { "text", "log" } },
    {
      "yamatsum/nvim-cursorline",
      lazy = true,
      event = "BufWinEnter",
      enabled = lvim.builtin.cursorline.active,
    },
    {
      "abecodes/tabout.nvim",
      config = function()
        require("user.tabout").config()
      end,
      enabled = lvim.builtin.sell_your_soul_to_devil,
    },
    {
      "chrisbra/csv.vim",
      -- ft = { "csv" },
      enabled = lvim.builtin.csv_support,
    },
    {
      "sidebar-nvim/sidebar.nvim",
      config = function()
        require("user.sidebar").config()
      end,
      -- event = "BufRead",
      enabled = lvim.builtin.sidebar.active,
    },
    {
      "skywind3000/asynctasks.vim",
      dependencies = {
        { "skywind3000/asyncrun.vim" },
      },
      init = function()
        vim.cmd [[
          let g:asyncrun_open = 8
          let g:asynctask_template = '~/.config/lvim/task_template.ini'
          let g:asynctasks_extra_config = ['~/.config/lvim/tasks.ini']
        ]]
      end,
      event = "BufRead",
      enabled = lvim.builtin.task_runner == "async_tasks",
    },
    {
      "jbyuki/instant.nvim",
      event = "BufRead",
      enabled = lvim.builtin.collaborative_editing.active,
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      enabled = lvim.builtin.file_browser.active,
    },
    {
      "j-hui/fidget.nvim",
      config = function()
        require("user.fidget_spinner").config()
      end,
    },
    {
      "liuchengxu/vista.vim",
      init = function()
        require("user.vista").config()
      end,
      event = "BufReadPost",
      enabled = lvim.builtin.tag_provider == "vista",
    },
    {
      "p00f/clangd_extensions.nvim",
      ft = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
      enabled = lvim.builtin.cpp_programming.active,
    },
    {
      "saecki/crates.nvim",
      event = { "BufRead Cargo.toml" },
      dependencies = { { "nvim-lua/plenary.nvim" } },
      config = function()
        require("user.crates").config()
      end,
      enabled = lvim.builtin.rust_programming.active,
    },
    {
      "hrsh7th/cmp-cmdline",
      enabled = lvim.builtin.fancy_wild_menu.active,
    },
    {
      "gfeiyou/command-center.nvim",
      config = function()
        require("user.cc").config()
      end,
      dependencies = "nvim-telescope/telescope.nvim",
    },
    {
      "stevearc/dressing.nvim",
      lazy = true,
      config = function()
        require("user.dress").config()
      end,
      enabled = lvim.builtin.dressing.active,
      event = "BufWinEnter",
    },
    {
      "ThePrimeagen/refactoring.nvim",
      lazy = true,
      ft = { "typescript", "javascript", "lua", "c", "cpp", "go", "python", "java", "php" },
      event = "BufReadPost",
      config = function()
        require("refactoring").setup {}
      end,
      enabled = lvim.builtin.refactoring.active,
    },
    {
      "b0o/incline.nvim",
      config = function()
        require("user.incline").config()
      end,
      enabled = lvim.builtin.global_statusline,
    },
    {
      "vimpostor/vim-tpipeline",
      enabled = lvim.builtin.tmux_lualine,
    },
    {
      "vim-test/vim-test",
      cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
      config = function()
        require("user.vim_test").config()
      end,
      enabled = lvim.builtin.test_runner.active and lvim.builtin.test_runner.runner == "ultest",
    },
    {
      "nvim-neotest/neotest",
      config = function()
        require("user.ntest").config()
      end,
      dependencies = {
        { "nvim-neotest/neotest-plenary" },
      },
      event = { "BufReadPost", "BufNew" },
      enabled = lvim.builtin.test_runner.active and lvim.builtin.test_runner.runner == "neotest",
    },
    {
      -- NOTE: This plugin is not maintained anymore, you might wanna use https://github.com/pmizio/typescript-tools.nvim
      "jose-elias-alvarez/typescript.nvim",
      ft = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      lazy = true,
      config = function()
        require("user.tss").config()
      end,
      enabled = (lvim.builtin.web_programming.active and lvim.builtin.web_programming.extra == "typescript.nvim"),
    },
    { "nvim-neotest/neotest-go", event = { "BufEnter *.go" } },
    { "nvim-neotest/neotest-python", event = { "BufEnter *.py" } },
    { "rouge8/neotest-rust", event = { "BufEnter *.rs" } },
    {
      "rcarriga/vim-ultest",
      cmd = { "Ultest", "UltestSummary", "UltestNearest" },
      dependencies = { "vim-test/vim-test" },
      build = ":UpdateRemotePlugins",
      lazy = true,
      event = { "BufEnter *_test.*,*_spec.*,*est_*.*" },
      enabled = lvim.builtin.test_runner.active and lvim.builtin.test_runner.runner == "ultest",
    },
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      config = function()
        require("user.noice").config()
      end,
      dependencies = {
        "rcarriga/nvim-notify",
      },
      enabled = lvim.builtin.noice.active,
    },
    {
      "m-demare/hlargs.nvim",
      lazy = true,
      event = "VeryLazy",
      config = function()
        require("hlargs").setup {
          excluded_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
        }
      end,
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      enabled = lvim.builtin.colored_args,
    },
    {
      "AckslD/swenv.nvim",
      enabled = lvim.builtin.python_programming.active,
      ft = "python",
      event = { "BufRead", "BufNew" },
    },
    {
      "mfussenegger/nvim-dap-python",
      config = function()
        local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
        require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
        require("dap-python").test_runner = "pytest"
      end,
      ft = "python",
      event = { "BufRead", "BufNew" },
      enabled = lvim.builtin.python_programming.active,
    },
    {
      "Civitasv/cmake-tools.nvim",
      config = function()
        require("user.cle").cmake_config()
      end,
      ft = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
      enabled = lvim.builtin.cpp_programming.active,
    },
    {
      "raimon49/requirements.txt.vim",
      event = "VeryLazy",
      enabled = lvim.builtin.python_programming.active,
    },
    {
      "phaazon/mind.nvim",
      branch = "v2.2",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("user.mind").config()
      end,
      event = "VeryLazy",
      enabled = lvim.builtin.mind.active,
    },
    {
      "jackMort/ChatGPT.nvim",
      event = "VeryLazy",
      config = function()
        require("user.chatgpt").config()
      end,
      dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
      },
      enabled = lvim.builtin.chatgpt.active,
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      event = "VeryLazy",
      config = function()
        require("user.dap_virtual_text").config()
      end,
      enabled = lvim.builtin.dap.active,
    },
    {
      "SeniorMars/typst.nvim",
      config = function()
        require("user.typst").config()
      end,
      event = "VeryLazy",
      enabled = lvim.builtin.typst.active,
    },
    {
      "ibhagwan/fzf-lua",
      config = function()
        -- calling `setup` is optional for customization
        local ff = require "user.fzf"
        require("fzf-lua").setup(vim.tbl_deep_extend("keep", vim.deepcopy(ff.active_profile), ff.default_opts))
      end,
      enabled = not lvim.builtin.telescope.active,
    },
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      keys = require("user.flash").keys,
      enabled = lvim.builtin.motion_provider == "flash",
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      name = "new-indent",
      main = "ibl",
      config = function()
        require("user.indent_blankline").setup()
      end,
      enabled = lvim.builtin.indentlines.mine,
    },
    {
      "huguanghui/symbol-usage.nvim",
      event = "LspAttach",
      enabled = lvim.builtin.symbols_usage.active,
      config = function()
        require("user.symbol_use").config()
      end,
    },
    {
      "hedyhli/outline.nvim",
      config = function()
        require("user.outline").config()
      end,
      event = "BufReadPost",
      enabled = lvim.builtin.tag_provider == "outline",
    },
    {
      "pmizio/typescript-tools.nvim",
      ft = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      lazy = true,
      config = function()
        require("user.typtools").config()
      end,
      enabled = (lvim.builtin.web_programming.active and lvim.builtin.web_programming.extra == "typescript-tools.nvim"),
    },
    {
      "nvim-neotest/nvim-nio",
      enabled = lvim.builtin.dap.active,
    },
    {
      "abzcoding/markdown.nvim",
      branch = "feature/fancy",
      name = "render-markdown",
      config = function()
        require("user.markd").config()
      end,
      enabled = lvim.builtin.markdown.active,
    },
    {
      "Kurama622/llm.nvim",
      event = "VeryLazy",
      cmd = {
        "LLMSessionToggle",
        "LLMSelectedTextHandler",
        "LLMAppHandler",
      },
      config = function()
        require("user.llm").config()
      end,
      dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
      },
      enabled = lvim.builtin.llm.active,
    },
  }
end

return M
