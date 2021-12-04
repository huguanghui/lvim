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

zephyr -  5-8
rose_pine 8-11
tokyonight 0-5 11-17
doom_one 17-21
onedarker 21-24

## 使用

1. 块注释 -visual_mode下按<leader>/

### 支持远程ssh登录后的复制粘贴

```
tools/clipboard-provider
```
