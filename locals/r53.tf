resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  for_each = aws_instance.example
  name    = "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
}