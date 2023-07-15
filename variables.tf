variable "user_data_bucket_name" {
  type = string 
  description = "The name of the S3 bucket where the new user data is stored"
  default = "user-data-bucket"
}

variable "aws_region" {
  type = string 
    description = "The region where the aws resources are"
  default = "us-east-1"
}

variable "ami_id" {
  type = string 
  description = "The id of the ami image"
  default = "ami-053b0d53c279acc90" // latest ubuntu image from amazon 
}


variable "ec2_instance_type" {
  type = string 
  description = "The name of the ec2 instance type to use"
  default = "t2.micro"
}

variable "sec_group_config" {
  default = {
    "allow-22-tcp" = {
     ingress_configs = [{
        port = 22
        protocol = "tls"}
      ]
    },
    "allow-443-tcp" = {
      ingress_configs = [{
        port = 443
        protocol = "tls"}
      ]
    }
    "allow-1137-tcp" = {
     ingress_configs = [{
        port = 1137
        protocol = "tls"}
      ]
    }
    "allow-3035-tcp-udp" = {
      ingress_configs = [{
          port = 3035
          protocol = "tls"},
        {
          port = 3035
          protocol = "udp"
        },

      ]
    }
  }
}

variable "ec2_instances" {
  default = {
    "ec2_instance1" : {
      instance_type: "t2.micro"
    }
    "ec2_instance1" : {
      instance_type: "t2.micro"
    }
  }
}

variable "ec2_instance1_name" {
  type = string 
  description = "The name of first ec2 instance"
  default = "ec2_instance1"
}

variable "ec2_instance2_name" {
  type = string 
  description = "The name of second ec2 instance"
  default = "ec2_instance2"
}

variable "ec2_key_suffix" {
  type = string
  default = "_key"
}


variable "vpc_gateway_name" {
  type = string 
  description = "The name of vpc gateway"
  default = "ec2_vpc_gateway"
}


variable "vpc_route_table_name" {
  type = string 
  description = "The name of vpc route table"
  default = "ec2_vpc_route_table"
}
