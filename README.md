

# GCP_IaC_DevOps_Demo

![0_QKtvjH2UJ_ixKITk](https://user-images.githubusercontent.com/99130650/219879548-3c0705cb-a927-4476-af03-6d64c8026a67.png)

![Automating_GCP_to_Launch_VM_Instance_with_Terraform_website-1900x600](https://user-images.githubusercontent.com/99130650/219879620-99bdde53-ad8f-4333-9ccd-68fd0ec9387b.jpg)

![Automating_GCP_to_Launch_VM_Instance_with_Terraform_website-1900x600](https://user-images.githubusercontent.com/99130650/219879620-99bdde53-ad8f-4333-9ccd-68fd0ec9387b.jpg)

## Project Specifications 
![Screenshot from 2023-02-09 16-36-49](https://user-images.githubusercontent.com/103090890/217843113-dfda4ec4-7907-4f64-9716-27296ea589fa.png)

#### This infrastructure deploys a counter app  
#### Note : All Secrets And authentication must be done by you for security reasons 

-----------------------------

## Tools Used
- Terraform
- GCP 
- Kubernetes
- Jenkins (Bonus)
- Docker

------------------------------------

## Getting Started

- Setup your GCP account
- Make sure to install required tools such as (Terraform, Docker)

---------------

## Prerequisites 

- Install Terraform
- GCP Account
- (Bonus) Master Jenkins Up and Running

---------------------

## Installation 

- Clone This Repo
- Configure your GCP credentials 
``` bash
gcloud auth login
```
- Build The Dockerfile and push it to GCR 
``` bash
gcloud auth configure-docker
docker login
docker build . -t gcr.io/<docker-username>/py-app
docker push gcr.io/<docker-username>/py-app 
```
- Run Terraform files
```bash
terraform init
terraform apply
```

- After Terraform Creation SSH into VM and install ***kubectl*** or any needed software like ***gcloud*** ( You can use Ansible to Automate this step )

- Connect to the GKE private cluster 
``` bash
gcloud container clusters get-credentials <cluster_name> --zone <zone> --project <project_id>
```
- Copy the provided k8s files and run them by:
```bash
kubectl apply -f <file-name>
```

- Run the following command to get the IP Adress of your Application
``` bash
kubectl get all 
```
- Copy the IP address of LoadBalancer and insert it in your browser to access the Application 

- Now Your Infrastructure & Application Is Up and Running !!


------------------------------------


# Thank You !!





