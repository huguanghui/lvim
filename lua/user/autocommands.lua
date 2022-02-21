local M = {}

M.config = function()
  -- Autocommands
  vim.cmd [[
" fix the luasnip weird issue
augroup CustomLuaSnip
	au!
	au TextChanged,InsertLeave * lua require'luasnip'.unlink_current_if_deleted()
augroup end

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

  lvim.autocommands.custom_groups = {
    -- { "CursorHold", "*.rs,*.go,*.ts,*.tsx", codelens_viewer },

    -- toggleterm
    -- { "TermOpen", "term://*", "lua require('user.keybindings').set_terminal_keymaps()" },

    -- dashboard
    { "FileType", "alpha", "nnoremap <silent> <buffer> q :q<CR>" },

    -- c, cpp
    { "Filetype", "c,cpp", "nnoremap <leader>H <Cmd>ClangdSwitchSourceHeader<CR>" },

    -- go
    {
      "Filetype",
      "go",
      "nnoremap <leader>H <cmd>lua require('lvim.core.terminal')._exec_toggle('go vet .;read')<CR>",
    },

    -- java
    {
      "Filetype",
      "java",
      "nnoremap <leader>r <cmd>lua require('toggleterm.terminal').Terminal:new {cmd='mvn package;read', hidden =false}:toggle()<CR>",
    },
    {
      "Filetype",
      "java",
      "nnoremap <leader>m <cmd>lua require('toggleterm.terminal').Terminal:new {cmd='mvn compile;read', hidden =false}:toggle()<CR>",
    },

    -- python
    {
      "Filetype",
      "python",
      "nnoremap <leader>r <cmd>lua require('lvim.core.terminal')._exec_toggle('python "
        .. vim.fn.expand "%"
        .. ";read')<CR>",
    },
    {
      "Filetype",
      "python",
      "nnoremap <leader>m <cmd>lua require('lvim.core.terminal')._exec_toggle('echo \"compile :pepelaugh:\";read')<CR>",
    },

    -- rust
    {
      "Filetype",
      "rust",
      "nnoremap <leader>m <cmd>lua require('lvim.core.terminal')._exec_toggle('cargo build;read')<CR>",
    },
    {
      "Filetype",
      "rust",
      "nnoremap <leader>r <cmd>lua require('lvim.core.terminal')._exec_toggle('cargo run;read')<CR>",
    },
    {
      "Filetype",
      "rust",
      "nnoremap <leader>H <cmd>lua require('lvim.core.terminal')._exec_toggle('cargo clippy;read')<CR>",
    },
    { "Filetype", "rust", "nnoremap <leader>lm <Cmd>RustExpandMacro<CR>" },
    { "Filetype", "rust", "nnoremap <leader>lH <Cmd>RustToggleInlayHints<CR>" },
    { "Filetype", "rust", "nnoremap <leader>le <Cmd>RustRunnables<CR>" },
    { "Filetype", "rust", "nnoremap <leader>lh <Cmd>RustHoverActions<CR>" },
    { "Filetype", "rust", "nnoremap <leader>lc <Cmd>RustOpenCargo<CR>" },
    { "Filetype", "rust", "nnoremap gA <Cmd>RustHoverActions<CR>" },
    -- uncomment the following if you want to show diagnostics on hover
    -- { "CursorHold", "*", "lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false, border = 'single' })" },
  }
end

M.make_run = function()
  return {
    -- c, cpp
    {
      "Filetype",
      "c,cpp",
      "nnoremap <leader>m <cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='make ;read',count=2,direction='float'})<CR>",
    },
    {
      "Filetype",
      "c,cpp",
      "nnoremap <leader>r <cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='make run;read',count=3,direction='float'})<CR>",
    },

    -- go
    {
      "Filetype",
      "go",
      "nnoremap <leader>m <cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='go build -v .;read',count=2,direction='float'})<CR>",
    },
    {
      "Filetype",
      "go",
      "nnoremap <leader>r <cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='go run .;read',count=3,direction='float'})<CR>",
    },

    -- python
    {
      "Filetype",
      "python",
      "nnoremap <leader>r <cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='python "
        .. vim.fn.expand "%"
        .. ";read',count=2,direction='float'})<CR>",
    },
    {
      "Filetype",
      "python",
      "nnoremap <leader>m <cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='echo \"compile :pepelaugh:\";read',count=2,direction='float'})<CR>",
    },

    -- rust
    {
      "Filetype",
      "rust",
      "nnoremap <leader>m <cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='cargo build;read',count=2,direction='float'})<CR>",
    },
    {
      "Filetype",
      "rust",
      "nnoremap <leader>r <cmd>lua require('rust-tools.runnables').runnables()<CR>",
    },
    -- toml
    { "FileType", "toml", "lua require('cmp').setup.buffer { sources = { { name = 'crates' } } }" },
  }
end

return M
