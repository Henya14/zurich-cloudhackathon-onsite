resource "null_resource" "key_gen_script" {
    for_each = var.ec2_instances
    provisioner "local-exec" {
    // Removes all keys and generates new ones
    command = <<EOT
      rm *_key
      ssh-keygen -b 2048 -t rsa -f ${each.key}${var.ec2_key_suffix} -q
    EOT
  }
  
}

resource "aws_key_pair" "ec2_instance_keypair" {
    for_each = var.ec2_instances
    key_name = "${each.key}${var.ec2_key_suffix}"
    public_key = file("${each.key}${var.ec2_key_suffix}.pub")
    depends_on = [ null_resource.key_gen_script ]
}
