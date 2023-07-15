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
      public_key: "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDMCRj3XLTTGcHIAVG7wpGhyBz5CUuR1br1BB2WcCV/1M78wNfWW/l6/Nj7nFVA4IiI9eBgsDtIQojLaBgHzLUbw975/MlDdOQ9f2iMfQfaX/YB5KfMR2xdTE9Uk0AYId6GwPfLs+0DYwzT1vk4F7hV2ga+CRD/ZXEgLTRJNKQvuzyz71j8JhFy7W6mtE6Ldsilksj9PvZhT24w9fKf+Aih4CcNQY2yWzKgFWRGpo7G+k+rZcOWytiGwVO0/puz39WF3jjDBflZgebngm699/qn/Dxm0WeoGtxkhJyUfBign5jkF1cwVLnjeOvw45BZX8PXbpwRp5QwPTdel7CKxRyq4ZsR6D914bLau6xvKqB6Kp3u10HjkMgcLr4XGTQ3a6dum+f5WYJtGF9xWZ2PloJbSP7f/uel6kBz3FDkWkCx+jzJVG84I8YCINcAJbVrrKMWgZtgavz99D54q1qzTEVkT6cN3dQNHUWg8XvZfhdYr3ypccUAYPsFTVhEuS2RC4lAzR1GmRj61n7QTXQntyu08gy88QIiTN9i7KNby01lxc1d2hINe/ZJssBuRhhuBDIs2ZymyMl5gvJy4r2t9/hRLvB6Tul+wCkGfLidKEk8A9f137i7wExroeCRsYm6jrIVzudTpfzR+kUg5fBrg4yYMN6Rlcl9JBjOG07KoozM5w== henya@DESKTOP-KBBVA00"
    }
    "ec2_instance1" : {
      instance_type: "t2.micro"
      public_key: "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDK0aHxzMfaecXucrrp3N9TTo64K4I1rrP6E539vbd4fLzNVCuuV3NBYJF3Cot9qTn8YakP5cjlsODPx+X2b9EZni8RtgozQA37ZO19FLbsCTBnSGURCFFOupSLVYA0uLteMprjv4nlGho84TZLyiHfWw2wpt9wzjekFw/sCvlVdiDl1riUbQh3tQrBUBmtCgg0rcrbe4ln5Zq7d2KPb42p5fBe+boSfwmODV5L8ObfG1a0TCxzWtyaxNaQLj3vJD1C9DTb9F+d2a/KU/iBcEdCiw5s/n+WiGN9XPHz9L7V13BWOZC/fnuNrSxwvnjXwEzvaIvNAC7t4MCIL0bigmB4cBAeFE3e1dddAixlcZA2NJaLBtME/tVm0TwvAT8NQV16nBJLPtYJ+LhkZeuBP6yRq0KMKKeV2EBR6Ng5TbNgt5hQPzAnlc835sENQdyxnjJUdQoOb2lXe9XC4GQ8U9pQXkbdOtegPlRekMt44moVuGjV3JN02JZI53ulvzpmbYLkFqHd0KcuOiA373uxDeXxAPaHWoipVIVm7ozimmDeQL9j4PJY1eQUyMCuAozOfpOJ+e1/e41AD8cmVYQA++aKFQ/my+da8Kx1xCJPxK0A/KwX/N6U3jMjuIPjn5OOH15leKT62yvbYatl45xzBUdlKzfA+cMw8yKMBWruxJ+Q2Q== henya@DESKTOP-KBBVA00"
    }
  }
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
