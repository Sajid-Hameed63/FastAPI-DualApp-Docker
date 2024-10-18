
# FastAPI-DualApp-Docker

This project demonstrates how to run two FastAPI applications concurrently inside a single Docker container using the lightweight Python Alpine base image. The project uses `supervisord` to manage both apps within the container.

## Features

- Two FastAPI apps running simultaneously:
  - **App1**: Accessible at port 8000
  - **App2**: Accessible at port 8001
- Lightweight Docker image based on Python Alpine
- Easy setup and deployment

## Project Structure

```plaintext
/fastapi-dualapp-docker
│
├── app1.py                 # First FastAPI application running on port 8000
├── app2.py                 # Second FastAPI application running on port 8001
├── supervisord.conf         # Configuration for running both apps via supervisord
├── requirements.txt         # Python dependencies (FastAPI, Uvicorn)
└── Dockerfile               # Dockerfile for building the container
```

## Getting Started

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Python 3.9+](https://www.python.org/downloads/)

### Step 1: Clone the Repository

```bash
git clone https://github.com/yourusername/fastapi-dualapp-docker.git
cd fastapi-dualapp-docker
```

### Step 2: Build the Docker Image

```bash
sudo docker build -t fastapi-dualapp-docker-cpu-only:latest .
```

### Step 3: Run the Docker Container

```bash
sudo docker run -p 8000:8000 -p 8001:8001 fastapi-dualapp-docker-cpu-only:latest
```

### Step 4: Access the Applications

- **App1**: Visit `http://localhost:8000/health_check`
- **App2**: Visit `http://localhost:8001/health_check`

Both apps will return a simple JSON response indicating that they are running.

## Supervisord Configuration

The `supervisord.conf` file is used to manage both FastAPI applications. It ensures both apps start automatically and are restarted if they fail. 

```ini
[program:app1]
command=uvicorn app1:app --host 0.0.0.0 --port 8000
autostart=true
autorestart=true

[program:app2]
command=uvicorn app2:app --host 0.0.0.0 --port 8001
autostart=true
autorestart=true
```

## Customization

You can modify the FastAPI apps or supervisord configuration as needed to add more routes, change ports, or adjust behavior.

## Contributing

Feel free to fork this project, submit issues, or open pull requests to improve it.

## License

This project is licensed under the MIT License.
