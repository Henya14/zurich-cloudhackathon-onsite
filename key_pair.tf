resource "aws_key_pair" "ec2_instance_keypair" {
    for_each = var.ec2_instances
    key_name = "${each.key}${var.ec2_key_suffix}"
    public_key = each.value.public_key
}
