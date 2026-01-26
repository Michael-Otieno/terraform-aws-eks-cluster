# Multi-arch Django User Management app Dockerfile
# Image will be built as motieno205/django-usermanagement:latest

# 1. Base image
FROM python:3.11-slim AS base

# 2. Environment
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    # Django settings
    DJANGO_SETTINGS_MODULE=usermanagement.settings \
    # Ensure we listen on all interfaces
    HOST=0.0.0.0 \
    PORT=8000

# 3. System deps
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
       curl \
       netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# 4. Workdir
WORKDIR /app

# 5. Python deps first (better caching)
# Expect a requirements.txt at the build context root.
COPY requirements.txt ./
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# 6. Copy application source
COPY . .

# 7. Non-root user
RUN useradd -m appuser \
    && chown -R appuser:appuser /app
USER appuser

# 8. Expose port
EXPOSE 8000

# 9. Default command
# If you use a different settings module or WSGI module, adjust the command accordingly.
CMD ["gunicorn", "usermanagement.wsgi:application", "--bind", "0.0.0.0:8000"]
