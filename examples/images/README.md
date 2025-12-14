# 图片资源目录

将你的图片文件放在这里，然后在 LaTeX 文档中引用。

## 支持的图片格式

- PNG (.png) - 推荐用于截图和图表
- JPEG (.jpg, .jpeg) - 推荐用于照片
- PDF (.pdf) - 推荐用于矢量图
- EPS (.eps) - 传统 LaTeX 格式

## 使用示例

假设你有一个图片 `my-image.png` 在这个目录下：

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{images/my-image.png}
    \caption{我的图片}
    \label{fig:my-image}
\end{figure}
```

## 图片处理建议

- 分辨率：至少 300 DPI（用于打印）
- 格式：PNG（透明背景）或 JPEG（照片）
- 大小：控制在合理范围内，避免文件过大
- 命名：使用英文字母、数字和连字符，避免空格和特殊字符

## 在线工具

- [TinyPNG](https://tinypng.com/) - 压缩 PNG 图片
- [Convertio](https://convertio.co/) - 格式转换
- [draw.io](https://app.diagrams.net/) - 绘制流程图和图表
