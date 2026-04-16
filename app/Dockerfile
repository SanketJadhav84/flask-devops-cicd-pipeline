# ---------- Stage 1: Builder ----------
FROM python:3.11-slim AS builder

WORKDIR /app

# Copy only requirements first (for caching)
COPY requirements.txt .

# Install dependencies into a custom folder
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt


# ---------- Stage 2: Final ----------
FROM python:3.11-slim

WORKDIR /app

# Copy installed dependencies from builder stage
COPY --from=builder /install /usr/local

# Copy only required app file
COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]