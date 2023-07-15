terraform {
  required_version = ">=1.4.0"
  required_providers {
    aws = {
        version = ">= 5.5.0"
        source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


locals {
  ec2_key_pairs = {
    "${var.ec2_instance1_name}_key" : {
      public_key: "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDJZi8Hq/TRBFZxb0fFAovOpRMoN4rgeMjnJ420ygARYMxji1hh+nDLhMm6bf6Jro5cQxLDw7riUks5nNtzesxN5qAOqP8zr7PH9UtQCGhsPFyJiCwDnuVATCXdr9Xnjsfduw3zn54Z9YFZHBC97zobKZCI3TkharqfU4dRA4+A+8QxHxkjRgHAApKtotGX+pvA+A88NrrO3mXkInQujvkch0UEbYWZS76Lfhb+aivPZhFSHjGGZqyI5cj5i2ABJ0iRahRP2qLUuMqjClirG4QCjLLoE4Uywlx+5YAp7/5X+rFrqrQuv40Rwk7d3J5P3A+MD8ch/pO6ROE4n1xelCjMb4I6di8+0R20kmuVOi0Mvi05QgdB2sFrogzHlWC6Zia1CBghJmppQRH+LddS3sQqUp0PJhGXctKDBwwf/C7aCSkhtKMppt18sF+xRTL2CjvBRxplcJhM0Umvq0csJN0sWYLXl4A9QZSs+jlZNj294UiMcApp65mW81N8pIm1HShCKLxFf5/wrjPXe5scShA6oN37RT1SIKV6WfZm7W6VPpsbY1OyAQALNtVftZIo5jW+2Wy99UtMU0x10JzDE6q3YnLqEhTJRN4XsWt2olhF7rpyYa/54YB4W0+Q0yi20oa8kbJ00tT1mx8yAgsIXO5k5THCqN/kNAAV9DEIi3/hJw== root@DESKTOP-KBBVA00"
    }
    "${var.ec2_instance2_name}_key" : {
      public_key: "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC2DY4TFnY4sGnCPaQpWAPEA7K+qNrNCDDEvq/AjmMbEFs1UPGziI6evU6qvX8mxw9EoVy4MNycdQ4bOct94pJp3JdHy31MsyXftO3Agd/h5+93B/PD6RLlCD+qGe0V6gU54jCQiIywpD7KUSVDxxwyNMSTjVTuHwG2mE631QMPLJMHLpNabxS7PzM1JQqFpMMNKlGJsfdXjR7dnvBh4G8ka4I6jG9bxNP8fdp3ZMZ1kC6VvkTHx6+TrJ+LqJqw0CuUyoHTRQeS4H5QunLu7hC04MYf6o6XFb754ezxYyFyxjSF40N+lI6q1WIJgfUw+8gWnNL8vAO9jCmEhz5IMdCiwol1wTcxuOV1VCKOZ1GP1G/gskFkEIJ+mXr9o1XIjC6OxjOPCGvaRZ8whZhnHJ/BLVdgw0fDcm2mKI5als3Vh5skOl9C87QF8T/yd68sSktWFzl6gr625CqiLPHj7PprJrDdIqrEpUnYyl2ErRRPguxlegHvXApuj0oOhSEXBLt5dPXYaCSC8eRFKd+iYm2ETQOMx5LxpOgi910yz3izwR63ah526OAIDtsU9XNBfWtzxRxFZRjg0zULYQ9VhY0jgAkv3TPs9hpXiVdi+VCVePuenLD0F0DLVPC5s/UUP/2TKck6KPhx91mZiM4bO+8KtBoDSMdnOgVBcA5mi+u4mQ== root@DESKTOP-KBBVA00"
    }
  }
}



