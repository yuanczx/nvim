# Neovim 配置

- 我的Neovim配置
- My personal neovim configuration

## 环境 Environment

- Windows11 22H2
- Windows Terminal + PowerShell

## 使用提示 Tips

- 请按照Packer.nvim的提示正确安装Packer
- coc.nvim 需要`nodejs`环境
- 部分插件需要使用`yarn`完成安装
- 在Linux下可能需要额外配置

## 插件 Plugins

- [packer.nvim](https://github.com/wbthomason/packer.nvim) 插件管理工具
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) 状态栏
- [onedark.nvim](https://github.com/navarasu/onedark.nvim) OneDark主题
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) 快捷注释插件
- [coc.nvim](https://github.com/neoclide/coc.nvim) LSP支持
  - [coc-pairs](https://github.com/neoclide/coc-pairs) 符号补全
  - [coc-rust-analyzer](https://github.com/fannheyward/coc-rust-analyzer) Rust支持
  - [rust-analyzer](https://github.com/rust-lang/rust-analyzer) rust-analyzer
  - [texlab](https://github.com/latex-lsp/texlab) LaTeX LSP支持

- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) 文件管理
  - [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) Icon显示
  - [Nerd Fonts](https://www.nerdfonts.com/) Nerd字体字符图标

- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) 缓冲区

- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) Markdown预览
- [leap.nvim](https://github.com/ggandor/leap.nvim) 字符串搜索快速定位
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) 代码片段

## 快捷键 KeyMap

|按键|功能|
|---|---|
|\<space\>|\<leader\>|
|\<leader\>r|运行|
|\<leader\>t|:NvimTreeToggle 显示目录|
|\<leader\>p|:MarkdownPreview Markdown预览|
|\<a-h\>|:bprevious|
|\<a-l\>|:bnext|
|\<c-q\>|:bp\|bd \# 关闭当前buffer|
|:vs|左右分屏|
|:sv|上下分屏|
