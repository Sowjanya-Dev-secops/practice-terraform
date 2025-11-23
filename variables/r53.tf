resource "aws_route53_record" "roboshop" {
  zone_id = var.zone_id
  name    = "${var.inastance_name}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.terraform.private_ip]
  allow_overwrite = true 
}