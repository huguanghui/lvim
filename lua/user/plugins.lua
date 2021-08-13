local M = {}

M.config = function ()
  lvim.plugins = {
    {"lunarvim/colorschemes"},
  {"editorconfig/editorconfig-vim"},
  {"psliwka/vim-smoothie"},
  {
    -- 快速移动
    'justinmk/vim-sneak',
    -- event = "BufWinEnter",
    setup = function ()
      require("user.sneak").setup()
    end,
  },
  {
    "babaybus/DoxygenToolkit.vim",
    event = "VimEnter",
    config = function ()
      require("user.doxygen").setup()
    end,
  },
  }
end

return M
