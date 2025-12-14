# 故障排除指南 🔧

遇到问题了？不要慌！这里有常见问题的解决方案。

## 环境问题

### ❌ Codespace 启动失败

**症状**：点击"Create codespace"后长时间无响应或报错

**解决方案**：
1. 检查 GitHub 状态：访问 [GitHub Status](https://www.githubstatus.com/)
2. 刷新页面重试
3. 尝试删除现有 Codespace 并创建新的
4. 检查你的 GitHub 账户是否有剩余的 Codespace 配额

### ❌ Docker 镜像构建失败

**症状**：环境启动时显示 Docker build 错误

**解决方案**：
1. 检查 `Dockerfile` 是否有语法错误
2. 查看构建日志，找到具体错误信息
3. 可能是网络问题导致包下载失败，重试即可
4. 检查 Alpine 镜像源是否可用

### ❌ VS Code 扩展未安装

**症状**：没有看到 LaTeX Workshop 扩展

**解决方案**：
1. 检查 `.devcontainer/devcontainer.json` 配置
2. 手动安装：点击左侧扩展图标，搜索 "LaTeX Workshop"，点击安装
3. 重建容器：命令面板 → "Rebuild Container"

## 编译问题

### ❌ 编译失败：找不到 xelatex 命令

**症状**：
```
bash: xelatex: command not found
```

**解决方案**：
1. 确保 Docker 容器已正确构建
2. 检查 TeX Live 是否已安装：
   ```bash
   which xelatex
   apk info texlive
   ```
3. 如果未安装，手动安装：
   ```bash
   apk add texlive
   ```

### ❌ 编译失败：中文乱码

**症状**：PDF 中中文显示为方框或乱码

**原因分析**：
- 使用了 `pdflatex` 而不是 `xelatex`
- 文件编码不是 UTF-8
- 缺少 `\usepackage{ctex}`

**解决方案**：
1. 确保使用 `xelatex` 编译：
   ```bash
   xelatex your-file.tex  # 正确 ✅
   pdflatex your-file.tex  # 错误 ❌（不支持中文）
   ```

2. 检查文件编码：
   - 在 VS Code 中，右下角显示编码
   - 如果不是 UTF-8，点击编码名称 → "Save with Encoding" → 选择 UTF-8

3. 确保文档包含：
   ```latex
   \usepackage{ctex}
   ```

### ❌ 编译错误：Undefined control sequence

**症状**：
```
! Undefined control sequence.
l.10 \somecommand
```

**原因**：使用了未定义的命令或缺少宏包

**解决方案**：
1. 检查命令拼写是否正确
2. 确保已加载相应的宏包：
   - 数学符号 → `\usepackage{amsmath}`
   - 图片 → `\usepackage{graphicx}`
   - 表格 → `\usepackage{booktabs}`
3. 查看错误行号（`l.10` 表示第 10 行）
4. 注释掉问题代码，逐步调试

### ❌ 图片不显示

**症状**：编译成功但 PDF 中没有图片

**解决方案**：
1. 检查图片路径是否正确：
   ```latex
   % 正确 ✅
   \includegraphics{images/my-image.png}
   
   % 错误 ❌（绝对路径）
   \includegraphics{/home/user/images/my-image.png}
   ```

2. 确保图片文件存在：
   ```bash
   ls -lh examples/images/
   ```

3. 检查图片格式是否支持（PNG, JPG, PDF, EPS）

4. 尝试使用完整的相对路径：
   ```latex
   \includegraphics[width=0.8\textwidth]{./images/my-image.png}
   ```

### ❌ 参考文献编译错误

**症状**：引用显示为 `[?]` 或编译警告

**解决方案**：
1. 多次编译（通常需要 2-3 次）：
   ```bash
   xelatex your-file.tex
   bibtex your-file      # 如果使用 BibTeX
   xelatex your-file.tex
   xelatex your-file.tex
   ```

2. 或使用编译脚本（已包含两次编译）：
   ```bash
   ./compile.sh your-file.tex
   ```

### ❌ 交叉引用错误

**症状**：`\ref{}` 显示为 `??`

**解决方案**：
1. 确保已定义标签：
   ```latex
   \section{引言}\label{sec:intro}  % 定义
   参见第~\ref{sec:intro}~节       % 引用
   ```

2. 编译两次以更新引用：
   ```bash
   xelatex your-file.tex
   xelatex your-file.tex  # 第二次更新引用
   ```

## LaTeX Workshop 问题

### ❌ 自动编译不工作

**症状**：保存文件后不自动编译

**解决方案**：
1. 检查设置：`.vscode/settings.json` 中：
   ```json
   "latex-workshop.latex.autoBuild.run": "onSave"
   ```

2. 手动触发编译：`Ctrl+Alt+B`（Windows/Linux）或 `Cmd+Alt+B`（Mac）

3. 检查输出面板中的错误信息

### ❌ PDF 预览不显示

**症状**：点击预览按钮没有反应

**解决方案**：
1. 确保 PDF 已生成（检查文件浏览器）
2. 尝试手动打开 PDF：右键 → Open With → PDF Viewer
3. 刷新 VS Code：命令面板 → "Reload Window"
4. 检查浏览器是否阻止了弹出窗口

### ❌ SyncTeX 跳转不工作

**症状**：无法在源代码和 PDF 之间跳转

**解决方案**：
1. 确保使用了 `-synctex=1` 参数编译
2. 检查是否生成了 `.synctex.gz` 文件
3. 重新编译文档
4. 尝试手动跳转：`Ctrl+Alt+J`

## 文件和存储问题

### ❌ 找不到生成的 PDF

**症状**：编译成功但找不到 PDF 文件

**解决方案**：
1. PDF 生成在与 `.tex` 相同的目录
2. 刷新文件浏览器（点击刷新按钮）
3. 使用命令查找：
   ```bash
   find . -name "*.pdf"
   ```

### ❌ 无法下载文件

**症状**：右键下载选项不可用

**解决方案**：
1. 确保文件已保存
2. 尝试从菜单栏：File → Download
3. 使用 VS Code 的内置终端复制：
   ```bash
   cat your-file.pdf | base64
   ```
   然后在本地解码

### ❌ 更改未保存

**症状**：重启 Codespace 后更改丢失

**解决方案**：
1. 确保文件已保存（文件标签页无圆点）
2. 提交到 Git：
   ```bash
   git add .
   git commit -m "保存更改"
   git push
   ```

3. 检查自动保存设置：`.vscode/settings.json`
   ```json
   "files.autoSave": "afterDelay"
   ```

## Git 和版本控制问题

### ❌ 推送失败：权限被拒绝

**症状**：
```
Permission denied (publickey)
```

**解决方案**：
1. 在 Codespace 中，Git 认证应该是自动的
2. 检查仓库是否是你 fork 的
3. 确认你有仓库的写权限

### ❌ 中间文件被提交

**症状**：`.aux`, `.log` 等文件出现在 Git 中

**解决方案**：
1. 确保 `.gitignore` 存在且正确
2. 移除已跟踪的中间文件：
   ```bash
   git rm --cached *.aux *.log *.out
   git commit -m "移除中间文件"
   ```

3. 清理工作区：
   ```bash
   make clean
   ```

## 性能问题

### ❌ 编译速度慢

**症状**：编译耗时很长

**解决方案**：
1. 大型文档首次编译会较慢，这是正常的
2. 注释掉不必要的宏包
3. 使用增量编译（修改后只编译一次）
4. 考虑拆分大文档为多个文件

### ❌ Codespace 响应慢

**症状**：操作延迟明显

**解决方案**：
1. 检查网络连接
2. 关闭不必要的标签页和扩展
3. 重启 Codespace
4. 考虑升级到更大的实例（收费）

## 其他问题

### ❌ 特殊字符显示错误

**症状**：`%`, `$`, `&` 等字符无法正常显示

**解决方案**：
这些是 LaTeX 的特殊字符，需要转义：
```latex
\%    % 百分号
\$    % 美元符
\&    % 与符号
\_    % 下划线
\{    % 左花括号
\}    % 右花括号
\#    % 井号
```

### ❌ 数学公式编译错误

**症状**：数学环境中出现错误

**解决方案**：
1. 确保加载了 `amsmath` 包：
   ```latex
   \usepackage{amsmath}
   ```

2. 检查括号是否配对：
   ```latex
   \left( ... \right)
   \left[ ... \right]
   ```

3. 分数、上下标语法：
   ```latex
   \frac{分子}{分母}
   x^{上标}
   x_{下标}
   ```

## 获取帮助

如果以上方法都无法解决你的问题：

1. 📖 查看 [完整文档](README.md)
2. 💡 查看 [快速开始指南](QUICKSTART.md)
3. 🔍 搜索 [LaTeX Stack Exchange](https://tex.stackexchange.com/)
4. 💬 在 GitHub Issues 中提问
5. 📚 参考 [LaTeX 官方文档](https://www.latex-project.org/help/documentation/)

## 调试技巧

### 启用详细日志

编译时添加 `-verbose` 选项：
```bash
xelatex -interaction=nonstopmode -verbose your-file.tex
```

### 查看完整日志

```bash
cat your-file.log | less
```

### 逐步排查

1. 从最小示例开始：
   ```latex
   \documentclass{article}
   \usepackage{ctex}
   \begin{document}
   测试
   \end{document}
   ```

2. 逐步添加内容，找出问题所在

3. 注释掉可疑部分：
   ```latex
   % \includegraphics{...}  % 暂时注释
   ```

## 预防措施

为了避免问题：

✅ 定期保存和提交代码
✅ 编写代码前先看示例
✅ 使用版本控制（Git）
✅ 保持文件结构清晰
✅ 及时清理中间文件
✅ 备份重要文件

---

**还有问题？** 欢迎在 [Issues](../../issues) 中提出！我们会持续更新这个指南。
