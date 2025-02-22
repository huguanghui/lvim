local M = {}

local function switch(shell_func)
  local zshCmd = string.format("source ~/.config/zsh/func.zsh; %s; echo $LLM_KEY", shell_func)
  local fullZshCmd = string.format("/usr/bin/zsh -c '%s'", zshCmd) -- 使用 zsh 执行
  local p = io.popen(fullZshCmd)
  if not p then
    return " "
  end
  local key = p:read()
  p:close()
  return key
end

M.config = function()
  local tools = require "llm.tools"
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
    -- stylua: ignore
    keys = {
      -- The keyboard mapping for the input window.
      ["Input:Submit"]      = { mode = "n", key = "<cr>" },
      ["Input:Cancel"]      = { mode = {"n", "i"}, key = "<C-c>" },
      ["Input:Resend"]      = { mode = {"n", "i"}, key = "<C-r>" },

      -- only works when "save_session = true"
      ["Input:HistoryNext"] = { mode = {"n", "i"}, key = "<C-j>" },
      ["Input:HistoryPrev"] = { mode = {"n", "i"}, key = "<C-k>" },

      -- The keyboard mapping for the output window in "split" style.
      ["Output:Ask"]        = { mode = "n", key = "i" },
      ["Output:Cancel"]     = { mode = "n", key = "<C-c>" },
      ["Output:Resend"]     = { mode = "n", key = "<C-r>" },

      -- The keyboard mapping for the output and input windows in "float" style.
      ["Session:Toggle"]    = { mode = "n", key = "<leader>ac" },
      ["Session:Close"]     = { mode = "n", key = {"<esc>", "Q"} },
    },
  }
  local whk_status, whk = pcall(require, "which-key")
  if not whk_status then
    return
  end
  whk.register {
    ["<leader>cb"] = { "<CMD>LLMSessionToggle<CR>", "LLM Chat" },
  }
end

return M
