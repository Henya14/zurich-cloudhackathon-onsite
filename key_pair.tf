resource "aws_key_pair" "ec2_instance_keypair" {
    for_each = local.ec2_key_pairs
    key_name = each.key
    public_key = each.value.public_key
}
