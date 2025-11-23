variable "ami_id" {
    default = "ami-09c813fb71547fc4f"
  
}

variable "environment"{
    default =  "prod"
}
# variable "instance_name"{
#     default = ["mongodb","redis","mysql"]
# }

variable "instance_name"{
    default = {
        mongodb = "t3.micro"
        redis = "t3.micro"
        mysql = "t3.small"
    }
 }
 variable "zone_id"{
 default = "Z09288351F1RG63CMSZ8A"
 }
  variable "domain_name"{

   default = "msdevsecops.fun"

 }
