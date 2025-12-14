#!/bin/bash

# LaTeX 编译脚本
# 用法: ./compile.sh <文件名.tex>

set -e

if [ -z "$1" ]; then
    echo "错误: 请提供 .tex 文件名"
    echo "用法: ./compile.sh <文件名.tex>"
    echo "示例: ./compile.sh examples/example.tex"
    exit 1
fi

TEXFILE="$1"

if [ ! -f "$TEXFILE" ]; then
    echo "错误: 文件 '$TEXFILE' 不存在"
    exit 1
fi

echo "================================================"
echo "开始编译: $TEXFILE"
echo "================================================"

# 第一次编译
echo "第一次编译..."
xelatex -interaction=nonstopmode "$TEXFILE"

# 第二次编译（用于更新交叉引用）
echo ""
echo "第二次编译（更新交叉引用）..."
xelatex -interaction=nonstopmode "$TEXFILE"

echo ""
echo "================================================"
echo "编译完成!"
echo "================================================"

# 获取 PDF 文件名
PDFFILE="${TEXFILE%.tex}.pdf"

if [ -f "$PDFFILE" ]; then
    echo "PDF 文件已生成: $PDFFILE"
    echo "文件大小: $(du -h "$PDFFILE" | cut -f1)"
else
    echo "警告: PDF 文件未生成，请检查编译日志"
    exit 1
fi
