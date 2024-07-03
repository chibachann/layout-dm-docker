FROM nvcr.io/nvidia/cuda:11.3.1-cudnn8-runtime-ubuntu20.04

# 環境変数の設定
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    software-properties-common \
    curl \
    wget \
    unzip \
    git \
    fonts-liberation \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y \
    python3.7 \
    python3.7-dev \
    python3.7-distutils \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Python 3.7をデフォルトに設定
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1
RUN update-alternatives --set python3 /usr/bin/python3.7

# pipのアップグレードと必要なパッケージのインストール
RUN python3 -m pip install --upgrade pip setuptools wheel

# Poetry 1.3.0のインストール
RUN pip3 install poetry==1.3.0

# パスを通す
ENV PATH="/root/.local/bin:$PATH"

# 作業ディレクトリの設定
WORKDIR /app

# pyproject.tomlとpoetry.lockをコピー
COPY pyproject.toml poetry.lock* ./

# 依存関係のインストール
# RUN poetry install

# エントリーポイントの設定
CMD ["/bin/bash"]