FROM python:3.12-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

WORKDIR /work

# Copy project files
COPY pyproject.toml .
COPY setup.py .
COPY MANIFEST.in .
COPY requirements.txt .
COPY koboripackage koboripackage
COPY tests tests

# Install dependencies
RUN pip install --upgrade pip setuptools wheel && \
    pip install -e ".[dev]"

# Create non-root user for security
RUN useradd -m -u 1000 appuser && \
    chown -R appuser:appuser /work

USER appuser

CMD ["bash"]
