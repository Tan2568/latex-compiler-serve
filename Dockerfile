# 基于 Alpine Linux 的轻量级 LaTeX 编译环境
FROM alpine:latest

# 设置工作目录
WORKDIR /workspace

# 安装必要的包
RUN apk add --no-cache \
    texlive \
    texmf-dist-latexextra \
    texmf-dist-fontsextra \
    texmf-dist-langchinese \
    texmf-dist-pictures \
    texmf-dist-science \
    make \
    perl \
    wget \
    bash \
    git

# 创建编译脚本
RUN echo '#!/bin/bash' > /usr/local/bin/compile-latex && \
    echo 'if [ -z "$1" ]; then' >> /usr/local/bin/compile-latex && \
    echo '  echo "用法: compile-latex <文件名.tex>"' >> /usr/local/bin/compile-latex && \
    echo '  exit 1' >> /usr/local/bin/compile-latex && \
    echo 'fi' >> /usr/local/bin/compile-latex && \
    echo 'xelatex -interaction=nonstopmode "$1"' >> /usr/local/bin/compile-latex && \
    echo 'xelatex -interaction=nonstopmode "$1"' >> /usr/local/bin/compile-latex && \
    chmod +x /usr/local/bin/compile-latex

# 设置环境变量
ENV LANG=C.UTF-8

CMD ["/bin/bash"]
