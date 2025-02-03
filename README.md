# AWS Load Balanced Infrastructure with Terraform

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)

## Table of Contents

- [Overview](#Overview)
- [How_It_Works](#How_It_Works)
- [Features](#Features)
- [Prerequisites](#Prerequisites)
- [Architecture](#Architecture)
- [Installation](#Installation)


## Overview
This Terraform project creates a highly available infrastructure on AWS featuring:
- **Application Load Balancer (ALB)** Distributes incoming traffic across multiple EC2 instances.
- **Multi-AZ Deployment** with instances in separate Availability Zones.
- **VPC Networking** Includes public and private subnets, NAT gateways, and security groups.
- **Auto Scaling Group (ASG)** Automatically scales the number of EC2 instances based on CPU utilization.
- **EC2 Instances** Host the web application (Apache HTTPD) and serve dynamic content.

## How It Works
- **User Request** A user accesses the application via the ALB DNS name.
- **Load Balancing** The ALB routes the request to one of the healthy EC2 instances.
- **Dynamic Response** The instance serves an HTML page with a custom message and its private IP.
- **Scaling** If CPU utilization exceeds 70%, the ASG adds more instances. If it drops below 30%, instances are removed.

## Features
- 🛡️ VPC with Public & Private Subnets
- 🌐 Internet & NAT Gateways for secure connectivity
- 🔄 Application Load Balancer with health checks
- 🔒 Security Groups with least-privilege access
- 🖥️ EC2 instances with Nginx serving private IP information

## Prerequisites
- AWS Account with valid credentials
- Terraform v1.0+ installed
- AWS CLI configured
- Cloud9 Environment (recommended) or local setup
- IAM permissions for:
  - EC2
  - VPC
  - ELBv2

## Architecture
```bash
+-----------------+
            |   Internet      |
            +--------+--------+
                     |
            +--------v--------+
            |  Application    |
            |  Load Balancer  |
            +--------+--------+
                     |
        +------------+------------+
        |                         |
+-------v-------+        +--------v-------+
|  EC2 Instance |        |  EC2 Instance  |
|  (AZ 1a)      |        |  (AZ 1b)       |
+-------+-------+        +--------+-------+
        |                         |
+-------v-------+        +--------v-------+
|   Private     |        |   Private      |
|   Subnet      |        |   Subnet       |
+-------+-------+        +--------+-------+
        |                         |
+-------v-------+        +--------v-------+
|    NAT GW     |        |    NAT GW      |
+-------+-------+        +--------+-------+
        |                         |
+-------v-----------------v-------+
|              VPC                |
|         (10.0.0.0/16)           |
+---------------------------------+

```

![Demo](/assetes/Record.gif)

## Installation

1. **Install Terraform**: Ensure that Terraform is installed on your local machine. You can download it from the [official Terraform website](https://www.terraform.io/downloads.html).

2. **Configure AWS CLI**: Set up the AWS CLI with your credentials. You can follow the instructions [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html).

3. **Clone the Repository**: Clone this repository to your local machine.
    ```sh
    git clone https://github.com/abdelhamed-4A/Terraform-ECS-Application-with-ALB-and-Auto-Scaling.git
    cd Terraform-ECS-Application-with-ALB-and-Auto-Scaling
    ```

4. **Initialize Terraform**: Initialize the Terraform configuration.
    ```sh
    terraform init
    ```

5. **Plan the Infrastructure**: Generate and review the execution plan.
    ```sh
    terraform plan
    ```

6. **Apply the Configuration**: Apply the Terraform configuration to provision the infrastructure.
    ```sh
    terraform apply
    ```

7. **Verify the Infrastructure**: Verify that the infrastructure has been provisioned correctly by logging into the AWS Management Console.
