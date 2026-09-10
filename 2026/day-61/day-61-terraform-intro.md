## Challenge Tasks

### Task 1: Understand Infrastructure as Code
Before touching the terminal, research and write short notes on:

1. What is Infrastructure as Code (IaC)? Why does it matter in DevOps?
A. Infrastructure as code is a modern devops practise which helps in managing and provisioning resources like servers, databases, networks using machine readable configuration files instead of clicking through manual cloud consoles. It's automating the process of creating infrastructure.
It very important in Devops as it reduces human error , increases consistency (it stops the "it works on my machine problem") and also increases cost saving (as we can destroy and bring the resources as and when its needed), faster deployments .

2. What problems does IaC solve compared to manually creating resources in the AWS console?
A. Problem solved by IaC:
   Human Error 
   Slow system setups
   Configuration Drift
   No History Tracking
   

4. How is Terraform different from AWS CloudFormation, Ansible, and Pulumi?
A. 
   Terraform vs CloudFormation 
   Terraform can handle multi cloud environment whereas AWS CloudFormation is only limited to AWS ecosystem
   The syntax language for terraform is HCL where cloud formation uses standard JSON or YAML.
   CloudFormation handles and manages the state automatically whereas terraform requires you to handle and secure a backend ( An s3) to handle its state file.


6. What does it mean that Terraform is "declarative" and "cloud-agnostic"?

Write this in your own words -- not copy-pasted definitions.

---
