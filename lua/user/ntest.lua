local M = {}

M.config = function()
  local status_ok, nt = pcall(require, "neotest")
  if not status_ok then
    return
  end

  nt.setup {
    running = {
      concurrent = false,
    },
    status = {
      virtual_text = true,
      signs = false,
    },
    strategies = {
      integrated = {
        width = 180,
      },
    },
    discovery = {
      enabled = false,
    },
    diagnostic = {
      enabled = false,
    },
    icons = {
      running = require("user.lsp_kind").icons.clock,
    },
    floating = {
      border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    },
    adapters = {
      require "neotest-rust",
      require "neotest-go" {
        experimental = {
          test_table = true,
        },
      },
      require "neotest-python" {
        dap = { justMyCode = false, console = "integratedTerminal" },
        args = { "--log-level", "DEBUG", "--quiet" },
        runner = "pytest",
      },
      require "neotest-plenary",
    },
  }
end

M.get_env = function()
  local env = {}
  for _, file in ipairs { ".env" } do
    if vim.fn.empty(vim.fn.glob(file)) ~= 0 then
      break
    end

    for _, line in ipairs(vim.fn.readfile(file)) do
      for name, value in string.gmatch(line, "(.+)=['\"]?(.*)['\"]?") do
        local str_end = string.sub(value, -1, -1)
        if str_end == "'" or str_end == '"' then
          value = string.sub(value, 1, -2)
        end

        env[name] = value
      end
    end
  end
  return env
end

M.run_all = function()
  local neotest = require "neotest"
  for _, adapter_id in ipairs(neotest.run.adapters()) do
    neotest.run.run { suite = true, adapter = adapter_id }
  end
end

return M
