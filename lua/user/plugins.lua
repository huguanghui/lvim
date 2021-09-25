local M = {}

M.config = function()
  lvim.plugins = {
    {
      "Pocco81/Catppuccino.nvim",
      config = function()
        require("user/theme").catppuccino()
      end,
      cond = function()
        local _time = os.date "*t"
        return (_time.hour >= 7 and _time.hour < 11)
      end,
    },
    {
      "abzcoding/tokyonight.nvim",
      branch = "feature/vim-diagnostics",
      config = function()
        require("user/theme").tokyonight()
        vim.cmd [[
      colorscheme tokyonight
      ]]
      end,
      cond = function()
        local _time = os.date "*t"
        return (_time.hour >= 0 and _time.hour < 7) or (_time.hour >= 11 and _time.hour < 17)
      end,
    },
    {
      "NTBBloodbath/doom-one.nvim",
      config = function()
        vim.g.doom_one_italic_comments = true
        vim.cmd [[
        colorscheme doom-one
      ]]
      end,
      cond = function()
        local _time = os.date "*t"
        return (_time.hour >= 17 and _time.hour < 21)
      end,
    },
    { "editorconfig/editorconfig-vim" },
    { "psliwka/vim-smoothie" },
    {
      "ray-x/lsp_signature.nvim",
      config = function()
        require("user/lsp_signature").config()
      end,
      event = "BufRead",
    },

    {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup()
      end,
      event = "BufRead",
    },
    {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup()
      end,
      cmd = "Trouble",
    },
    {
      -- 快速移动
      "phaazon/hop.nvim",
      event = "BufRead",
      config = function()
        require("user.hop").config()
      end,
    },
    {
      "simrat39/symbols-outline.nvim",
      config = function()
        require("user.outline").config()
        vim.g.symbols_outline.auto_preview = false
      end,
      cmd = "SymbolsOutline",
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      setup = function()
        require("user.indent_blankline").setup()
      end,
      event = "BufRead",
    },
    {
      "tzachar/cmp-tabnine",
      run = "./install.sh",
      requires = "hrsh7th/nvim-cmp",
      config = function()
        local tabnine = require "cmp_tabnine.config"
        tabnine:setup {
          max_lines = 1000,
          max_num_results = 10,
          sort = true,
        }
      end,
      disable = not lvim.builtin.tabnine.active,
    },
    {
      "kevinhwang91/nvim-bqf",
      config = function()
        require("user.bqf").config()
      end,
      event = "BufRead",
    },
    {
      -- 搜索替换
      "windwp/nvim-spectre",
      event = "BufRead",
      config = function()
        require("user.spectre").config()
      end,
    },
    {
      "danymat/neogen",
      config = function()
        require("neogen").setup {
          enabled = true,
        }
      end,
      event = "BufRead",
      requires = "nvim-treesitter/nvim-treesitter",
    },
    {
      "akinsho/bufferline.nvim",
      config = function()
        require("user.bufferline").config()
      end,
      requires = "nvim-web-devicons",
      disable = not lvim.builtin.fancy_bufferline.active,
    },
    {
      "RishabhRD/nvim-cheat.sh",
      requires = "RishabhRD/popfix",
      config = function()
        vim.g.cheat_default_window_layout = "vertical_split"
      end,
      cmd = { "Cheat", "CheatWithoutComments", "CheatList", "CheatListWithoutComments" },
      disable = not lvim.builtin.cheat.active,
    },
  }
end

return M
