# Laravel Application with Nginx & MySQL (Docker Compose)

**GitHub Repository:**  
https://github.com/Anupam-Nepal/Laravel-nginx-mysql-docker-compose

This repository contains a **Laravel application** running containers **Nginx** and **MySQL** using **docker-compose**.

Instead of installing PHP, Composer, MySQL, and other dependencies locally, this setup uses Docker to provide a clean, consistent, and reproducible development environment.

---

## 🛠 Prerequisites

### 1. Install Docker

```bash
sudo apt update
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
```
### 2. Install Docker Compose

```bash
sudo apt install -y docker-compose
```
### 3. Verify Installation

```bash
docker --version
docker-compose --version
```
---
###  Why Docker Instead of Local PHP

Laravel applications require specific PHP versions and extensions. Installing PHP locally can result in:

      PHP version compatibility issues

     Composer platform dependency errors

     Conflicts with existing system configurations

By using Docker:

    ✔ The host system remains clean

    ✔ The environment is consistent across all machines

    ✔ No local installation of PHP, Composer, MySQL, or Nginx is required

---

---
### Running the Application
#### 1. Clone the repository:
```bash
git clone https://github.com/Anupam-Nepal/Laravel-nginx-mysql-docker-compose.git
```
#### 2. Navigate to the project directory
```bash
cd Laravel-nginx-mysql-docker-compose
```
#### 3. Start the application using Docker Compose
```bash
docker-compose up -d --build
```
#### 4. Run Laravel setup commands
```bash
docker-compose exec app sh -c "cp .env.example .env"
docker-compose exec app sh -c "touch database/database.sqlite && chown www-data:www-data database/database.sqlite && chmod 664 database/database.sqlite"
docker-compose exec app sh -c "composer install"
docker-compose exec app sh -c "php artisan key:generate"
docker-compose exec app sh -c "php artisan migrate"
docker-compose exec app sh -c "chown -R www-data:www-data storage bootstrap/cache database && chmod -R 775 storage bootstrap/cache database"
```
#### 5. Access the application
#### http://localhost:8080
---
### Combined Code For Running The Application
```bash
git clone https://github.com/Anupam-Nepal/Laravel-nginx-mysql-docker-compose.git
cd Laravel-nginx-mysql-docker-compose
docker-compose up -d --build
docker-compose exec app sh -c "cp .env.example .env"
docker-compose exec app sh -c "touch database/database.sqlite && chown www-data:www-data database/database.sqlite && chmod 664 database/database.sqlite"
docker-compose exec app sh -c "composer install"
docker-compose exec app sh -c "php artisan key:generate"
docker-compose exec app sh -c "php artisan migrate"
docker-compose exec app sh -c "chown -R www-data:www-data storage bootstrap/cache database && chmod -R 775 storage bootstrap/cache database"
```
---
### Stopping the Application
```bash
docker-compose down
```

