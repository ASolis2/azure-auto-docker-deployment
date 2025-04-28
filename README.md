# Azure Auto Docker Deployment

This project automatically deploys a Linux virtual machine (VM) on Azure, installs Docker, and launches a live Nginx web server using a container.

## How to Use

1. Login to Azure CLI:

    ```bash
    az login
    ```

2. Make the deployment script executable:

    ```bash
    chmod +x deploy_server.sh
    ```

3. Run the deployment script:

    ```bash
    ./deploy_server.sh
    ```

4. SSH into your server (replace `your_public_ip` with your server's IP):

    ```bash
    ssh username@your_public_ip
    ```

5. Install Docker on the server:

    ```bash
    sudo apt update
    sudo apt install docker.io -y
    sudo systemctl start docker
    sudo systemctl enable docker
    docker --version
    ```

6. Test Docker:

    ```bash
    sudo docker run hello-world
    ```

7. Deploy Nginx container:

    ```bash
    sudo docker run -d -p 80:80 nginx
    ```

8. Visit your server's public IP address in a browser:

    ```
    http://your_public_ip
    ```

## Screenshots

| Step | Screenshot |
|:---|:---|
| Deployment Script Running | ![](./Screenshots/deployment_script_run.png) |
| Docker Hello World | ![](./Screenshots/docker_hello_world.png) |
| Docker Nginx Running | ![](./Screenshots/docker_nginx_running.png) |

## Future Improvements

- Automate Docker installation inside deployment script
- Add UFW (firewall) rules for extra server protection
- Set up automatic SSL certificates with Let's Encrypt

## Author

- Anthony Solis
- [GitHub Profile](https://github.com/ASolis2)
