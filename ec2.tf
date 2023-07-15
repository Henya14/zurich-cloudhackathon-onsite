resource "aws_instance" "ec2_instance1" {
    ami = var.ami_id
    instance_type = var.ec2_instance_type
    security_groups = [
        for sg in aws_security_group.ec2_security_group : sg.id
    ]
    tags = {
        Name = "${var.ec2_instance1_name}"
    }
     key_name = aws_key_pair.ec2_instance_keypair["${var.ec2_instance1_name}_key"].key_name
}   

resource "aws_instance" "ec2_instance2" {
    ami = var.ami_id
    instance_type = var.ec2_instance_type
    security_groups = [
        for sg in aws_security_group.ec2_security_group : sg.id
    ]
    tags = {
        Name = "${var.ec2_instance1_name}"
    }
     key_name = aws_key_pair.ec2_instance_keypair["${var.ec2_instance2_name}_key"].key_name
}   