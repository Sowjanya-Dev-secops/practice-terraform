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
    default = "allow_all_conditions"

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
  variable "environment"{
   default = "qa"
  }

