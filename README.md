# LaTeX 中文学术论文在线编译服务器 📝

一个基于 GitHub Codespaces 的远程 LaTeX 编译环境，专为中文学术论文写作设计。无需本地安装复杂的 TeX 环境，在浏览器或 VS Code 中即可完成论文编写和编译。

## ✨ 特性

- 🌏 **完整中文支持**：使用 CTeX 宏包，完美支持中文排版
- 📊 **学术论文标配**：包含数学公式、图片、表格等常用元素
- ☁️ **云端编译**：基于 GitHub Codespaces，无需本地安装
- 🪶 **轻量镜像**：基于 Alpine Linux，快速启动
- 🎯 **开箱即用**：预配置 LaTeX Workshop 扩展，提供实时预览
- 📦 **精简安装**：仅安装必要的 TeX 包，节省空间和时间

## 🚀 快速开始（零基础教程）

### 方法一：使用 GitHub Codespaces（推荐）

#### 1. Fork 本仓库

1. 点击页面右上角的 **Fork** 按钮
2. 在弹出的页面中点击 **Create fork**
3. 等待仓库复制完成

#### 2. 启动 Codespaces

1. 在你 fork 的仓库页面，点击绿色的 **Code** 按钮
2. 选择 **Codespaces** 标签
3. 点击 **Create codespace on main**（或点击 + 号创建新的 codespace）
4. 等待环境初始化（首次启动可能需要 2-5 分钟）

#### 3. 编译示例文档

环境启动后，你会看到一个 VS Code 界面。按照以下步骤编译示例文档：

**方式 A：使用命令行**

```bash
# 使用 make 命令（推荐）
make

# 或使用编译脚本
./compile.sh examples/example.tex
```

**方式 B：使用 LaTeX Workshop 扩展**

1. 在左侧文件浏览器中打开 `examples/example.tex`
2. 点击右上角的绿色播放按钮 ▶️（Build LaTeX project）
3. 或使用快捷键 `Ctrl+Alt+B`（Windows/Linux）或 `Cmd+Alt+B`（Mac）
4. 编译完成后，点击右上角的预览按钮 👁️ 查看 PDF

#### 4. 下载 PDF

编译完成后，PDF 文件会生成在与 `.tex` 文件相同的目录下：

1. 在左侧文件浏览器中找到 `examples/example.pdf`
2. 右键点击文件
3. 选择 **Download**

#### 5. 编写你自己的论文

1. 在 `examples` 目录下创建新的 `.tex` 文件，或直接修改 `example.tex`
2. 编写内容（可以参考示例文档的结构）
3. 使用相同的方法编译
4. 下载生成的 PDF

### 方法二：连接本地 VS Code

如果你想在本地 VS Code 中使用远程编译环境：

#### 1. 安装必要扩展

在本地 VS Code 中安装以下扩展：
- **GitHub Codespaces** (由 GitHub 官方提供)

#### 2. 连接到 Codespace

1. 按 `F1` 或 `Ctrl+Shift+P` 打开命令面板
2. 输入 `Codespaces: Connect to Codespace`
3. 选择你之前创建的 Codespace
4. 等待连接完成

#### 3. 开始编写

连接成功后，你的本地 VS Code 就像直接在远程环境中工作一样：
- 所有文件都在远程服务器上
- 编译命令在远程执行
- 可以使用所有 LaTeX Workshop 功能

## 📖 使用说明

### 文档结构

```
latex-compiler-serve/
├── .devcontainer/
│   └── devcontainer.json       # Codespaces 配置文件
├── examples/
│   ├── example.tex             # 示例文档
│   ├── example.pdf             # 编译生成的 PDF
│   └── images/                 # 图片资源目录
├── Dockerfile                   # Docker 镜像配置
├── Makefile                     # 编译自动化
├── compile.sh                   # 编译脚本
└── README.md                    # 本文档
```

### 编译命令

#### 使用 Makefile（推荐）

```bash
# 编译示例文档
make

# 清理辅助文件（保留 PDF）
make clean

# 清理所有生成的文件（包括 PDF）
make cleanall

# 查看帮助
make help
```

#### 使用编译脚本

```bash
# 编译任意 .tex 文件
./compile.sh path/to/your-file.tex

# 示例
./compile.sh examples/example.tex
```

#### 直接使用 XeLaTeX

```bash
# 进入文档目录
cd examples

# 编译（需要运行两次以更新交叉引用）
xelatex example.tex
xelatex example.tex
```

### LaTeX Workshop 扩展使用

本环境预配置了 **LaTeX Workshop** 扩展，提供以下功能：

- **自动编译**：保存文件时自动编译（默认开启）
- **PDF 预览**：点击右上角预览按钮查看 PDF
- **语法高亮**：LaTeX 代码高亮显示
- **自动补全**：命令和环境自动补全
- **错误检查**：实时显示编译错误

**快捷键：**
- `Ctrl+Alt+B` / `Cmd+Alt+B`：编译文档
- `Ctrl+Alt+V` / `Cmd+Alt+V`：查看 PDF
- `Ctrl+Alt+J` / `Cmd+Alt+J`：跳转到 PDF 对应位置（SyncTeX）

## 📝 LaTeX 基础知识

### 文档结构

一个基本的中文 LaTeX 文档结构如下：

```latex
\documentclass[12pt,a4paper]{article}

% 导言区：加载宏包
\usepackage{ctex}           % 中文支持
\usepackage{amsmath}        % 数学公式
\usepackage{graphicx}       % 图片
\usepackage{booktabs}       % 表格

% 标题信息
\title{论文标题}
\author{作者姓名}
\date{\today}

% 正文开始
\begin{document}

\maketitle                  % 生成标题

\section{引言}
这是第一节的内容。

\section{方法}
这是第二节的内容。

\end{document}
```

### 常用元素

#### 数学公式

```latex
% 行内公式
这是行内公式 $E = mc^2$。

% 行间公式
\begin{equation}
    \int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}
\end{equation}
```

#### 插入图片

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{images/my-image.png}
    \caption{图片标题}
    \label{fig:my-label}
\end{figure}
```

#### 制作表格

```latex
\begin{table}[htbp]
    \centering
    \caption{表格标题}
    \begin{tabular}{lcc}
        \toprule
        项目 & 数值1 & 数值2 \\
        \midrule
        A & 1.0 & 2.0 \\
        B & 3.0 & 4.0 \\
        \bottomrule
    \end{tabular}
    \label{tab:my-label}
\end{table}
```

## 🔧 技术细节

### 安装的 TeX 包

基于 Alpine Linux 的轻量级安装，包含以下核心包：

- `texlive`：TeX Live 核心
- `texmf-dist-latexextra`：LaTeX 扩展宏包
- `texmf-dist-fontsextra`：额外字体
- `texmf-dist-langchinese`：中文语言支持（含 CTeX）
- `texmf-dist-pictures`：图形绘制宏包
- `texmf-dist-science`：科学文档宏包（含 amsmath 等）

### 编译引擎

本环境使用 **XeLaTeX** 作为默认编译引擎，原因如下：

- ✅ 原生支持 UTF-8 编码
- ✅ 直接使用系统字体
- ✅ 更好的中文支持
- ✅ 支持现代 OpenType 字体

### 文件忽略规则

`.gitignore` 已配置为 TeX 标准忽略规则，会自动忽略所有中间文件：

- `*.aux`, `*.log`, `*.out` 等辅助文件
- `*.synctex.gz` 同步文件
- 编译过程中的临时文件

**PDF 文件不会被忽略**，可以提交到仓库中。

## ❓ 常见问题

### Q1: 编译时出现中文乱码怎么办？

**A:** 确保你的 `.tex` 文件使用 UTF-8 编码保存，并且使用 `xelatex` 编译（而非 `pdflatex`）。

### Q2: 如何添加自己的图片？

**A:** 
1. 将图片上传到 `examples/images/` 目录（或你自己创建的目录）
2. 在 LaTeX 中使用相对路径引用：
```latex
\includegraphics[width=0.8\textwidth]{images/my-image.png}
```

### Q3: 编译失败，如何查看错误？

**A:** 
- 查看编译输出的终端信息
- 查看生成的 `.log` 文件
- 在 VS Code 中，LaTeX Workshop 会在 **PROBLEMS** 面板显示错误

### Q4: Codespaces 使用时长有限制吗？

**A:** 
- GitHub 免费账户每月有 120 小时的 Codespaces 使用时间
- 如果不使用时，记得停止或删除 Codespace 以节省时间
- 在仓库页面的 Code → Codespaces 中管理

### Q5: 如何停止 Codespace？

**A:** 
1. 方法一：在 Codespaces 界面左下角点击绿色的 "Codespaces" 按钮，选择 "Stop Current Codespace"
2. 方法二：在 GitHub 仓库页面，Code → Codespaces → 点击三个点 → Stop codespace

### Q6: 可以安装额外的 LaTeX 包吗？

**A:** 可以。如果你需要额外的包：

1. 在终端中使用 `apk` 安装（临时）：
```bash
apk add texmf-dist-XXX
```

2. 或者修改 `Dockerfile` 添加包（永久），然后重建 Codespace

## 📚 学习资源

### LaTeX 入门

- [LaTeX 中文文档](https://github.com/CTeX-org/ctex-kit)
- [一份不太简短的 LaTeX 2ε 介绍](http://mirrors.ctan.org/info/lshort/chinese/lshort-zh-cn.pdf)
- [LaTeX Wikibook](https://en.wikibooks.org/wiki/LaTeX)

### 在线工具

- [Overleaf](https://www.overleaf.com/)：在线 LaTeX 编辑器（备选方案）
- [Detexify](http://detexify.kirelabs.org/classify.html)：手写识别 LaTeX 符号
- [Tables Generator](https://www.tablesgenerator.com/)：可视化表格生成

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

如果你有任何问题或建议，请：
1. 在 [Issues](../../issues) 页面提出
2. 或直接提交 Pull Request

## 📄 许可证

本项目采用 MIT 许可证。详见 [LICENSE](LICENSE) 文件。

## 🙏 致谢

感谢以下开源项目：

- [TeX Live](https://www.tug.org/texlive/)
- [CTeX](https://github.com/CTeX-org/ctex-kit)
- [LaTeX Workshop](https://github.com/James-Yu/LaTeX-Workshop)
- [Alpine Linux](https://alpinelinux.org/)

---

**Happy LaTeXing! 🎉**

如有问题，欢迎在 Issues 中讨论！