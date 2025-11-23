variable "ami_id" {
  default     = "ami-09c813fb71547fc4f"
}
variable "instance_type" {
  default     = "t3.micro"
}

variable "ec2_tags" {
    type = map
    default = {
        Name = "terraform"
        Terraform = "true"
        project = "joindevops"
        environment = "dev"
    }
}

variable "sg_name"{
    type = string
    default = "allow_all"

}
 variable "cidr"{
    type = list
    default = ["0.0.0.0/0"]
 }

 variable "from_port"{
    default = 0

 }

 variable "to_port"{
    default = 0

 }

 variable "protocal"{
    type = string
    default = "-1"
 }

 variable "instances"{
    default = ["mongodb","redis","mysql"]
  }
 variable "zone_id"{
 default = "Z09288351F1RG63CMSZ8A"
 }
 variable "domain_name"{

   default = "msdevsecops.fun"

 }
   variable "inastance_name"{
   default = "mongodb"

  }
