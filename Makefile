# Makefile for LaTeX compilation

# 默认目标文件
TARGET = examples/example.tex

# 编译器
LATEX = xelatex
LATEX_FLAGS = -interaction=nonstopmode -file-line-error

# 目标
.PHONY: all clean help example

# 默认目标
all: example

# 编译示例文档
example:
	@echo "编译示例文档..."
	cd examples && $(LATEX) $(LATEX_FLAGS) example.tex
	cd examples && $(LATEX) $(LATEX_FLAGS) example.tex
	@echo "完成! PDF 文件: examples/example.pdf"

# 清理辅助文件
clean:
	@echo "清理辅助文件..."
	find . -name "*.aux" -delete
	find . -name "*.log" -delete
	find . -name "*.out" -delete
	find . -name "*.toc" -delete
	find . -name "*.synctex.gz" -delete
	find . -name "*.fdb_latexmk" -delete
	find . -name "*.fls" -delete
	@echo "清理完成!"

# 完全清理（包括 PDF）
cleanall: clean
	@echo "清理所有生成的文件..."
	find . -name "*.pdf" -delete
	@echo "完全清理完成!"

# 帮助信息
help:
	@echo "LaTeX 编译 Makefile"
	@echo ""
	@echo "可用目标:"
	@echo "  make          - 编译示例文档 (默认)"
	@echo "  make example  - 编译示例文档"
	@echo "  make clean    - 清理辅助文件"
	@echo "  make cleanall - 清理所有生成的文件（包括PDF）"
	@echo "  make help     - 显示此帮助信息"
	@echo ""
	@echo "编译自定义文件:"
	@echo "  ./compile.sh your-file.tex"
