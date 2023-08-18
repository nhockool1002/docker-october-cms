
# Docker October CMS Pack

👑 Hello there, this is Docker October CMS - A source code package that allows you to quickly start a new project with October CMS.

## 🔥 Pre-condition

Firstly, you need Docker to be installed on your computer.

### ◆ Windows
```bash
https://docs.docker.com/desktop/install/windows-install/
```
### ◆ MacOS
```bash
https://docs.docker.com/desktop/install/mac-install/
```
### ◆ Linux
```bash
https://docs.docker.com/engine/install/ubuntu/
```

## 🔥 Technologies In Pack
```
※ Webserver: Nginx
※ Database: MySQL 8.0
※ PHPMyAdmin
※ PHP 8.1
```

## 🔥 Installation

### ◆ Build up Docker
```bash
cd docker-october-cms
docker compose build
docker compose up -d
```
### ◆ Access docker image 
```bash
docker exec -it tc_web bash
```

### ◆ Copy .env.example to .env 
```bash
cd docker-october-cms
cp .env.example .env
```

### ◆ Install October
```bash
php artisan october:install
```

### ◆ Run migration
```bash
php artisan october:migrate
```

## 🔥 Access Information

### ◆ PHPMyadmin
```bash
URL: http://localhost:8262
Username: tcadmin
Password: tcadmin
```

### ◆ October CMS Backend
```bash
(Default - Can change in install process)
URDL: http://localhost:4126/admin
Username: root
Password: root
```

## 🎗 Author
```bash
Nhut Nguyen Minh - nhut.nguyenminh.it@gmail.com
```
