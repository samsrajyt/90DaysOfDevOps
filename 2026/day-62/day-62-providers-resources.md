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
  A subnet requires a vpc id for it be created and the request would be rejected.
- Find all implicit dependencies in your config and list them
   aws_vpc.my-vpc.id
   aws_internet_gateway.gw.id
   aws_subnet.my-subnet.id
  aws_route_table.rt.id

---

### Task 4: Add a Security Group and EC2 Instance
Add to your config:

1. `aws_security_group` in the VPC:
   - Ingress rule: allow SSH (port 22) from `0.0.0.0/0`
   - Ingress rule: allow HTTP (port 80) from `0.0.0.0/0`
   - Egress rule: allow all outbound traffic
   - Tag: `"TerraWeek-SG"`

2. `aws_instance` in the subnet:
   - Use Amazon Linux 2 AMI for your region
   - Instance type: `t2.micro`
   - Associate the security group
   - Set `associate_public_ip_address = true`
   - Tag: `"TerraWeek-Server"`

Apply and verify -- your EC2 instance should have a public IP and be reachable.

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-62/images/Screenshot%202026-09-12%20002154.png)
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-62/images/Screenshot%202026-09-12%20002215.png)
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-62/images/Screenshot%202026-09-12%20002326.png)
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-62/images/Screenshot%202026-09-12%20002427.png)
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-62/images/Screenshot%202026-09-12%20012628.png)


### Task 5: Explicit Dependencies with depends_on
Sometimes Terraform cannot detect a dependency automatically.

1. Add a second `aws_s3_bucket` resource for application logs
2. Add `depends_on = [aws_instance.main]` to the S3 bucket -- even though there is no direct reference, you want the bucket created only after the instance
3. Run `terraform plan` and observe the order

Now visualize the entire dependency tree:
```bash
terraform graph | dot -Tpng > graph.png
```
If you don't have `dot` (Graphviz) installed, use:
```bash
terraform graph
```
and paste the output into an online Graphviz viewer.

**Document:** When would you use `depends_on` in real projects? Give two examples.


![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-62/images/graphviz.svg)

---

### Task 6: Lifecycle Rules and Destroy
1. Add a `lifecycle` block to your EC2 instance:
```hcl
lifecycle {
  create_before_destroy = true
}
```
2. Change the AMI ID to a different one and run `terraform plan` -- observe that Terraform plans to create the new instance before destroying the old one
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-62/images/Screenshot%202026-09-12%20011318.png)
