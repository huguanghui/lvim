local M = {}

M.config = function()
  -- NOTE: By default, all null-ls providers are checked on startup.
  -- If you want to avoid that or want to only set up the provider
  -- when you opening the associated file-type,
  -- then you can use filetype plugins for this purpose.
  -- https://www.lunarvim.org/languages/#lazy-loading-the-formatter-setup
  local status_ok, nls = pcall(require, "null-ls")
  if not status_ok then
    return
  end

  -- you can either config null-ls itself
  nls.config {
    debounce = 150,
    save_after_format = false,
    sources = {
      nls.builtins.formatting.prettierd,
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.goimports,
      nls.builtins.formatting.cmake_format,
      nls.builtins.formatting.scalafmt,
      nls.builtins.formatting.sqlformat,
      nls.builtins.formatting.terraform_fmt,
      nls.builtins.formatting.shfmt.with { extra_args = { "-i", "2", "-ci" } },
      nls.builtins.diagnostics.hadolint,
      nls.builtins.diagnostics.eslint_d,
      nls.builtins.diagnostics.shellcheck,
      nls.builtins.diagnostics.luacheck,
      nls.builtins.diagnostics.vint,
      nls.builtins.diagnostics.chktex,
    },
  }

  -- or use the lunarvim syntax
  -- local formatters = require "lvim.lsp.null-ls.formatters"
  -- formatters.setup {
  --   {
  --     exe = "prettier",
  --     filetypes = {
  --       "javascriptreact",
  --       "javascript",
  --       "typescriptreact",
  --       "typescript",
  --       "json",
  --       "markdown",
  --     },
  --   },
  --   {

  --   }
  -- }
  -- local linters = require "lvim.lsp.null-ls.linters"
  -- linters.setup {
  --   {
  --     exe = "eslint",
  --     filetypes = {
  --       "javascriptreact",
  --       "javascript",
  --       "typescriptreact",
  --       "typescript",
  --       "vue",
  --     },
  --   },
  -- }

  -- WARN: do not redfine or reuse formatter/linters in this format
  -- or use the lang specific format
  lvim.lang.python.formatters = {
    {
      exe = "black",
      args = { "--fast" },
    },
    {
      exe = "isort",
      args = {
        "--profile",
        "black",
      },
    },
  }
  -- lvim.lang.markdown.linters = {
  --   {
  --     exe = "markdownlint",
  --   },
  --   {
  --     exe = "vale",
  --   },
  -- }
end

return M
