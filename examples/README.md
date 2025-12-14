# 示例文档说明

本目录包含 LaTeX 中文学术论文的示例文档和资源。

## 文件说明

- **example.tex** - 完整的中文学术论文示例，包含：
  - 中文排版基础
  - 数学公式（行内和行间）
  - 图片插入
  - 表格制作
  - 定理和证明环境
  - 参考文献

- **images/** - 图片资源目录
  - 将你的图片文件（.png, .jpg, .pdf 等）放在这里
  - 在 LaTeX 中使用相对路径引用

## 快速开始

### 编译示例文档

```bash
# 方法 1：使用 make（从项目根目录）
cd ..
make

# 方法 2：使用编译脚本
cd ..
./compile.sh examples/example.tex

# 方法 3：直接使用 xelatex
cd examples
xelatex example.tex
xelatex example.tex  # 运行两次以更新交叉引用
```

### 创建你自己的文档

1. 复制 `example.tex` 作为模板：
```bash
cp example.tex my-paper.tex
```

2. 编辑 `my-paper.tex`

3. 编译：
```bash
cd ..
./compile.sh examples/my-paper.tex
```

## 常用 LaTeX 模式

### 插入图片

将图片放入 `images/` 目录，然后：

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{images/your-image.png}
    \caption{图片说明}
    \label{fig:your-label}
\end{figure}
```

引用图片：`如图~\ref{fig:your-label}~所示`

### 制作表格

```latex
\begin{table}[htbp]
    \centering
    \caption{表格标题}
    \label{tab:your-label}
    \begin{tabular}{lcc}
        \toprule
        \textbf{列1} & \textbf{列2} & \textbf{列3} \\
        \midrule
        数据1 & 数据2 & 数据3 \\
        数据4 & 数据5 & 数据6 \\
        \bottomrule
    \end{tabular}
\end{table}
```

### 数学公式

行内公式：`$E = mc^2$`

行间公式：
```latex
\begin{equation}
    \int_0^1 f(x) dx = F(1) - F(0)
\end{equation}
```

多行对齐：
```latex
\begin{align}
    f(x) &= x^2 + 2x + 1 \\
         &= (x + 1)^2
\end{align}
```

### 章节结构

```latex
\section{一级标题}
\subsection{二级标题}
\subsubsection{三级标题}
```

### 列表

无序列表：
```latex
\begin{itemize}
    \item 第一项
    \item 第二项
\end{itemize}
```

有序列表：
```latex
\begin{enumerate}
    \item 第一项
    \item 第二项
\end{enumerate}
```

### 引用

1. 为元素添加标签：
```latex
\section{引言}\label{sec:intro}
\begin{equation}\label{eq:euler}
    e^{i\pi} + 1 = 0
\end{equation}
```

2. 引用：
```latex
在第~\ref{sec:intro}~节中...
根据公式~\eqref{eq:euler}...
```

## 技巧和建议

### 文件组织

对于大型文档，建议拆分成多个文件：

```latex
% main.tex
\documentclass{article}
\usepackage{ctex}

\begin{document}
\input{chapters/intro}
\input{chapters/methods}
\input{chapters/results}
\end{document}
```

### 注释

使用 `%` 添加注释：
```latex
% 这是注释，不会显示在 PDF 中
这是正文内容
```

### 特殊字符转义

这些字符需要转义：
- `\%` 显示 %
- `\&` 显示 &
- `\_` 显示 _
- `\$` 显示 $
- `\{` `\}` 显示 { }

### 空格和换行

- 多个空格 = 一个空格
- 一个空行 = 段落分隔
- 强制换行：`\\` 或 `\newline`
- 不换行空格：`~`

## 更多资源

- [LaTeX 中文文档](https://github.com/CTeX-org/ctex-kit)
- [一份不太简短的 LaTeX 介绍](http://mirrors.ctan.org/info/lshort/chinese/lshort-zh-cn.pdf)
- [LaTeX 数学公式参考](https://en.wikibooks.org/wiki/LaTeX/Mathematics)
- [Tables Generator](https://www.tablesgenerator.com/) - 可视化表格生成工具

## 需要帮助？

- 查看主 [README.md](../README.md) 了解完整文档
- 查看 [QUICKSTART.md](../QUICKSTART.md) 了解快速入门
- 在 GitHub Issues 中提问

Happy LaTeXing! 📝✨
