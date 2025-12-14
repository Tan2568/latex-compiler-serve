# 快速开始指南 🚀

欢迎使用 LaTeX 中文学术论文在线编译服务器！本指南将帮助你在 5 分钟内完成第一份 LaTeX 文档的编译。

## 第一步：创建你的编译环境

### 方式 A：Fork 本仓库（推荐新手）

1. 点击页面右上角的 **Fork** 按钮
2. 点击 **Create fork** 确认
3. 等待几秒，你将拥有自己的副本

### 方式 B：直接使用模板

1. 点击页面右上角的 **Use this template** 按钮
2. 选择 **Create a new repository**
3. 填写仓库名称，点击 **Create repository**

## 第二步：启动 Codespaces

1. 在仓库页面，点击绿色的 **<> Code** 按钮
2. 切换到 **Codespaces** 标签页
3. 点击 **Create codespace on main** 按钮
4. ⏳ 等待 2-5 分钟，环境正在为你准备...

💡 **提示**：首次启动需要构建 Docker 镜像，会比较慢。之后启动会快很多！

## 第三步：编译示例文档

环境启动后，你会看到一个 VS Code 界面。现在开始编译吧！

### 🎯 超简单方式：一键编译

在底部终端中输入：

```bash
make
```

按回车，等待编译完成。你会看到：

```
编译示例文档...
...（编译信息）...
完成! PDF 文件: examples/example.pdf
```

### 📝 使用 VS Code 界面编译

1. 点击左侧文件浏览器中的 `examples/example.tex`
2. 文件打开后，看右上角有几个图标
3. 点击 **Build LaTeX project** 图标（▶️ 播放按钮）
4. 等待几秒
5. 点击 **View LaTeX PDF** 图标（👁️ 眼睛图标）查看结果

## 第四步：下载你的 PDF

PDF 编译成功了！现在把它下载到本地：

1. 在左侧文件浏览器中找到 `examples/example.pdf`
2. **右键点击** 这个文件
3. 选择 **Download...** 
4. 选择保存位置
5. ✅ 完成！

## 第五步：编写你自己的文档

现在你可以开始创作了！

### 🆕 创建新文档

1. 在文件浏览器中，右键点击 `examples` 文件夹
2. 选择 **New File...**
3. 输入文件名，例如 `my-paper.tex`
4. 开始编写！

### ✏️ 基础模板

复制粘贴这个模板到你的新文件：

```latex
\documentclass[12pt,a4paper]{article}
\usepackage{ctex}
\usepackage{amsmath}
\usepackage{graphicx}

\title{我的第一篇论文}
\author{我的名字}
\date{\today}

\begin{document}

\maketitle

\section{引言}

这是我使用 LaTeX 写的第一篇文档！

\section{主要内容}

我可以写公式：$E = mc^2$

也可以写更复杂的公式：
\begin{equation}
    \int_0^\infty e^{-x^2} dx = \frac{\sqrt{\pi}}{2}
\end{equation}

\section{结论}

LaTeX 真好用！

\end{document}
```

### 🔧 编译你的文档

```bash
./compile.sh examples/my-paper.tex
```

或者在 VS Code 中打开文件，按 `Ctrl+Alt+B`（Windows/Linux）或 `Cmd+Alt+B`（Mac）。

## 🎓 进阶技巧

### 自动编译

当你保存文件时，LaTeX Workshop 会自动编译。太方便了！

### 预览 PDF

- 按 `Ctrl+Alt+V`（Windows/Linux）或 `Cmd+Alt+V`（Mac）打开 PDF 预览
- 在预览窗口中，你的更改会自动刷新

### 快速跳转

- 在 `.tex` 文件中按 `Ctrl+Alt+J`，会跳转到 PDF 的对应位置
- 在 PDF 中 `Ctrl+点击`，会跳转到源代码

## ❓ 遇到问题？

### 编译失败

1. 检查终端输出的错误信息
2. 确保所有 `\begin{}` 都有对应的 `\end{}`
3. 检查特殊字符是否正确转义（如 `%`、`&`、`_` 等）

### 中文显示不正常

1. 确保文件使用 UTF-8 编码保存
2. 确保包含了 `\usepackage{ctex}`
3. 使用 `xelatex` 编译（本环境默认）

### 找不到图片

确保图片路径正确，例如：
```latex
\includegraphics[width=0.8\textwidth]{images/my-image.png}
```

## 💾 保存你的工作

Codespaces 会自动保存所有更改到云端。但要确保：

1. **定期 commit**：
```bash
git add .
git commit -m "更新论文内容"
git push
```

2. **不要忘记下载 PDF**：编译好的 PDF 可以下载到本地备份

## 📱 从其他设备访问

你的 Codespace 可以从任何设备访问：

1. 打开 [github.com/codespaces](https://github.com/codespaces)
2. 找到你的 Codespace
3. 点击打开
4. 继续工作！

## 🛑 记得停止 Codespace

不用的时候记得停止，节省免费时长：

1. 点击左下角绿色的 **Codespaces: xxx** 按钮
2. 选择 **Stop Current Codespace**

或者在 GitHub 仓库页面：
- Code → Codespaces → ⋯ → Stop codespace

## 🎉 恭喜！

你已经掌握了基础操作！现在可以：

- 📖 查看完整的 [README.md](README.md) 了解更多功能
- 🔍 研究 `examples/example.tex` 学习更多 LaTeX 技巧
- 📚 开始写你的论文吧！

祝写作愉快！如有问题，欢迎提 Issue。🌟
