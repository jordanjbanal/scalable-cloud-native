# Project Genesis

### Mission Statement
> This project demonstrates core principles of building scalable, reliable cloud-native services, starting with containerization and evolving to include Infrastructure-as-Code and CI/CD.

## Overview

Project Genesis is the foundational step in a journey to build and deploy a modern web service. It starts with a simple "Hello World" API built with Python (Flask), which is then containerized using Docker. This creates a portable, reproducible, and isolated environment for the application.

## Current Features

- A simple JSON API with two endpoints: `/` and `/health`.
- A production-ready WSGI server (Gunicorn).
- A `Dockerfile` for building the application container.
- A `.dockerignore` file to ensure a lean and secure image.

## How to Run This Project Locally

### Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop/)
- [Git](https://git-scm.com/)

### Steps

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/YOUR_USERNAME/project-genesis.git
    cd project-genesis
    ```

2.  **Build the Docker image:**
    ```bash
    docker build -t project-genesis .
    ```

3.  **Run the Docker container:**
    ```bash
    docker run -d -p 5001:5000 --name genesis-api project-genesis
    ```

4.  **Test the API:**
    You can now access the API endpoints:
    - **Welcome Message:** `http://localhost:5001/`
    - **Health Check:** `http://localhost:5001/health`

    You can use a tool like `curl` or your web browser to test:
    ```bash
    curl http://localhost:5001/
    ```

5.  **Stopping the container:**
    ```bash
    docker stop genesis-api
    ```

## Next Steps (The Roadmap)

This project is designed to be a starting point. The next steps in its evolution will include:
- **CI/CD Pipeline:** Automate testing and Docker image builds using GitHub Actions.
- **Infrastructure-as-Code (IaC):** Use Terraform to provision cloud infrastructure (e.g., a Kubernetes cluster or a serverless platform) to run this container.
- **Container Registry:** Push the Docker image to a registry like Docker Hub or AWS ECR.
- **Observability:** Add logging, metrics, and tracing.