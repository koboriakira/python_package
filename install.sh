#!/bin/bash

PROJECT_NAME=$1
PROJECT_NAME_WITHOUT_HYPHEN=${PROJECT_NAME//-/_}


# クローンして、ディレクトリに移動
# git clone git@github.com:koboriakira/python_package.git $PROJECT_NAME
# cd $PROJECT_NAME

# リネーム処理
mv koboripackage $PROJECT_NAME_WITHOUT_HYPHEN
sed -i -e "s/koboripackage/$PROJECT_NAME_WITHOUT_HYPHEN/g" ./tests/test_main.py

# Dockerfile
sed -i -e "s/koboripackage/$PROJECT_NAME_WITHOUT_HYPHEN/g" Dockerfile

# setup.py
sed -i -e "s/name=\"koboripackage\"/name=\"$PROJECT_NAME\"/g" setup.py
sed -i -e "s/python_package/$PROJECT_NAME_WITHOUT_HYPHEN/g" setup.py
sed -i -e "s/koboripackage = koboripackage.cli:execute/$PROJECT_NAME = $PROJECT_NAME_WITHOUT_HYPHEN.cli:execute/g" setup.py

# .gitignore
sed -i -e "s/koboripackage/$PROJECT_NAME/g" .gitignore
