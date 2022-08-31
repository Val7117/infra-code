resource "aws_route53_zone" "valentinec2" {
  name = "www.valentinec2.com"
}

resource "aws_route53_record" "valentin_dns_record" {
  zone_id = aws_route53_zone.valentinec2.zone_id
  name    = "www.valentinec2.com"
  type    = "A"
  ttl     = 300
  records = [aws_instance.valentin_ubuntu.public_ip]
}
