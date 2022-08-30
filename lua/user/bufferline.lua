local M = {}

M.config = function()
  local List = require "plenary.collections.py_list"

  lvim.builtin.bufferline.highlights = {
    background = { italic = true },
    buffer_selected = { bold = true },
  }
  local g_ok, bufferline_groups = pcall(require, "bufferline.groups")
  if not g_ok then
    bufferline_groups = { builtin = { ungroupued = { name = "ungrouped" } } }
  end
  lvim.builtin.bufferline.options.navigation = { mode = "uncentered" }
  lvim.builtin.bufferline.options.diagnostics = false -- do not show diagnostics in bufferline
  lvim.builtin.bufferline.options.diagnostics_indicator = function(_, _, diagnostics)
    local result = {}
    local symbols = { error = kind.icons.error, warning = kind.icons.warn, info = kind.icons.info }
    for name, count in pairs(diagnostics) do
      if symbols[name] and count > 0 then
        table.insert(result, symbols[name] .. count)
      end
    end
    result = table.concat(result, " ")
    return #result > 0 and result or ""
  end

  lvim.builtin.bufferline.options.mode = "buffers"
  lvim.builtin.bufferline.options.sort_by = "insert_after_current"
  lvim.builtin.bufferline.options.groups = {
    options = {
      toggle_hidden_on_enter = true,
    },
    items = {
      -- bufferline_groups.builtin.pinned:with { icon = "" },
      bufferline_groups.builtin.ungrouped,
      {
        highlight = { sp = "#51AFEF" },
        name = "tests",
        icon = kind.icons.test,
        matcher = function(buf)
          local name = buf.filename
          return name:match "_spec" or name:match "_test" or name:match "test_"
        end,
      },
      {
        name = "Terraform",
        matcher = function(buf)
          return buf.name:match "%.tf" ~= nil
        end,
      },
      {
        name = "SQL",
        matcher = function(buf)
          return buf.filename:match "%.sql$"
        end,
      },
      {
        name = "view models",
        highlight = { sp = "#03589C" },
        matcher = function(buf)
          return buf.filename:match "view_model%.dart"
        end,
      },
      {
        name = "screens",
        icon = kind.icons.screen,
        matcher = function(buf)
          return buf.path:match "screen"
        end,
      },
      {
        highlight = { sp = "#C678DD" },
        name = "docs",
        matcher = function(buf)
          local list = List { "md", "org", "norg", "wiki" }
          return list:contains(vim.fn.fnamemodify(buf.path, ":e"))
        end,
      },
      {
        highlight = { sp = "#F6A878" },
        name = "config",
        matcher = function(buf)
          return buf.filename:match "go.mod"
            or buf.filename:match "go.sum"
            or buf.filename:match "Cargo.toml"
            or buf.filename:match "manage.py"
            or buf.filename:match "Makefile"
        end,
      },
    },
  }
end

return M
