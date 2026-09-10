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
   CloudFormation handles and manages the state automatically whereas terraform requires you to handle and secure a backend ( An s3) to handle    its state file.

   Terraform vs Ansible
   Ansible is widely used for configuration management inside the VM which is created by terraform to install softwares , manage packages .
   Terraform maintains the state i.e the snapshot of the architecture whereas Ansible is stateless, it connects to server over ssh and            executes a series of commands mentioned in playbooks. 


6. What does it mean that Terraform is "declarative" and "cloud-agnostic"?
   Cloud-agnostic means Terraform uses a single workflow, engine and language to manage multiple cloud providers though each cloud still          requires its own specific resource definitions within the codebase.
   Declarative means you define the desired end state of your infrastructure and terraform figures out how to make it happen .
   



---



### Task 2: Install Terraform and Configure AWS
1. Install Terraform:
```bash
# macOS
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

# Linux (amd64)
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

# Windows
choco install terraform
```

2. Verify:
```bash
terraform -version
```



![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-61/images/Screenshot%202026-09-10%20232257.png)

3. Install and configure the AWS CLI:
```bash
aws configure
# Enter your Access Key ID, Secret Access Key, default region (e.g., ap-south-1), output format (json)
```

4. Verify AWS access:
```bash
aws sts get-caller-identity
```

You should see your AWS account ID and ARN.

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-61/images/AWS_Configure.png)


---

### Task 3: Your First Terraform Config -- Create an S3 Bucket
Create a project directory and write your first Terraform config:

```bash
mkdir terraform-basics && cd terraform-basics
```

Create a file called `main.tf` with:
1. A `terraform` block with `required_providers` specifying the `aws` provider
2. A `provider "aws"` block with your region
3. A `resource "aws_s3_bucket"` that creates a bucket with a globally unique name

Run the Terraform lifecycle:
```bash
terraform init      # Download the AWS provider
terraform plan      # Preview what will be created
terraform apply     # Create the bucket (type 'yes' to confirm)
```

Go to the AWS S3 console and verify your bucket exists.

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-61/images/Screenshot%202026-09-10%20235625.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-61/images/Screenshot%202026-09-11%20001238.png)

**Document:** What did `terraform init` download? What does the `.terraform/` directory contain?

`terraform init` downloads the AWS provider 
`.terraform/` directory contains the aws provider executable 

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-61/images/Screenshot%202026-09-11%20001523.png)

---



### Task 4: Add an EC2 Instance
In the same `main.tf`, add:
1. A `resource "aws_instance"` using AMI `ami-0f5ee92e2d63afc18` (Amazon Linux 2 in ap-south-1 -- use the correct AMI for your region)
2. Set instance type to `t2.micro`
3. Add a tag: `Name = "TerraWeek-Day1"`

Run:
```bash
terraform plan      # You should see 1 resource to add (bucket already exists)
terraform apply
```

Go to the AWS EC2 console and verify your instance is running with the correct name tag.

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-61/images/Screenshot%202026-09-11%20003018.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-61/images/Screenshot%202026-09-11%20004127.png)

![](![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-61/images/Screenshot%202026-09-11%20003233.png)

**Document:** How does Terraform know the S3 bucket already exists and only the EC2 instance needs to be created?
Terraform keeps track of everything it creates.

---

### Task 5: Understand the State File
Terraform tracks everything it creates in a state file. Time to inspect it.

1. Open `terraform.tfstate` in your editor -- read the JSON structure
2. Run these commands and document what each returns:
```bash
terraform show                          # Human-readable view of current state
terraform state list                    # List all resources Terraform manages
terraform state show aws_s3_bucket.<name>   # Detailed view of a specific resource
terraform state show aws_instance.<name>
```

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-61/images/Screenshot%202026-09-11%20005042.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-61/images/Screenshot%202026-09-11%20005229.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-61/images/Screenshot%202026-09-11%20005429.png)

3. Answer these questions in your notes:
   - What information does the state file store about each resource?
   Ans. It contains all the metadata of the resources that are created.
   The Terraform state file (terraform.tfstate) stores the metadata and mapping for every resource managed by your configuration.
   Here is what the state file actually tracks for each resource:
   **Resource Mapping**: ID and Address connect your configuration code (like aws_instance.web) to the real-world infrastructure object (like i-0123456789abcdef0).
   **Resource Attributes**: Current Values store properties assigned by the cloud provider, such as private IP addresses, public DNS names, and creation timestamps.
   **Dependencies**: Dependency Graph tracks which resources rely on other resources so Terraform knows the correct order to destroy or update them.
   **Metadata**: Serial Numbers and Lineage record version changes and prevent two people from applying conflicting updates at the same time.
   **Provider Info**: Provider Configurations track which specific provider version and plugin manage each individual resource.
   - Why should you never manually edit the state file?
   Ans. If the state file get corrupted then terraform will loose the track of the resource/infrastructure. This will lead to accidental deletion of resources.
   - Why should the state file not be committed to Git?
   Ans. It contains plain-text secrets and sensitive data.

---

### Task 6: Modify, Plan, and Destroy
1. Change the EC2 instance tag from `"TerraWeek-Day1"` to `"TerraWeek-Modified"` in your `main.tf`
2. Run `terraform plan` and read the output carefully:
   - What do the `~`, `+`, and `-` symbols mean?
     `~` - in place update
     `+` - create 
     `-` - destroy 
   - Is this an in-place update or a destroy-and-recreate?
     This is an in-place update

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-61/images/Screenshot%202026-09-11%20011310.png)

3. Apply the change

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-61/images/Screenshot%202026-09-11%20011736.png)

4. Verify the tag changed in the AWS console

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-61/images/Screenshot%202026-09-11%20011916.png)

5. Finally, destroy everything:
```bash
terraform destroy
```
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-61/images/Screenshot%202026-09-11%20012119.png)

6. Verify in the AWS console -- both the S3 bucket and EC2 instance should be gone
Both the instance and S3 bucket were deleted

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-61/images/Screenshot%202026-09-11%20012338.png)
---


