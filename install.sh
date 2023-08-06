#!/bin/bash
VERSION="1.0.1"

echo "Please enter a project name:"
read PROJECT_NAME
PROJECT_NAME_WITHOUT_HYPHEN=${PROJECT_NAME//-/_}

# ダウンロードして解凍する
wget https://github.com/koboriakira/python_package/archive/refs/tags/v$VERSION.zip
unzip v$VERSION.zip
mv python_package-$VERSION $PROJECT_NAME
cd $PROJECT_NAME

# ディレクトリを変更
mv koboripackage $PROJECT_NAME_WITHOUT_HYPHEN

# ./tests/test_main.py
sed -i -e "s/koboripackage/$PROJECT_NAME_WITHOUT_HYPHEN/g" ./tests/test_main.py
rm -f ./tests/test_main.py-e

# Dockerfile
sed -i -e "s/koboripackage/$PROJECT_NAME_WITHOUT_HYPHEN/g" Dockerfile
rm -f Dockerfile-e

# setup.py
sed -i -e "s/name=\"koboripackage\"/name=\"$PROJECT_NAME\"/g" setup.py
sed -i -e "s/python_package/$PROJECT_NAME_WITHOUT_HYPHEN/g" setup.py
sed -i -e "s/koboripackage = koboripackage.cli:execute/$PROJECT_NAME = $PROJECT_NAME_WITHOUT_HYPHEN.cli:execute/g" setup.py
rm -f setup.py-e

# .gitignore
sed -i -e "s/koboripackage/$PROJECT_NAME/g" .gitignore
rm -f .gitignore-e
