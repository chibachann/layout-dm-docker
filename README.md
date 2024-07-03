# 実行環境の作り方

## Docker コンテナを作る
このプロジェクトのルートディレクトリでdockerコンテナを作るコマンドを打つ。それが以下のdocker-composeコマンド。
```
docker-compose up -d --build
```

## コンテナに入る
作ったコンテナに入っていきます。
```
docker-compose run  pytorch_env bash
```

## 指定ライブラリのインストール
このプロジェクトはpoetryでバージョン管理されているのでそれを活用する。以下のコマンドでpoetryを使用したライブラリのインストールを行う。
```
poetry install
```

次に指定のリソースをダウンロードし、解凍を行うコマンドを以下のように実行する。
```
wget https://github.com/CyberAgentAILab/layout-dm/releases/download/v1.0.0/layoutdm_starter.zip
unzip layoutdm_starter.zip
```

成功すればプロジェクトに`download/`ができ、その配下に次のような構造でダウンロードされている。
```
download
- clustering_weights
- datasets
- fid_weights
- pretrained_weights
```
ここまできたら一旦ターミナルは放置。**閉じないでね！！！**

## VS Codeを使ってコンテナにアタッチする

VS Codeでコンテナにアタッチ（接続）しよう。
VS Code左下に雷マークみたいな青のボタンがあるのでクリック。
`Attach to Running Container...`を選択して実行中のコンテナにアタッチしましょう。


## poetry の仮想環境を立ち上げる
ここからはまたターミナルでの作業。poetryの仮想環境を立ち上げないと先程poetryでインストールしたライブラリを使えないのでpoetry 仮想環境立ち上げましょう。今回はpoetry 仮想環境での立ち上げなのでshellを起動する。
```
poetry shell
```
このあと、VS Codeで作業できるようにPoetry仮想環境のパスを確認します。通常は以下のコマンドで確認できます：
```
poetry env info --path
```

## アタッチしたVS Code の実行環境をpoetry仮想環境にセッティングする
またVS Codeに戻ります。

コマンドパレット（Ctrl+Shift+P）を開きます。
- Python: Select Interpreter" を選択します。
- Enter interpreter path..." を選択します。
- 先ほど確認したPoetry仮想環境のパスに "/bin/python" を追加したものを入力します。
例: /root/.cache/pypoetry/virtualenvs/trainer-9TtSrW0h-py3.7

これでdemo実行できるはず。

