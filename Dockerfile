FROM python:3.11-slim
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 PIP_NO_CACHE_DIR=1 BASE_PATH=/data
WORKDIR /app
RUN apt-get update && apt-get install -y --no-install-recommends nodejs npm php-cli php-curl composer \
    && rm -rf /var/lib/apt/lists/*
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY panel.py ./panel.py
COPY sandbox_runner.py ./sandbox_runner.py
EXPOSE 8080
CMD ["python", "panel.py"]
