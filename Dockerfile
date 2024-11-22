# Python image'ını temel al
FROM python:3.11-slim

# Çalışma dizinini oluştur ve ayarla
WORKDIR /app

# Gerekli paketlerin yüklenmesi için bağımlılık dosyasını kopyala
COPY requirements.txt .

# Gerekli Python paketlerini yükle
RUN pip install --no-cache-dir -r requirements.txt

# Tüm proje dosyalarını kopyala
COPY . .

# Django uygulamasını başlat
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
