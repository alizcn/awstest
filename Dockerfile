FROM python:3.11-slim

# Sistem bağımlılıklarını yükle (Django ve SQLite için gerekli olmayan bağımlılıklar hariç)
RUN apt-get update && apt-get install -y \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Çalışma dizinini ayarla
WORKDIR /app

# Gereksinimler dosyasını konteynıra kopyala
COPY requirements.txt .

# Python bağımlılıklarını yükle
RUN pip install --no-cache-dir -r requirements.txt

# Uygulama kodunun geri kalanını kopyala
COPY . .

# Django uygulamasını çalıştır
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
