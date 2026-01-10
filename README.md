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
### Quick Setup
#### Run these commands to install and run the application
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
### Explanation
#### 1. Cloning the repository:
```bash
git clone https://github.com/Anupam-Nepal/Laravel-nginx-mysql-docker-compose.git
```
Used for downloading the Laravel Application from Github to local machine.

#### 2. Navigating to the project directory
```bash
cd Laravel-nginx-mysql-docker-compose
```
Navigating to the project directory where the future commands can be implemented.

#### 3. Start the application using Docker Compose
```bash
docker-compose up -d --build
```
This command builds if Docker Images (if needed) and runs all the containers defined in docker-compose.yml files.
This sets up the Laravel App, MySQL Database and NGINX Server.

#### 4. Run Laravel setup commands
```bash
docker-compose exec app sh -c "cp .env.example .env"
```
Used for copying the example environment file to .env
```bash
docker-compose exec app sh -c "touch database/database.sqlite && chown www-data:www-data database/database.sqlite && chmod 664 database/database.sqlite"
```
Creates SQLite database where Laravel can write it.
```bash
docker-compose exec app sh -c "composer install"
docker-compose exec app sh -c "php artisan key:generate"
docker-compose exec app sh -c "php artisan migrate"
docker-compose exec app sh -c "chown -R www-data:www-data storage bootstrap/cache database && chmod -R 775 storage bootstrap/cache database"
```
These commands are used for installing all PHP Dependencies and for storing cache and logs.
#### 5. Access the application
#### http://localhost:8080
###### You can access the default Laravel Application running through the expose port 8080 of local machine.
---
### Stopping the Application
```bash
docker-compose down
```
This command is used for stopping the service.

---

### New Things I Learned
1. Laravel Environment Setup : First time setting up the laravel environment.
2. Docker-compose : Used for running multiple containers (**Containers are isolated but are designed to communicate**).
3. Linux Ownership and Permission Commands (chown & chmod).
4. Slight Idea of actual working of applications.
5. Composer in PHP : Dependency Management Tool for PHP. (Like pip for Python).
---
### Difficulties I Encountered
1. Missing .env file when cloning from the central repo (github).
2. Incorrect ordering due to dependencies in PHP.
3. Read-only Database Error.
4. Database Not Found.
5. Problems related to PHP-FPM.
6. Storage & Bootstrap/cache not having correct permissions and ownerships.

