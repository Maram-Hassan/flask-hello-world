# Flask Hello World

A simple Flask app for demonstration purposes, deployable with Docker, Kubernetes, and Terraform.

## Prerequisites
Ensure you have the following installed:
- [Docker](https://docs.docker.com/get-docker/)
- [Kubernetes CLI (kubectl)](https://kubernetes.io/docs/tasks/tools/)
- [Terraform](https://www.terraform.io/downloads)
- [Minikube (for local Kubernetes)](https://minikube.sigs.k8s.io/docs/start/)

## Getting Started

### 1. Run the App Locally with Docker

You can run the app in a Docker container by following these steps:

1. **Build the Docker Image**
   ```bash
   docker build -t flask-hello-world .
   ```

2. **Run the Docker Container**
   ```bash
   docker run -p 5000:5000 flask-hello-world
   ```

3. **Access the App**
   - Open your browser and go to `http://localhost:5000`

### 2. Deploy on Kubernetes

To deploy the app on a Kubernetes cluster, follow these steps:

1. **Set up a Local Kubernetes Cluster (Optional)**
   - Start a local cluster using Minikube (skip if deploying on a cloud-managed Kubernetes service like GKE, EKS, or AKS).
     ```bash
     minikube start
     ```

2. **Apply Kubernetes Configuration Files**
   - The Kubernetes configuration files, typically named `deployment.yaml` and `service.yaml`, will create a Deployment and Service to run and expose the app.
   - Run the following commands to deploy:
     ```bash
     kubectl apply -f deployment.yaml
     kubectl apply -f service.yaml
     ```

3. **Access the Application**
   - If using Minikube, access the service with:
     ```bash
     minikube service <service-name>
     ```
   - For cloud-managed clusters, check the external IP:
     ```bash
     kubectl get services
     ```

### 3. Provision Infrastructure with Terraform

To provision infrastructure on a cloud provider (like AWS, GCP, or Azure) using Terraform, do the following:

1. **Initialize Terraform**
   - In the directory containing the Terraform files, run:
     ```bash
     terraform init
     ```

2. **Apply the Terraform Configuration**
   - Apply the configurations to create infrastructure resources.
     ```bash
     terraform apply
     ```
   - Confirm any prompts with `yes`.

3. **Verify Infrastructure**
   - Terraform will output the created resources. If the setup includes a Kubernetes cluster, you can connect your `kubectl` to the cluster and deploy the app following the steps in the Kubernetes section above.

## Cleaning Up

- **Docker**: Stop the container by pressing `CTRL+C` in the terminal where it's running or using:
  ```bash
  docker ps  # Find the container ID
  docker stop <container-id>
  ```
- **Kubernetes**: Delete the resources with:
  ```bash
  kubectl delete -f deployment.yaml
  kubectl delete -f service.yaml
  ```
- **Terraform**: Tear down infrastructure with:
  ```bash
  terraform destroy
  ```


### Jenkins pipeline
![Screenshot from 2024-10-28 20-32-40](https://github.com/user-attachments/assets/332736d2-4e10-4839-aa57-99f420bb99d4)
![Screenshot from 2024-10-28 20-35-26](https://github.com/user-attachments/assets/deeb12b1-c405-4383-af18-e7c943eba357)
![Screenshot from 2024-10-28 20-35-13](https://github.com/user-attachments/assets/055509fa-4913-48b9-98c3-f885c4a2cce3)
![Screenshot from 2024-10-28 20-35-06](https://github.com/user-attachments/assets/7d799c25-c18f-4704-b701-df44c8c59b58)
![Screenshot from 2024-10-28 20-34-56](https://github.com/user-attachments/assets/18f876c1-be2d-4cfc-9bca-7674570068a6)
![Screenshot from 2024-10-28 20-34-49](https://github.com/user-attachments/assets/ef0bd5db-2237-4138-83cd-35ab7599fa85)
### integration with email to send notification in case of sucess or failure of pipeline
![Screenshot from 2024-10-28 20-38-09](https://github.com/user-attachments/assets/aa8d3660-e2ec-4c80-9b5e-fe2de96276c9)
### image pushed to dockerhub
![Screenshot from 2024-10-28 20-40-09](https://github.com/user-attachments/assets/c7cc6125-3301-4e03-bf42-24d7daec2561)
### deployment with K8s
![Screenshot from 2024-10-28 20-45-13](https://github.com/user-attachments/assets/72cdf527-d7c8-45bf-838b-2ed458e63d76)
![Screenshot from 2024-10-28 13-18-58](https://github.com/user-attachments/assets/4e3a98dd-3d66-4033-bafc-5d8bdb9ea34a)
### Infrustucure with terraform
![Screenshot from 2024-10-07 10-24-33](https://github.com/user-attachments/assets/b21a9bad-8a69-44a3-b02a-0affe3e0f4f2)
![Screenshot from 2024-10-07 10-25-07](https://github.com/user-attachments/assets/14cbac4a-2240-4bb2-9dda-afc998fb2979)
![Screenshot from 2024-10-29 11-11-59](https://github.com/user-attachments/assets/4ae5fd0b-0261-4baf-9924-ffbbcb3407ea)
![Screenshot from 2024-10-07 10-27-31](https://github.com/user-attachments/assets/0b00a495-5d95-40fd-ade8-6b7e92dc38a7)
![Screenshot from 2024-10-07 10-27-55](https://github.com/user-attachments/assets/32c3df9f-8ee0-49c0-bc92-76ee6dacc4c0)
![Screenshot from 2024-10-29 11-11-59](https://github.com/user-attachments/assets/d77afa1a-af4b-4039-9b39-114a25cd17e2)
### app deployed on ec2
![Screenshot from 2024-10-29 11-11-47](https://github.com/user-attachments/assets/d2049b18-4c59-4e35-a08c-a1cb01073afa)
### Dashboard of using cloudwatch service
![Screenshot from 2024-10-29 11-12-05](https://github.com/user-attachments/assets/f3d85405-6f6f-4613-97c5-8a723f9df1a1)
### running stress-test commands on the instance
![Screenshot from 2024-10-29 11-18-05](https://github.com/user-attachments/assets/e79e8f27-8b00-4207-822c-a746983b48d9)
###  application’s performance changes under increased load. 
![Screenshot from 2024-10-29 11-17-19](https://github.com/user-attachments/assets/df007d27-e1ae-4bbf-9e3b-b816dd0b6202)





