resource "aws_acm_certificate" "cert" {
  provider = aws.aws_acm

  domain_name       = var.domain_name
  validation_method = "DNS"
}

resource "aws_acm_certificate_validation" "cert_validation" {
  provider                = aws.aws_acm
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_records : record.fqdn]
}