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
docker exec -it laravel-docker-compose_app_1 bash
```
##### Inside Container run:
```bash
php artisan key:generate
php artisan migrate
exit
```
#### 4. Access the application
#### http://localhost:8080
---
### Combined Code For Running The Application
```bash
git clone https://github.com/Anupam-Nepal/Laravel-nginx-mysql-docker-compose.git
cd Laravel-nginx-mysql-docker-compose
docker-compose up -d --build
docker exec -it laravel-docker-compose_app_1 bash
php artisan key:generate
php artisan migrate
exit
```
---
### Stopping the Application
```bash
docker-compose down
```

