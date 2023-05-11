# Readme

## ChangeLog

### 20210915

[使用bufferline替换barbar作为标签管理](https://github.com/akinsho/bufferline.nvim)

## Env

### neovim

[github](https://github.com/neovim/neovim)

## Language-Server Protocol (LSP)

To leverage LSP auto-completions and other functionalities, after you open a
file in Neovim, run `:MasonInstall <server>` to use
[mason](mason) installation feature.
Use `Tab` to list available servers.

## Included Plugins

- [nvim-gdb](https://github.com/sakhnik/nvim-gdb)
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)

## 20211005

支持粘贴历史浏览

[nvim-neoclip](https://github.com/AckslD/nvim-neoclip.lua)

```
sudo apt-get install sqlite3 libsqlite3-dev
```

black安装

```
pip3 install black -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com
```

[vale](https://docs.errata.ai/vale/install)

```
curl -sfL https://install.goreleaser.com/github.com/ValeLint/vale.sh | sh -s latest
```

[markdownlink](https://github.com/markdownlint/markdownlint)

```
```

## Plugins

Total: 58

### 补全
github/copilot.vim - 出至微软的一款AI生成代码的插件
abecodes/tabout.nvim

karb94/neoscroll.nvim - 滚屏插件
AckslD/nvim-neoclip.lua - 粘贴历史浏览
- [fidget](https://github.com/j-hui/fidget.nvim)

### 主题

| Theme                                                |      Time of the day       |
| ---------------------------------------------------- | :------------------------: |
| [rose-pine](https://github.com/rose-pine/neovim)     |         [1am, 9am)         |
| [tokyonight](https://github.com/folke/tokyonight)    |         [9am, 5pm)         |
| [catppuccin](https://github.com/catppuccin/nvim)     |         [5pm, 9pm)         |
| [kanagawa](https://github.com/rebelot/kanagawa.nvim) | [9pm, 11:59pm), [0am, 1am] |

## 使用

1. 块注释 -visual_mode下按<leader>/

### 支持远程ssh登录后的复制粘贴

```
tools/clipboard-provider
```

## Custom Key-mappings

Note that,

- **Leader** key set as <kbd>Space</kbd>

<details open>
  <summary>
    <strong>Key-mappings</strong>
    <small><i>(🔎 Click to expand/collapse)</i></small>
  </summary>

<center>Modes: 𝐍=normal 𝐕=visual 𝐒=select 𝐈=insert 𝐂=command</center>

### UI

| Key                           | Mode | Action              | Plugin or Mapping                           |
| ----------------------------- | :--: | ------------------- | ------------------------------------------- |
| <kbd>Space</kbd>+<kbd>e</kbd> |  𝐍   | Open file tree      | <small>NvimTree</small>                     |
| <kbd>Space</kbd>+<kbd>o</kbd> |  𝐍   | Open symbols        | <small>Symbols-outline</small>              |
| <kbd>Space</kbd>+<kbd>f</kbd> |  𝐍   | Open file finder    | <small>Telescope</small>                    |
| <kbd>Space</kbd>+<kbd>h</kbd> |  𝐍   | Remove highlight    | <small>`nohlsearch<`</small>                |
| <kbd>Space</kbd>+<kbd>/</kbd> |  𝐍   | Toggle comment      | <small>Comment.nvim</small>                 |
| <kbd>Space</kbd>+<kbd>?</kbd> |  𝐍   | Open cheats         | <small>cheat.sh</small>                     |
| <kbd>Space</kbd>+<kbd>'</kbd> | 𝐍    | Open marks          | <small>which-key marks</small>              |
| <kbd>Space</kbd>+<kbd>z</kbd> | 𝐍    | Zen mode            | <small>zen-mode.nvim</small>                |
| <kbd>Space</kbd>+<kbd>P</kbd> |  𝐍   | Projects            | <small>project.nvim</small>                 |
| <kbd>Ctrl</kbd>+<kbd>s</kbd>  |  𝐈   | show signature help | <small>vim.lsp.buf.signature_help()</small> |
| <kbd>Alt</kbd>+<kbd>s</kbd>   |  𝐈   | snippet selection   | <small>telescope luasnip extension</small>  |

### Motion

| Key                         | Mode | Action                    | Plugin or Mapping                                                   |
| --------------------------- | :--: | ------------------------- | ------------------------------------------------------------------- |
| <kbd>f</kbd>                |  𝐍   | find next chacharacter    | <small>HopChar1CurrentLineAC</small> or <small>Lightspeed_f</small> |
| <kbd>F</kbd>                |  𝐍   | find prprevious character | <small>HopChar1CurrentLineBC</small> or <small>Lightspeed_F</small> |
| <kbd>s</kbd>                |  𝐍   | find chacharacter         | <small>HopChar2</small> or <small>Lightspeed_s</small>              |
| <kbd>S</kbd>                |  𝐍   | find word                 | <small>HopWord</small> or <small>Lightspeed_S</small>               |
| <kbd>Alt</kbd>+<kbd>a</kbd> |  𝐈   | select all                | <small>ggVG</small>                                                 |
| <kbd>Alt</kbd>+<kbd>a</kbd> |  𝐍   | increment number          | <small>C-A</small>                                                  |
| <kbd>Alt</kbd>+<kbd>x</kbd> |  𝐍   | decrement number          | <small>C-X</small>                                                  |

### LSP

| Key                                                                                      | Mode | Action                              |
| ---------------------------------------------------------------------------------------- | :--: | ----------------------------------- |
| <kbd>Tab</kbd> / <kbd>Shift-Tab</kbd>                                                    |  𝐈   | Navigate completion-menu            |
| <kbd>Enter</kbd>                                                                         |  𝐈   | Select completion or expand snippet |
| <kbd>Up</kbd>or <kbd>Down</kbd>                                                          |  𝐈   | Movement in completion pop-up       |
| <kbd>]</kbd>+<kbd>d</kbd>                                                                |  𝐍   | Next diagnostic                     |
| <kbd>[</kbd>+<kbd>d</kbd>                                                                |  𝐍   | Previous diagnostic                 |
| <kbd>Space</kbd>+<kbd>l</kbd>+<kbd>j</kbd> or <kbd>Space</kbd>+<kbd>l</kbd>+<kbd>k</kbd> |  𝐍   | Next/previous LSP diagnostic        |
| <kbd>Ctrl</kbd>+<kbd>e</kbd>                                                             |  𝐈   | Close pop-up                        |
| <kbd>Tab</kbd> / <kbd>Shift-Tab</kbd>                                                    | 𝐈 𝐒  | Navigate snippet placeholders       |
| <kbd>Space</kbd>+<kbd>l</kbd>                                                            |  𝐍   | keybindings for lsp                 |
| <kbd>g</kbd>+<kbd>a</kbd>                                                                |  𝐍   | code actions                        |
| <kbd>g</kbd>+<kbd>d</kbd>                                                                |  𝐍   | goto definition                     |
| <kbd>g</kbd>+<kbd>D</kbd>                                                                |  𝐍   | goto declaration                    |
| <kbd>g</kbd>+<kbd>I</kbd>                                                                |  𝐍   | goto implementation                 |
| <kbd>g</kbd>+<kbd>p</kbd>                                                                |  𝐍   | peek implementation                 |
| <kbd>g</kbd>+<kbd>r</kbd>                                                                |  𝐍   | goto references                     |
| <kbd>g</kbd>+<kbd>s</kbd>                                                                |  𝐍   | show signature help                 |


### Plugin: AsyncTasks

| Key                                        | Mode | Action        |
| ------------------------------------------ | :--: | ------------- |
| <kbd>Space</kbd>+<kbd>m</kbd>+<kbd>f</kbd> |  𝐍   | Build File    |
| <kbd>Space</kbd>+<kbd>m</kbd>+<kbd>p</kbd> |  𝐍   | Build Project |
| <kbd>Space</kbd>+<kbd>m</kbd>+<kbd>e</kbd> |  𝐍   | Edit Tasks    |
| <kbd>Space</kbd>+<kbd>m</kbd>+<kbd>l</kbd> |  𝐍   | List Tasks    |
| <kbd>Space</kbd>+<kbd>r</kbd>+<kbd>f</kbd> |  𝐍   | Run File      |
| <kbd>Space</kbd>+<kbd>r</kbd>+<kbd>p</kbd> |  𝐍   | Run Project   |

### Plugin: Gitsigns

| Key                                                                                      | Mode | Action                 |
| ---------------------------------------------------------------------------------------- | :--: | ---------------------- |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>j</kbd> or <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>k</kbd> |  𝐍   | Next/previous Git hunk |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>p</kbd>                                               |  𝐍   | Preview hunk           |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>l</kbd>                                               |  𝐍   | Blame line             |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>s</kbd>                                               | 𝐍 𝐕  | Stage hunk             |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>u</kbd>                                               |  𝐍   | Undo stage hunk        |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>R</kbd>                                               | 𝐍 𝐕  | Reset hunk             |

### Plugin: LazyGit

| Key                                        | Mode | Action           |
| ------------------------------------------ | :--: | ---------------- |
| <kbd>Space</kbd>+<kbd>g</kbd>+<kbd>g</kbd> |  𝐍   | Open lazy git UI |

### Plugin: Telescope

| Key                                        | Mode | Action                   |
| ------------------------------------------ | :--: | ------------------------ |
| <kbd>Space</kbd>+<kbd>f</kbd>              |  𝐍   | File search              |
| <kbd>Space</kbd>+<kbd>P</kbd>              |  𝐍   | Project search           |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>s</kbd> |  𝐍   | Grep search              |
| <kbd>Space</kbd>+<kbd>F</kbd>+<kbd>l</kbd> |  𝐍   | Reopen last search       |
| <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>f</kbd> |  𝐍   | Buffers                  |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>c</kbd> |  𝐍   | Colorschemes             |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>C</kbd> |  𝐍   | Command history          |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>h</kbd> |  𝐍   | Find help                |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>k</kbd> |  𝐍   | Keymap search            |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>M</kbd> |  𝐍   | Man Pages search         |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>r</kbd> |  𝐍   | Register search          |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>t</kbd> |  𝐕   | Grep string under cursor |
| <kbd>Space</kbd>+<kbd>s</kbd>+<kbd>t</kbd> |  𝐍   | Grep raw                 |
| <kbd>Space</kbd>+<kbd>F</kbd>+<kbd>b</kbd> |  𝐍   | Builtin search           |
| <kbd>Space</kbd>+<kbd>F</kbd>+<kbd>f</kbd> |  𝐍   | Current buffer search    |
| <kbd>Space</kbd>+<kbd>F</kbd>+<kbd>g</kbd> |  𝐍   | Git files search         |
| <kbd>Space</kbd>+<kbd>F</kbd>+<kbd>i</kbd> |  𝐍   | Installed plugins        |
| <kbd>Space</kbd>+<kbd>F</kbd>+<kbd>p</kbd> |  𝐍   | Project search           |
| <kbd>Space</kbd>+<kbd>F</kbd>+<kbd>i</kbd> |  𝐍   | Installed plugins        |
| **Within _Telescope_ window**              |      |                          |
| <kbd>CR</kbd>                              | 𝐈 𝐍  | Multi/Single Open        |
| <kbd>Ctrl</kbd>+<kbd>c</kbd>               | 𝐈 𝐍  | Exit telescope           |
| <kbd>Ctrl</kbd>+<kbd>v</kbd>               | 𝐈 𝐍  | Open in a vertical split |
| <kbd>Ctrl</kbd>+<kbd>s</kbd>               | 𝐈 𝐍  | Open in a split          |
| <kbd>Ctrl</kbd>+<kbd>t</kbd>               | 𝐈 𝐍  | Open in a tab            |
| <kbd>Tab</kbd>                             | 𝐈 𝐍  | Toggle Selection + Next  |
| <kbd>Shift</kbd>+<kbd>Tab</kbd>            | 𝐈 𝐍  | Toggle Selection + Prev  |

### Plugin: Harpoon

| Key                               | Mode | Action                           |
| --------------------------------- | :--: | -------------------------------- |
| <kbd>Space</kbd>+<kbd>Space</kbd> |  𝐍   | show harpoon shortlist           |
| <kbd>Space</kbd>+<kbd>a</kbd>     |  𝐍   | add file to shortlist            |
| <kbd>Space</kbd>+<kbd>1</kbd>     |  𝐍   | jump to first file on shortlist  |
| <kbd>Space</kbd>+<kbd>2</kbd>     |  𝐍   | jump to second file on shortlist |
| <kbd>Space</kbd>+<kbd>3</kbd>     |  𝐍   | jump to third file on shortlist  |
| <kbd>Space</kbd>+<kbd>4</kbd>     |  𝐍   | jump to forforthle on shortlist  |

### Plugin: Neogen

| Key                                        | Mode | Action                    |
| ------------------------------------------ | :--: | ------------------------- |
| <kbd>Space</kbd>+<kbd>n</kbd>+<kbd>c</kbd> |  𝐍   | class docdocumentation    |
| <kbd>Space</kbd>+<kbd>n</kbd>+<kbd>f</kbd> |  𝐍   | function docdocumentation |

### Plugin: Persistence

| Key                                        | Mode | Action                                |
| ------------------------------------------ | :--: | ------------------------------------- |
| <kbd>Space</kbd>+<kbd>q</kbd>+<kbd>d</kbd> |  𝐍   | quit without saving session           |
| <kbd>Space</kbd>+<kbd>q</kbd>+<kbd>l</kbd> |  𝐍   | restore last session                  |
| <kbd>Space</kbd>+<kbd>q</kbd>+<kbd>s</kbd> |  𝐍   | restore last session from current dir |

### Plugin: Bufferline

| Key                                        | Mode | Action               |
| ------------------------------------------ | :--: | -------------------- |
| <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>f</kbd> |  𝐍   | find buffer          |
| <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>b</kbd> |  𝐍   | toggle buffer groups |
| <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>p</kbd> |  𝐍   | pick buffer          |
| <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>1</kbd> |  𝐍   | goto buffer 1        |
| <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>h</kbd> |  𝐍   | Close all to left    |
| <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>l</kbd> |  𝐍   | Close all to right   |
| <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>D</kbd> |  𝐍   | Sort by directory    |
| <kbd>Space</kbd>+<kbd>b</kbd>+<kbd>L</kbd> |  𝐍   | Sort by language     |

### Plugin: Trouble

| Key                                        | Mode | Action                |
| ------------------------------------------ | :--: | --------------------- |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>d</kbd> |  𝐍   | diagnostics           |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>f</kbd> |  𝐍   | definitions           |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>r</kbd> |  𝐍   | references            |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>t</kbd> |  𝐍   | todo                  |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>w</kbd> |  𝐍   | workspace diagnostics |

### Plugin: Copilot

| Key                          | Mode | Action                              |
| ---------------------------- | :--: | ----------------------------------- |
| <kbd>Ctrl</kbd>+<kbd>h</kbd> |  𝐈   | `copilot#Accept("<CR>")`            |
| <kbd>Ctrl</kbd>+<kbd>e</kbd> |  𝐈   | close cmp menu                     |
| <kbd>Alt</kbd>+<kbd>]</kbd>  |  𝐈   | `<Plug>(copilot-next)`              |
| <kbd>Alt</kbd>+<kbd>[</kbd>  |  𝐈   | `<Plug>(copilot-previous)`          |
| <kbd>Alt</kbd>+<kbd>\</kbd>  |  𝐈   | `"<Cmd>vertical Copilot panel<CR>"` |

</details>

[firacode]: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode/Retina
[nerd fonts]: https://www.nerdfonts.com
[neovim install]: https://github.com/neovim/neovim/wiki/Installing-Neovim
[rust install]: https://www.rust-lang.org/tools/install
[ripgrep]: https://github.com/BurntSushi/ripgrep
[fd]: https://github.com/sharkdp/fd
[nodejs install]: https://nodejs.org/en/download/package-manager/#macos
[mason]: https://github.com/williamboman/mason.nvim
[tex support]: https://gist.github.com/peterhurford/75957ba9335e755013b87254ec85fab1
[clangd_extensions.nvim](https://github.com/p00f/clangd_extensions.nvim)

## Extern

comment

visual_mode
gc line comment
gb block comment

## Task

-[] 带图标字体
