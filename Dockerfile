# Sử dụng Python 3.9 bản nhẹ
FROM python:3.9-slim

# Thiết lập thư mục làm việc
WORKDIR /app

# Copy file requirements và cài đặt thư viện
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy toàn bộ mã nguồn (bao gồm cả thư mục static) vào container
COPY . .

# Mở port 8000
EXPOSE 8000

# Lệnh chạy ứng dụng khi container khởi động
# --host 0.0.0.0 là BẮT BUỘC để truy cập từ ngoài container
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]