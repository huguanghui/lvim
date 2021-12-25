# Readme

## ChangeLog

### 20210915

[使用bufferline替换barbar作为标签管理](https://github.com/akinsho/bufferline.nvim)

## Env

### neovim

[github](https://github.com/neovim/neovim)

commit 1dbbaf89bf5d3bcd1edac3af9938c2e2dd18f816 (HEAD -> master)
Author: Fabian <f.vioel@googlemail.com>
Date:   Fri Oct 29 04:13:40 2021 +0200

20211107
commit b74916cfd21fc307ad4898a519e1407411a01ba5 (HEAD -> master, origin/master, origin/HEAD)
Author: elianiva <dicha.arkana03@gmail.com>
Date:   Sun Nov 7 05:05:52 2021 +0700

20211201
commit caf41a7ac959768f8878a9bb9d3f0ae2d9726f79 (HEAD -> master, origin/master, origin/HEAD)
Author: zeertzjq <zeertzjq@outlook.com>
Date:   Tue Nov 30 21:51:17 2021 +0800

    vim-patch:8.2.3703: most people call F# "fsharp" and not "fs" (#16469)
        Problem:    Most people call F# "fsharp" and not "fs".
        Solution:   Rename filetype "fs" to "fsharp".
        https://github.com/vim/vim/commit/53ba95e4f0a82f6dab1791bb01f6cddc9b3f61b3

20211204
commit 419e0d117d61f6d22f696a8833541dd1691c92fb (HEAD -> master, origin/master, origin/HEAD)
Author: Christian Clason <c.clason@uni-graz.at>
Date:   Fri Dec 3 19:51:30 2021 +0100

    vim-patch:8.2.3729: no support for squirrels (#16513)

    Problem:    No support for squirrels. (closes vim/vim#9259)
    Solution:   Recognize nuts.
    https://github.com/vim/vim/commit/6f42cb0

20211219
commit abdf3a8128b78fb98ee944bc5d3086c680d779ed (HEAD -> master, origin/master, origin/HEAD)
Author: Gregory Anders <8965202+gpanders@users.noreply.github.com>
Date:   Sat Dec 18 20:59:02 2021 -0700

    fix(build): check that LuaJIT has required modules for compilation (#16714)
    
    Apparently some installations of LuaJIT do not have the "jit.bcsave"
    module which is required for pre-compilation. Check that this module
    exists before using LuaJIT as luac and if it doesn't, skip compiling
    bytecode.

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

### 主题

| Theme                                                                              |     Time of the day      |
| ---------------------------------------------------------------------------------- | :----------------------: |
| [zephyr](https://github.com/abzcoding/zephyr-nvim)                                 |        [5am, 8am)        |
| [rose-pine](https://github.com/rose-pine/neovim)                                   |       [8am, 11am)        |
| [tokyonight](https://github.com/folke/tokyonight)                                  | [12am, 5am), [11am, 5pm) |
| [doom-one](https://github.com/abzcoding/doom-one.nvim/tree/feat/nvim-cmp-floating) |        [5pm, 9pm)        |
| [kanagawa](https://github.com/rebelot/kanagawa.nvim)                               |      [9pm, 11:59pm)      |

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

### Plugin: Trouble

| Key                                        | Mode | Action                |
| ------------------------------------------ | :--: | --------------------- |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>d</kbd> |  𝐍   | diagnostics           |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>f</kbd> |  𝐍   | definitions           |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>r</kbd> |  𝐍   | references            |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>t</kbd> |  𝐍   | todo                  |
| <kbd>Space</kbd>+<kbd>t</kbd>+<kbd>w</kbd> |  𝐍   | workspace diagnostics |

</details>

[firacode]: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode/Retina
[nerd fonts]: https://www.nerdfonts.com
[neovim install]: https://github.com/neovim/neovim/wiki/Installing-Neovim
[rust install]: https://www.rust-lang.org/tools/install
[ripgrep]: https://github.com/BurntSushi/ripgrep
[fd]: https://github.com/sharkdp/fd
[nodejs install]: https://nodejs.org/en/download/package-manager/#macos
[lsp installer]: https://github.com/williamboman/nvim-lsp-installer#available-lsps
[tex support]: https://gist.github.com/peterhurford/75957ba9335e755013b87254ec85fab1

