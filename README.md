# koboripackage

[![CI](https://github.com/koboriakira/python_package/actions/workflows/ci.yml/badge.svg)](https://github.com/koboriakira/python_package/actions/workflows/ci.yml)
[![Python Version](https://img.shields.io/badge/python-3.11%2B-blue.svg)](https://www.python.org/downloads/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**最新のPython開発のベストプラクティスに基づいたモダンなパッケージテンプレート**

Pythonのディレクトリ構成のベストプラクティスを考えるため、つくったリポジトリです。
これをプロジェクトのテンプレートとすることができます。

具体的な作成手順や背景は、次のQiitaにまとめています：
https://qiita.com/kobori_akira/items/aa42790354654debb655

## ✨ 特徴

- 📦 **pyproject.toml**: PEP 621準拠の最新設定形式
- 🎨 **Ruff**: 高速なlinter & formatter
- 🔍 **mypy**: 型チェック
- ✅ **pytest**: テストフレームワークとカバレッジ
- 🪝 **pre-commit**: コミット前の自動チェック
- 🚀 **GitHub Actions**: CI/CD自動化
- 🐳 **Docker**: Python 3.12ベースのコンテナ
- 📝 **型ヒント**: 完全な型アノテーション

## 📋 要件

- Python 3.11以上

## 📦 インストール

PyPIからインストール：

```bash
pip install koboripackage
```

開発環境のセットアップ：

```bash
# リポジトリのクローン
git clone https://github.com/koboriakira/python_package.git
cd python_package

# 開発用依存関係を含めてインストール
pip install -e ".[dev]"

# または
pip install -r requirements-dev.txt
```

## 🚀 使い方

### CLIコマンド

```bash
koboripackage
```

### Pythonコードから

```python
from koboripackage import main

# 挨拶を表示
main.hello("World")

# 数値の掛け算
result = main.multiply(3, 4)
print(result)  # 12
```

## 🛠️ 開発

### セットアップ

```bash
# pre-commitフックのインストール
pre-commit install

# テストの実行
pytest

# カバレッジ付きテストの実行
pytest --cov=koboripackage --cov-report=html
```

### コード品質チェック

```bash
# Ruffでlint
ruff check .

# Ruffでformat
ruff format .

# mypyで型チェック
mypy koboripackage

# すべてのpre-commitフックを実行
pre-commit run --all-files
```

### Dockerでの開発

```bash
# イメージのビルド
docker build -t koboripackage .

# コンテナの起動
docker run -it koboripackage

# テストの実行
docker run koboripackage pytest
```

## 📁 プロジェクト構造

```
python_package/
├── .github/
│   └── workflows/
│       └── ci.yml              # GitHub Actions CI/CD
├── koboripackage/              # メインパッケージ
│   ├── __init__.py
│   ├── main.py                 # コア機能
│   └── cli.py                  # CLIエントリーポイント
├── tests/                      # テストディレクトリ
│   ├── __init__.py
│   └── test_main.py
├── .pre-commit-config.yaml     # pre-commit設定
├── pyproject.toml              # プロジェクト設定
├── setup.py                    # setuptools互換設定
├── requirements.txt            # 本番依存関係
├── requirements-dev.txt        # 開発依存関係
├── Dockerfile                  # Docker設定
├── .gitignore
└── README.md
```

## 🧪 テスト

```bash
# 全テストの実行
pytest

# カバレッジレポート付き
pytest --cov=koboripackage --cov-report=term-missing

# 特定のテストファイルを実行
pytest tests/test_main.py
```

## 📝 ライセンス

MIT License

## 🤝 コントリビューション

指摘や質問は、Qiita経由またプルリクエストをいただければ幸いです。

1. このリポジトリをフォーク
2. フィーチャーブランチを作成 (`git checkout -b feature/amazing-feature`)
3. 変更をコミット (`git commit -m 'Add some amazing feature'`)
4. ブランチにプッシュ (`git push origin feature/amazing-feature`)
5. プルリクエストを作成

## 📚 参考リンク

- [PEP 621 – Storing project metadata in pyproject.toml](https://peps.python.org/pep-0621/)
- [Ruff Documentation](https://docs.astral.sh/ruff/)
- [mypy Documentation](https://mypy.readthedocs.io/)
- [pytest Documentation](https://docs.pytest.org/)
- [pre-commit Documentation](https://pre-commit.com/)
