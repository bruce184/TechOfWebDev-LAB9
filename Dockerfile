# Base image: Node 18
FROM node:18-alpine

# Thư mục làm việc trong container
WORKDIR /app

# Copy file package để cài dependency
COPY package*.json ./

# Cài dependencies
RUN npm install

# Copy toàn bộ source còn lại vào container
COPY . .

# Chạy migrate + seed để tạo DB SQLite trong image
RUN npm run migrate && npm run seed

# Expose port (TRONG container)
EXPOSE 3000

# Lệnh khởi chạy app
CMD ["npm", "start"]
