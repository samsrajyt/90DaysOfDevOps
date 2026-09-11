## Challenge Tasks

### Task 1: Explore the AWS Provider
1. Create a new project directory: `terraform-aws-infra`
2. Write a `providers.tf` file:
   - Define the `terraform` block with `required_providers` pinning the AWS provider to version `~> 5.0`
   - Define the `provider "aws"` block with your region
3. Run `terraform init` and check the output -- what version was installed?
   hashicorp/aws v5.100.0
   
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-62/images/Screenshot%202026-09-11%20141727.png)

4. Read the provider lock file `.terraform.lock.hcl` -- what does it do?
   This file is automatically maintained by terraform init and it stores the provider version , constraints and hashes.
   
**Document:** What does `~> 5.0` mean? How is it different from `>= 5.0` and `= 5.0.0`?
`~> 5.0` means any version greater than 5.0 along with any minor/major patches but blocks v6.0
`= 5.0.0` means locking your configuration strictly to version 5.0.0 and no updates are allowed at all

---
### Task 2: Build a VPC from Scratch
Create a `main.tf` and define these resources one by one:

1. `aws_vpc` -- CIDR block `10.0.0.0/16`, tag it `"TerraWeek-VPC"`
2. `aws_subnet` -- CIDR block `10.0.1.0/24`, reference the VPC ID from step 1, enable public IP on launch, tag it `"TerraWeek-Public-Subnet"`
3. `aws_internet_gateway` -- attach it to the VPC
4. `aws_route_table` -- create it in the VPC, add a route for `0.0.0.0/0` pointing to the internet gateway
5. `aws_route_table_association` -- associate the route table with the subnet

Run `terraform plan` -- you should see 5 resources to create.

**Verify:** Apply and check the AWS VPC console. Can you see all five resources connected?
Yes 

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-62/images/Screenshot%202026-09-11%20151218.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-62/images/Screenshot%202026-09-11%20151141.png)

---

### Task 3: Understand Implicit Dependencies
Look at your `main.tf` carefully:

1. The subnet references `aws_vpc.main.id` -- this is an implicit dependency
2. The internet gateway references the VPC ID -- another implicit dependency
3. The route table association references both the route table and the subnet

Answer these questions:
- How does Terraform know to create the VPC before the subnet?
  It Creates a dependency graph and see that all the other resources need VPC first , hence VPC is created first. 
- What would happen if you tried to create the subnet before the VPC existed?
- Find all implicit dependencies in your config and list them
   aws_vpc.my-vpc.id
   aws_internet_gateway.gw.id
   aws_subnet.my-subnet.id
  aws_route_table.rt.id

---
