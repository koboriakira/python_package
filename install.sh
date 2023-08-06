#!/bin/bash

# クローンして、ディレクトリに移動
git clone git@github.com:koboriakira/python_package.git
cd python_package

# リネーム処理
mv koboripackage hoge
mv ./hoge/koboripackage.py main.py
mv ./tests/test_koboripackage.py ./tests/test_main.py
sed -i -e "s/koboripackage/hoge/g" ./tests/test_main.py

# Dockerfileのkoboripackageをリネーム
sed -i -e "s/koboripackage/hoge/g" Dockerfile

# setup.pyのkoboripackageをリネーム
sed -i -e "s/koboripackage/hoge/g" setup.py
sed -i -e "s/python_package/hoge/g" setup.py
