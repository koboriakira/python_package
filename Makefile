.PHONY: help install install-dev test lint format type-check clean build docker-build docker-run pre-commit-install pre-commit-run

help:  ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

install:  ## Install package in production mode
	pip install -e .

install-dev:  ## Install package with development dependencies
	pip install -e ".[dev]"
	pre-commit install

test:  ## Run tests
	pytest

test-cov:  ## Run tests with coverage report
	pytest --cov=koboripackage --cov-report=term-missing --cov-report=html

lint:  ## Run linter
	ruff check .

lint-fix:  ## Run linter and fix issues
	ruff check --fix .

format:  ## Format code
	ruff format .

format-check:  ## Check code formatting
	ruff format --check .

type-check:  ## Run type checker
	mypy koboripackage

qa: lint-fix format type-check test  ## Run all quality assurance checks

pre-commit-install:  ## Install pre-commit hooks
	pre-commit install

pre-commit-run:  ## Run all pre-commit hooks
	pre-commit run --all-files

clean:  ## Clean build artifacts and cache
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	rm -rf .pytest_cache
	rm -rf .ruff_cache
	rm -rf .mypy_cache
	rm -rf htmlcov/
	rm -rf .coverage
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name '*.pyc' -delete
	find . -type f -name '*.pyo' -delete

build:  ## Build distribution packages
	python -m build

docker-build:  ## Build Docker image
	docker build -t koboripackage .

docker-run:  ## Run Docker container
	docker run -it koboripackage

docker-test:  ## Run tests in Docker container
	docker run koboripackage pytest

publish-test:  ## Upload to TestPyPI
	python -m twine upload --repository testpypi dist/*

publish:  ## Upload to PyPI
	python -m twine upload dist/*
