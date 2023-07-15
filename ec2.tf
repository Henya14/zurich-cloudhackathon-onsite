data "cloudinit_config" "ec2_config" {
  gzip          = true
  base64_encode = true
  part {
    content_type = "text/cloud-config"
    content = file("${path.module}/ec2-cloud-config.yaml")
  }
}

resource "aws_instance" "ec2_instances" {
  for_each = var.ec2_instances
  ami           = var.ami_id
  instance_type = each.value.instance_type
  security_groups = [
    for sg in aws_security_group.ec2_security_group : sg.id
  ]
  tags = {
    Name = "${each.key}"
  }
  key_name = aws_key_pair.ec2_instance_keypair["${each.key}"].key_name
  user_data = data.cloudinit_config.ec2_config.rendered
}
