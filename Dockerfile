# Temel Docker image
FROM python:3.11-slim

# Gerekli dosyaları kopyala
WORKDIR /app
COPY . /app/

# Bağımlılıkları yükle
RUN pip install --no-cache-dir -r requirements.txt

# Çevre değişkenlerini ayarla
ENV PYTHONUNBUFFERED 1

# Django için gerekli portu aç
EXPOSE 8000

# Uygulamanın çalıştırılacağı komut
CMD ["gunicorn", "aws_test.wsgi:application", "--bind", "0.0.0.0:8000"]
