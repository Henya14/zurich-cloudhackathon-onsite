# Decisions and lessons learned

For the networking, I decided to create one VPC with one subnet.

I decided to make the security groups for the EC2 instances an object variable, because this way the security groups can be created in a reusable way, with no need for pointless copying of ingress rules. Also because of doing it this way the security groups can be easily changed in the future.

I also decided to create the EC2 instances with a for_each loop that iterates over the `ec2_instances` variable. This makes it easier to change the EC2 instances or add new ones. The EC2 instances are `t2.micro` instances as these are small and don't cost too much.

In the future, a better approach could be to utilize auto scaling groups as they are perfect for scaling an infrastructure when it is starting to struggle and downscale when it is not needed. Using ASG would be more cost-efficient. 

I decided to host the web application by hardwiring the bucket name int the `app_ls.py` and `app.py` files, and then cloning the repo with commands on the EC2 when it executes its user data. In the future, I would take an approach that uses variables in the `.py` files and uploads the rendered `.py` files to an S3 and host it from the S3 or make the EC2 download the files when it launches.

To create the keypairs for the EC2 instances I decided to create key pairs separately and them add the public key to the keypair. This way the private key is safe, but later I would change the jenkins pipeline so it would generate the ssh-keys and then upload them to an aws ssm parameter, so other aws services could securely use the private key.

The jenkinsfile runs `terraform init` then `terraform validate` and then `terraform apply` this way the deploy only happens if something changes, because if nothing changes the apply returns with nothing to apply.



