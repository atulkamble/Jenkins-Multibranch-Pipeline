# 🚀 Jenkins with a Docker-based Python Application  
## 📦 Jenkins-Multibranch-Pipeline

A complete Jenkins Multibranch Pipeline setup to build, test, and deploy a Dockerized Python Flask application via DockerHub on an EC2 instance.

---

## 📚 Prerequisites  

- Git  
- Python & pip  
- Flask  
- Docker  
- Jenkins  

---

## 🖥️ EC2 & Security Group Configuration  

1. **Launch EC2 Instance**
2. **Configure Security Group** for Inbound Traffic:
   - **Jenkins**: TCP 8080
   - **Flask**: TCP 5000
   - **SSH**: TCP 22

3. **Update DockerHub username** in `deploy.sh`

---

## ⚙️ Environment Setup (EC2)

```bash
sudo yum update -y
sudo yum install git -y
git --version
git config --global user.name "username"
git config --global user.email "email"
git config --list

sudo yum install python -y
python --version

sudo yum install pip -y
pip --version
sudo pip install flask -y
flask --version

sudo dnf install java-17-amazon-corretto -y
java --version

sudo yum install maven -y

# Jenkins repo & installation
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install jenkins -y

# Docker install & permissions
sudo yum install docker -y
sudo docker --version
sudo docker login
sudo usermod -aG docker jenkins

# Start services
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Get Jenkins admin password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
````

Access Jenkins:

```
http://<public-ip>:8080
```

---

## 📥 Clone Repository

```bash
git clone https://github.com/atulkamble/Jenkins-Multibranch-Pipeline.git
cd Jenkins-Multibranch-Pipeline
```

---

## 📂 Project Structure

Great — let’s update the **project structure** in your README accordingly with your new `tests/` directory and test file.

Here’s the updated section for your README:

```text
.
├── app.py               # Flask application code
├── deploy.sh            # Docker deployment script
├── Dockerfile           # Docker build instructions
├── Jenkinsfile          # Jenkins Pipeline definition
├── README.md            # Project documentation
├── requirements.txt     # Python dependencies
└── tests
    └── test_app.py      # Unit tests for the application

2 directories, 7 files
```

✅ I’ve also added inline comments for clarity.

---

## 📦 Manual Run / Test

```bash
python3 app.py
```

---

## 🐳 Run Deployment Script

```bash
sudo sh deploy.sh
```

Deployed container accessible at:

```
http://<public-ip>:5000
```

---

## 📋 Key CI/CD Concepts

1. **Base Environment**: Docker image with Python 3.9
2. **SCM Checkout**: Pulls code from GitHub
3. **Docker Image Build**: Builds a new Docker image for the application
4. **Test Stage**: Runs `pytest` inside the Docker container
5. **Deploy Stage**: Deploys image to server via `deploy.sh`
6. **Post Actions**: Archives test reports, cleans images

---

## 📝 deploy.sh Overview

1. **Exit on Error**
2. **Set Variables**
3. **Build Docker Image** (if needed)
4. **Tag & Push to DockerHub**
5. **Stop & Remove Existing Container**
6. **Run New Container**

**Note:** Update your DockerHub username in `deploy.sh`

Example:

```bash
REGISTRY_URL="atuljkamble"
```

---

## 🔧 Docker Maintenance

**Delete all Docker images**

```bash
sudo docker image prune -a
```

**List and delete specific Docker image**

```bash
sudo docker images
sudo docker rmi <image-id> -f
```

**List, stop and remove containers**

```bash
sudo docker container ls
sudo docker container stop <container-id>
sudo docker container rm <container-id>
```

---

## 📑 Jenkins Multibranch Pipeline Highlights

* Automatically creates a pipeline per branch in your repo
* Docker integration via `docker` CLI within stages
* Deploys via external `deploy.sh` script
* Test results archived and available in Jenkins reports

---

## 📝 Additional Notes

* SSH access required for EC2 deployment
* Adjust Security Group ports as needed
* Update DockerHub repo URL in deployment script:

  ```
  https://hub.docker.com/r/atuljkamble/my-python-app
  ```
* Adaptable to other CI/CD tools by mapping concepts to equivalent configurations

---

## 📌 Links

* **GitHub Repository**: [Jenkins-Multibranch-Pipeline](https://github.com/atulkamble/Jenkins-Multibranch-Pipeline)
* **DockerHub Repository**: [atuljkamble/my-python-app](https://hub.docker.com/r/atuljkamble/my-python-app)

---

## ✳️ Author

**Atul Kamble**
GitHub: [@atulkamble](https://github.com/atulkamble)
