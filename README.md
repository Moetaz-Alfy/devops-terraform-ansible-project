# 🚀 DevOps Final Project  
## Terraform & Ansible – AWS EKS Infrastructure  

---

# 📌 Project Description

This project demonstrates a complete DevOps workflow using:

- **Terraform** for Infrastructure as Code (IaC)
- **AWS** for cloud infrastructure
- **Amazon EKS** for Kubernetes cluster management
- **EC2** as Bastion Host
- **Ansible** for configuration management
- **Kubernetes** for application deployment
- **GitHub** for version control  

The entire Terraform implementation is modular as required.

---

# 🎯 Project Objectives

✅ Create IAM group named `devops`  
✅ Create two IAM users (`user1`, `user2`)  
✅ Create IAM role and policy  
✅ Attach policy to devops group  
✅ Create EKS cluster  
✅ Add IAM role to EKS Access Entry  
✅ Create EC2 instance to access cluster  
✅ Output EC2 public IP  
✅ Use Ansible to deploy Kubernetes application  
✅ Document all steps  
✅ Push project to GitHub  

---

# 🏗️ Architecture Overview
IAM (Users + Group + Role + Policy)
↓
VPC Module
↓
EKS Cluster
↓
EC2 Bastion Host
↓
Ansible
↓
Kubernetes Deployment

---

# 📂 Project Structure

devops-project/
│
├── terraform/
│ ├── providers.tf
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ │
│ └── modules/
│ ├── iam/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ │
│ ├── vpc/
│ ├── eks/
│ └── ec2/
│
├── ansible/
│ ├── inventory/
│ ├── playbooks/
│ └── files/
│
├── README.md
└── .gitignore


---

# ✅ Terraform Implementation Details

## 1️⃣ IAM Module

### 🔹 What Was Done

- Created IAM Group → `devops`
- Created IAM Users:
  - `user1`
  - `user2`
- Added users to `devops` group
- Created IAM Role for EKS access
- Created IAM Policy for EKS permissions
- Attached policy to:
  - IAM Role
  - devops Group

### 🔹 Purpose

To implement secure Role-Based Access Control (RBAC) for Kubernetes cluster access.

---

## 2️⃣ VPC Module

### 🔹 What Was Done

- Created custom VPC (10.0.0.0/16)
- Created 2 Public Subnets (Multi-AZ)
- Created Internet Gateway
- Created Route Table
- Associated subnets
- Tagged subnets for Kubernetes LoadBalancer

### 🔹 Purpose

EKS requires:
- Multi-AZ architecture
- Internet connectivity
- Proper subnet tagging

---

## 3️⃣ EKS Module

### 🔹 What Was Done

- Created EKS Cluster
- Created Cluster IAM Role
- Attached:
  - AmazonEKSClusterPolicy
- Created Node Group
- Attached required worker node policies
- Created EKS Access Entry
- Attached AmazonEKSClusterAdminPolicy

### 🔹 Purpose

To provision a fully managed Kubernetes cluster with secure IAM integration.

---

## 4️⃣ EC2 Module

### 🔹 What Was Done

- Created EC2 instance inside public subnet
- Created Security Group (SSH allowed)
- Installed:
  - AWS CLI
  - kubectl
- Attached IAM Instance Profile

### 🔹 Purpose

The EC2 instance acts as a Bastion Host to:

- Access EKS cluster  
- Run kubectl  
- Allow Ansible automation  

---

# ✅ Terraform Outputs


---

# ✅ Terraform Implementation Details

## 1️⃣ IAM Module

### 🔹 What Was Done

- Created IAM Group → `devops`
- Created IAM Users:
  - `user1`
  - `user2`
- Added users to `devops` group
- Created IAM Role for EKS access
- Created IAM Policy for EKS permissions
- Attached policy to:
  - IAM Role
  - devops Group

### 🔹 Purpose

To implement secure Role-Based Access Control (RBAC) for Kubernetes cluster access.

---

## 2️⃣ VPC Module

### 🔹 What Was Done

- Created custom VPC (10.0.0.0/16)
- Created 2 Public Subnets (Multi-AZ)
- Created Internet Gateway
- Created Route Table
- Associated subnets
- Tagged subnets for Kubernetes LoadBalancer

### 🔹 Purpose

EKS requires:
- Multi-AZ architecture
- Internet connectivity
- Proper subnet tagging

---

## 3️⃣ EKS Module

### 🔹 What Was Done

- Created EKS Cluster
- Created Cluster IAM Role
- Attached:
  - AmazonEKSClusterPolicy
- Created Node Group
- Attached required worker node policies
- Created EKS Access Entry
- Attached AmazonEKSClusterAdminPolicy

### 🔹 Purpose

To provision a fully managed Kubernetes cluster with secure IAM integration.

---

## 4️⃣ EC2 Module

### 🔹 What Was Done

- Created EC2 instance inside public subnet
- Created Security Group (SSH allowed)
- Installed:
  - AWS CLI
  - kubectl
- Attached IAM Instance Profile

### 🔹 Purpose

The EC2 instance acts as a Bastion Host to:

- Access EKS cluster  
- Run kubectl  
- Allow Ansible automation  

---

# ✅ Terraform Outputs

ec2_public_ip
eks_cluster_name
eks_cluster_endpoint


These outputs are used for cluster access and automation.

---

# ✅ Ansible Implementation

## 1️⃣ Inventory

Contains:

- EC2 public IP  
- SSH configuration  
- Private key reference  

---

## 2️⃣ Playbook Workflow

The playbook performs:

✅ Connect to EC2  
✅ Configure kubeconfig  
✅ Copy Kubernetes manifests  
✅ Apply Deployment  
✅ Apply LoadBalancer Service  


