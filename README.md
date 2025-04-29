# Azure Auto Docker Deployment

This project automates the deployment of a virtual machine on Microsoft Azure, installs Docker, and runs an Nginx container.

## Project Summary

- **Cloud Platform**: Microsoft Azure
- **Tools Used**: Azure CLI, Docker, Bash
- **App Deployed**: Nginx Web Server

---

## How to Use

### 1. Login to Azure CLI:
```bash
az login
```

### 2. Make the script executable:
```bash
chmod +x deploy_server.sh
```

### 3. Run the script:
```bash
./deploy_server.sh
```

### 4. SSH into the server and install Docker:
```bash
ssh username@your_public_ip
sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
```

### 5. Deploy Nginx container:
```bash
sudo docker run -d -p 80:80 nginx
```

### 6. Visit your server’s public IP address:
```bash
http://your_public_ip
```

---

## Screenshots

| Step | Screenshot |
|:----|:-----------|
| Deployment Script Run Part 1 | ![](./screenshots/deployment_part1.png) |
| Deployment Script Run Part 2 | ![](./screenshots/deployment_part2.png) |
| Deployment Script Run Part 3 | ![](./screenshots/deployment_part3.png) |
| Deployment Script Run Part 4 | ![](./screenshots/deployment_part4.png) |
| Deployment Script Run Part 5 | ![](./screenshots/deployment_part5.png) |
| Docker Hello World | ![](./screenshots/docker_hello_world.png) |
| Docker Nginx Running | ![](./screenshots/docker_nginx_running.png) |

---

## Future Improvements

- Docker Compose setup for multi-container applications
- Automatic security updates on deployed server

---

## Author

- **Anthony Solis** – [GitHub Profile](https://github.com/ASolis2)


