FROM python:3.9-slim

WORKDIR /app

# 安装基础依赖
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# 复制当前仓库内容（GitHub Action 会自动 Checkout）
COPY . .

# 安装依赖
RUN pip install --no-cache-dir protobuf

EXPOSE 5566/tcp 5566/udp

CMD ["python", "server.py"]
