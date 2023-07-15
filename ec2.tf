resource "aws_instance" "ec2_instances" {
  for_each = var.ec2_instances
  ami           = var.ami_id
  instance_type = each.value.ec2_instance_type
  security_groups = [
    for sg in aws_security_group.ec2_security_group : sg.id
  ]
  tags = {
    Name = "${each.key}"
  }
  key_name = aws_key_pair.ec2_instance_keypair["${each.key}"].key_name
}

