from setuptools import setup, find_packages

setup(
    name="koboripackage",
    version='1.0',
    description='',
    author='',
    author_email='',
    url='https://github.com/koboriakira/python_package',
    packages=find_packages(),
    entry_points="""
      [console_scripts]
      koboripackage = koboripackage.cli:execute
    """,
    install_requires=open('requirements.txt').read().splitlines(),
    # license='MIT',
)
