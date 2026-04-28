
FROM python:3.11-slim AS builder

WORKDIR /app


COPY requirements.txt .

# install dependencies
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt


#stage2
FROM python:3.11-slim

WORKDIR /app

# Copy installed dependencies from builder stage
COPY --from=builder /install /usr/local

# Copy only required app file
COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]