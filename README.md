# Lightweight VSCode Neovim

一个面向 VSCode Neovim 的轻量级 Neovim 配置模板。

这个仓库保留了 `lazy.nvim` 的插件管理能力和清晰的 Lua 目录结构，但刻意不引入 LazyVim、LSP、补全、文件树、状态栏等完整 IDE 配置。目标是让 VSCode 继续负责 IDE 能力，让 Neovim 专注提供更顺手的 Vim 编辑体验。

## 特性

- 轻量启动：只使用 `lazy.nvim` 管理少量编辑增强插件。
- VSCode 友好：在 `vim.g.vscode` 环境下绑定常用 VSCode action。
- 职责清晰：VSCode 负责语言服务、搜索、终端、源代码管理和 UI；Neovim 负责文本对象、surround、yank、put、快速跳转等编辑动作。
- 易于扩展：插件集中放在 `lua/plugins`，基础配置集中放在 `lua/config`。
- 无 LazyVim 依赖：不加载 `LazyVim/LazyVim`，避免引入完整运行时和大量默认行为。

## 目录结构

```text
.
├── init.lua
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins
│       ├── coding.lua
│       └── example.lua
├── lazy-lock.json
├── stylua.toml
├── LICENSE
└── README.md
```

## 快速开始

1. 备份现有 Neovim 配置：

   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. 将本仓库复制到 Neovim 配置目录：

   ```bash
   cp -R /path/to/starter ~/.config/nvim
   ```

3. 在 VSCode 中安装并启用 VSCode Neovim 扩展。

4. 打开 VSCode 后执行插件同步：

   ```vim
   :Lazy sync
   ```

5. 首次安装插件后重启 VSCode。

## 核心文件

- `init.lua`：设置 `<leader>` 和 `<localleader>`，加载 `lazy.nvim`、通用选项和快捷键。
- `lua/config/lazy.lua`：自动引导安装 `lazy.nvim`，并导入 `lua/plugins/*.lua` 中的插件声明。
- `lua/config/options.lua`：放置共享 Neovim 选项，例如搜索、缩进、撤销文件、响应延迟等。
- `lua/config/keymaps.lua`：放置通用快捷键和 VSCode Neovim 环境下的 VSCode action 映射。
- `lua/config/autocmds.lua`：预留给普通 Neovim 场景的自动命令。
- `lua/plugins/coding.lua`：编辑增强插件集合。
- `lua/plugins/example.lua`：预留插件扩展入口。

## 插件说明

默认插件集中在编辑体验增强：

- `mini.ai`：增强 text object。
- `mini.surround`：添加、删除、替换包围符号。
- `vim-repeat`：让插件映射支持 `.` 重复。
- `yanky.nvim`：增强 yank / put 行为，并提供 yank 历史切换。
- `leap.nvim`：在当前窗口中快速跳转。
- `mini.comment`：注释切换，仅在非 VSCode Neovim 环境加载。
- `mini.move`：移动行或选区，仅在非 VSCode Neovim 环境加载。
- `mini.pairs`：自动补全括号和引号，仅在非 VSCode Neovim 环境加载。

未默认引入的能力：

- LSP、Mason、补全、诊断 UI：交给 VSCode。
- Telescope、Neo-tree、bufferline、statusline：交给 VSCode UI。
- Treesitter 相关插件：VSCode 已提供语法高亮、符号和语言能力。
- LazyVim：本仓库刻意不依赖完整 LazyVim 发行版。

## 快捷键

通用快捷键：

| 快捷键 | 模式 | 说明 |
| --- | --- | --- |
| `y` | Normal / Visual | 复制到系统剪贴板 |
| `Y` | Normal | 复制到行尾到系统剪贴板 |

VSCode Neovim 快捷键：

| 快捷键 | VSCode Action | 说明 |
| --- | --- | --- |
| `<leader><space>` | `workbench.action.quickOpen` | 快速打开文件 |
| `<leader>/` | `workbench.action.findInFiles` | 全局搜索 |
| `<leader>ss` | `workbench.action.gotoSymbol` | 跳转到符号 |
| `<leader>ft` | `workbench.action.terminal.toggleTerminal` | 切换终端 |
| `<leader>fT` | `workbench.action.terminal.toggleTerminal` | 切换终端 |
| `<c-/>` | `workbench.action.terminal.toggleTerminal` | 切换终端 |
| `<S-h>` | `workbench.action.previousEditor` | 上一个编辑器 |
| `<S-l>` | `workbench.action.nextEditor` | 下一个编辑器 |
| `gr` | `editor.action.goToReferences` | 查看引用 |
| `<leader>rn` | `editor.action.rename` | 重命名 |
| `<leader>ca` | `editor.action.quickFix` | Code Action / Quick Fix |

## 自定义方式

- 新增插件：在 `lua/plugins` 下创建或修改 Lua 文件，返回 lazy.nvim 插件 spec。
- 修改通用快捷键：编辑 `lua/config/keymaps.lua`。
- 修改通用选项：编辑 `lua/config/options.lua`。
- 添加普通 Neovim 自动命令：编辑 `lua/config/autocmds.lua`。
- 格式化 Lua：使用仓库中的 `stylua.toml`，缩进为 2 个空格。

## 注意事项

- 当前配置更偏向 VSCode Neovim 使用方式，不是完整的独立 Neovim IDE 配置。
- `init.lua` 中包含 `config.vscode.keymaps` 和 `config.vscode.options` 的预留加载逻辑；如果继续保留这两个 `require`，需要补充对应模块，或将 VSCode 专用逻辑统一放回 `lua/config/keymaps.lua`。
- `lazy-lock.json` 已锁定当前插件版本；更新插件后请提交新的 lock 文件，便于复现环境。

## 许可证

本项目基于 Apache License 2.0 发布，详见 `LICENSE`。
