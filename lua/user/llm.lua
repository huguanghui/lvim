local M = {}

local function switch(shell_func)
  -- [LINK] https://github.com/Kurama622/dotfiles/blob/main/zsh/module/func.zsh
  local p = io.popen(string.format("source ~/.config/zsh/func.zsh; %s; echo $LLM_KEY", shell_func))
  if not p then
    return
  end
  local key = p:read()
  p:close()
  return key
end

M.config = function()
  local tools = require "llm.common.tools"
  local status_ok, llm = pcall(require, "llm")
  if not status_ok then
    return
  end

  llm.setup {
    prompt = "You are a helpful chinese assistant.",

    prefix = {
      user = { text = "😃 ", hl = "Title" },
      assistant = { text = "⚡ ", hl = "Added" },
    },
    style = "float", -- right | left | above | below | float
    -- [[deepseek]]
    url = "https://api.deepseek.com/chat/completions",
    model = "deepseek-chat",
    api_type = "openai",
    fetch_key = function()
      return switch "enable_deepseek"
    end,
    max_tokens = 1024,
    save_session = true,
    max_history = 15,
    history_path = "/tmp/history", -- where to save history
    temperature = 0.3,
    top_p = 0.7,

    spinner = {
      text = {
        "󰧞󰧞",
        "󰧞󰧞",
        "󰧞󰧞",
        "󰧞󰧞",
      },
      hl = "Title",
    },

    display = {
      diff = {
        layout = "vertical", -- vertical|horizontal split for default provider
        opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
        provider = "mini_diff", -- default|mini_diff
      },
    },
  }
  local whk_status, whk = pcall(require, "which-key")
  if not whk_status then
    return
  end
  whk.register {
    -- ["<leader>1"] = { "<CMD>lua require('harpoon.ui').nav_file(1)<CR>", "󰎤 goto1" },
  }
end

return M
