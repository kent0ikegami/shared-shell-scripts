# shared-shell-scripts

## 使い方

- サーバに任意のスクリプトを設置してください。
- 自分だけに実行権限を付与してください。

```bash
chmod 700 hoge.sh
```

- スクリプトを実行してください。

```bash
./hoge.sh
```

- 使用後はスクリプトファイルを削除してください。

```bash
rm hoge.sh
```

## スクリプト一覧

- getAllDirAndFiles.sh
  - 指定した複数のディレクトリ以下のディレクトリ・ファイルの一覧を取得します。
  - 再起的に取得します。

```sh
./getAllDirAndFiles.sh
drwxr-xr-x,5,root,root,160,2024-06-02 14:03:22,/workspace/hoge/seeds
-rw-r--r--,1,root,root,1,2024-06-02 14:03:22,/workspace/hoge/seeds/__init__.py
drwxr-xr-x,8,root,root,256,2024-06-04 04:45:40,/workspace/hoge/seeds/__pycache__
...
```